/*	Игра 2048 для NES
	Для сборки используется cc65 
 */

#include "defines.c"
#include <stdlib.h>

// импортируем 4 экрана (упакованные в RLE), которые используются в игре
#include "screens/1.h" // Начальный экран 
#include "screens/2.h" // Игровая область
#include "screens/3.h" // Финальный экран

// массив указателей на экраны
const unsigned char* const Screens[] = { n1, n2, n3 };

// отклчение вывода на экран
void All_Off(void) {
	PPU_CTRL = 0;
	PPU_MASK = 0;
}

// включение вывода на экран
void All_On(void) {
	PPU_CTRL = 0x90;
	PPU_MASK = 0x1e;
}

// загрузка выбранной палитры в PPU
void Load_Palette(unsigned char palette_index) {
	All_Off();
	PPU_ADDRESS = 0x3f;
	PPU_ADDRESS = 0x00;
	for (index = 0; index < 16; ++index)
		if (palette_index == 0) {
			PPU_DATA = MainPalette[index];
		}
		else {
			PPU_DATA = WinPalette[index];
		}
	All_On();
}

// звук
void beep(unsigned char b, unsigned char t) {
	*((unsigned char*)0x4015) = 0x0f;
	*((unsigned char*)0x4000) = 0x0f;
	*((unsigned char*)0x4001) = 0xab + b;
	*((unsigned char*)0x4003) = 0x01 + t;
}

// завершаем игру и выводим GAME OVER!
void GameOver(void) {
	stopGame = 1;
	needRedraw = 1;
	n2[383] = 0x35;
	n2[384] = 0x33;
	n2[385] = 0x36;
	n2[386] = 0x37;
	n2[387] = 0x00;
	n2[388] = 0x32;
	n2[389] = 0x38;
	n2[390] = 0x37;
	n2[391] = 0x39;
	n2[392] = 0x3f;
	beep(3, 3);
}

// завершаем игру и выводим поздравление
void YouWin(void) {
	stopGame = 1;
	needRedraw = 1;
	n2[384] = 0x3a;
	n2[385] = 0x32;
	n2[386] = 0x3b;
	n2[387] = 0x00;
	n2[388] = 0x3c;
	n2[389] = 0x3d;
	n2[390] = 0x3e;
	n2[391] = 0x3f;
	beep(0, 3);
	win = 1;
}

// заполним следующую свободную клетку
void putRandom(void) {
	// проверим окончание игры
	index = 0;
	for (y = 0; y <= 3; y++) 
		for (x = 0; x <= 3; x++) 
			if (field[x][y] > 0) index++;
	if (index == 16) {
		GameOver(); 
	} else {
		// поместим новое числов в свободную ячейку
		do {
			x = rand() % 4;
			y = rand() % 4;
		} while (field[x][y] > 0);
		// с вероятностью 25% выводим 4
		if (state == 1) 
			if (rand() % 4 == 0) {
				field[x][y] = 2;
			} else {
				field[x][y] = 1;
			}
	}
	needRedraw = 1;
}

// инициализация игры
void initGame(void) {
	// инициализация рандомайзера и очистка игрового поля
	int t;
	win = 0;
	stopGame = 1;
	srand(Frame_Count);
	for (y = 0; y <= 3; y++)
		for (x = 0; x <= 3; x++) 
			field[x][y] = 0x00;
	// скроем строку GAME OVER!
	for (t = 383; t <= 392; t++) 
		n2[t] = 0x00;
	// читы
	if (countrer == 5) {
		field[0][0] = 10;
		field[0][1] = 10;
	}
	// покажем два первых числа
	state = 1;
	putRandom();
	putRandom();
	state = 0;
	Load_Palette(0);
	countrer = 0;
}

// сделать сдвиг одной линии во временной таблице
void shiftOne(void) {
	if (fld[3] == 0) { fld[3] = fld[2]; fld[2] = 0; }
	if (fld[2] == 0) { fld[2] = fld[1]; fld[1] = 0; }
	if (fld[1] == 0) { fld[1] = fld[0]; fld[0] = 0; }
	if (fld[3] == 0) { fld[3] = fld[2]; fld[2] = 0; }
	if (fld[2] == 0) { fld[2] = fld[1]; fld[1] = 0; }
	if (fld[3] == 0) { fld[3] = fld[2]; fld[2] = 0; }
}

// сделать сдвиг со сложением
void fillField(unsigned char x0, unsigned char x1, unsigned char x2, unsigned char x3, unsigned char y0, unsigned char y1, unsigned char y2, unsigned char y3) {
	// заполнить временную строку из игрового поля
	fld[0] = field[x0][y0];
	fld[1] = field[x1][y1];
	fld[2] = field[x2][y2];
	fld[3] = field[x3][y3];
	// сделать сдвиг массива
	shiftOne();
	// выполнить сложение
	if ((fld[2] == fld[3]) && (fld[2] > 0)) { fld[2]++; fld[3] = 0; if (fld[2] == 11) YouWin(); }
	if ((fld[1] == fld[2]) && (fld[1] > 0)) { fld[1]++; fld[2] = 0; if (fld[1] == 11) YouWin(); }
	if ((fld[0] == fld[1]) && (fld[0] > 0)) { fld[0]++; fld[1] = 0; if (fld[0] == 11) YouWin(); }
	// повторно сделать сдвиг массива
	shiftOne();
	// вернуть значения из временной строки в игровое поле
	field[x0][y0] = fld[0];
	field[x1][y1] = fld[1];
	field[x2][y2] = fld[2];
	field[x3][y3] = fld[3];
}

// обработчик нажатия клавиш
void move_logic(void) {
	// прочитаем джойстик
	Get_Input();
	// анализируем курсор только в режиме игры
	if ((state == 1) && (stopGame == 0)) {
		index = 0;
		if (((joypad1 & RIGHT) != 0) && ((joypad1old & RIGHT) == 0))	for (index = 0; index < 4; ++index) { fillField(0, 1, 2, 3, index, index, index, index); beep(1, 0);}	// нажали вправо
		if (((joypad1 & LEFT) != 0)  && ((joypad1old & LEFT) == 0))		for (index = 0; index < 4; ++index) { fillField(3, 2, 1, 0, index, index, index, index); beep(3, 0);}	// нажали влево
		if (((joypad1 & DOWN) != 0)  && ((joypad1old & DOWN) == 0))		for (index = 0; index < 4; ++index) { fillField(index, index, index, index, 0, 1, 2, 3); beep(2, 0);}	// нажали вниз
		if (((joypad1 & UP) != 0)    && ((joypad1old & UP) == 0))		for (index = 0; index < 4; ++index) { fillField(index, index, index, index, 3, 2, 1, 0); beep(4, 0);}	// нажали вверх
		// если была нажата кнопка, разместим следующее число
		if (index > 0) putRandom();
	}
	// анализируем кнопку START
	if (((joypad1 & START) != 0) && ((joypad1old & START) == 0)) {
		// все возможные обработчики кнопки Start
		if ((((state == 2) || (stopGame == 1)) && (win == 0)) || ((win == 0) && (state == 3))) {
			initGame();
			state = 1;
		}
		// когда нажали Start после окна поздравлений, выведем картинку
		if (win == 1) {
			Load_Palette(1);
			win = 0;
			state = 2;
		}
		needRedraw = 1;
		stopGame = 0;
		beep(0, 3);
	}
	// читы
	if (state == 0) {
		if (((joypad1 & UP) != 0) && ((joypad1old & UP) == 0)) countrer++;
	}
}

// заполнить 4 позиции числа
void fillChar(int adr, unsigned char x0, unsigned char x1, unsigned char x2, unsigned char x3) {
	n2[adr]     = x0;
	n2[adr + 1] = x1;
	n2[adr + 2] = x2;
	n2[adr + 3] = x3;
}

// мапер между массивом данных и выводимыми на экран символами
void mapField(unsigned char n, int adr) {
	fillChar(adr, 0x00, 0x00, 0x00, 0x00);				// очистим поле
	if (n ==  1) fillChar(adr, 0x00, 0x00, 0x00, 0x03);	// 2
	if (n ==  2) fillChar(adr, 0x00, 0x00, 0x00, 0x05);	// 4
	if (n ==  3) fillChar(adr, 0x00, 0x00, 0x00, 0x09);	// 8
	if (n ==  4) fillChar(adr, 0x00, 0x00, 0x02, 0x07);	// 16
	if (n ==  5) fillChar(adr, 0x00, 0x00, 0x04, 0x03);	// 32
	if (n ==  6) fillChar(adr, 0x00, 0x00, 0x07, 0x05);	// 64
	if (n ==  7) fillChar(adr, 0x00, 0x02, 0x03, 0x09);	// 128
	if (n ==  8) fillChar(adr, 0x00, 0x03, 0x06, 0x07);	// 256
	if (n ==  9) fillChar(adr, 0x00, 0x06, 0x02, 0x03);	// 512
	if (n == 10) fillChar(adr, 0x02, 0x01, 0x03, 0x05);	// 1024
	if (n == 11) fillChar(adr, 0x03, 0x01, 0x05, 0x09);	// 2048
}

// обновить экран
void drawScreen(void) {
	// отключим вывод на экран и подготовим данные для вывода
	All_Off();
	PPU_ADDRESS = 0x20;
	PPU_ADDRESS = 0x00;
	// перерисовка игрового поля
	if (state == 1) {
		for (y = 0; y <= 3; y++) 
			for (x = 0; x <= 3; x++) 
				mapField(field[x][y], map[y * 4 + x]);
	}
	// выводим данные в PPU
	UnRLE(Screens[state]);
	// не включаем экран при обратном ходе луча
	Wait_Vblank();		
	All_On();
	// экран обновлён, сборосим признак необходимости обновления
	needRedraw = 0;
}

// вход в игру
void main(void) {
	//инициализация
	initGame();
	state = 0;
	needRedraw = 1;
	// основной цикл
	while (1) {
		// ждём обратный ход луча
		while (NMI_flag == 0);
		// проверим джойстик		
		move_logic();
		// проверим, нужно ли обновить экран
		if (needRedraw != 0) drawScreen();
		// сбросить флаг прерывания
		NMI_flag = 0;
	}
}