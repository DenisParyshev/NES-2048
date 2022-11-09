/*	���� 2048 ��� NES
	��� ������ ������������ cc65 
 */

#include "defines.c"
#include <stdlib.h>

// ����������� 4 ������ (����������� � RLE), ������� ������������ � ����
#include "screens/1.h" // ��������� ����� 
#include "screens/2.h" // ������� �������
#include "screens/3.h" // ��������� �����

// ������ ���������� �� ������
const unsigned char* const Screens[] = { n1, n2, n3 };

// ��������� ������ �� �����
void All_Off(void) {
	PPU_CTRL = 0;
	PPU_MASK = 0;
}

// ��������� ������ �� �����
void All_On(void) {
	PPU_CTRL = 0x90;
	PPU_MASK = 0x1e;
}

// �������� ��������� ������� � PPU
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

// ����
void beep(unsigned char b, unsigned char t) {
	*((unsigned char*)0x4015) = 0x0f;
	*((unsigned char*)0x4000) = 0x0f;
	*((unsigned char*)0x4001) = 0xab + b;
	*((unsigned char*)0x4003) = 0x01 + t;
}

// ��������� ���� � ������� GAME OVER!
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

// ��������� ���� � ������� ������������
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

// �������� ��������� ��������� ������
void putRandom(void) {
	// �������� ��������� ����
	index = 0;
	for (y = 0; y <= 3; y++) 
		for (x = 0; x <= 3; x++) 
			if (field[x][y] > 0) index++;
	if (index == 16) {
		GameOver(); 
	} else {
		// �������� ����� ������ � ��������� ������
		do {
			x = rand() % 4;
			y = rand() % 4;
		} while (field[x][y] > 0);
		// � ������������ 25% ������� 4
		if (state == 1) 
			if (rand() % 4 == 0) {
				field[x][y] = 2;
			} else {
				field[x][y] = 1;
			}
	}
	needRedraw = 1;
}

// ������������� ����
void initGame(void) {
	// ������������� ������������ � ������� �������� ����
	int t;
	win = 0;
	stopGame = 1;
	srand(Frame_Count);
	for (y = 0; y <= 3; y++)
		for (x = 0; x <= 3; x++) 
			field[x][y] = 0x00;
	// ������ ������ GAME OVER!
	for (t = 383; t <= 392; t++) 
		n2[t] = 0x00;
	// ����
	if (countrer == 5) {
		field[0][0] = 10;
		field[0][1] = 10;
	}
	// ������� ��� ������ �����
	state = 1;
	putRandom();
	putRandom();
	state = 0;
	Load_Palette(0);
	countrer = 0;
}

// ������� ����� ����� ����� �� ��������� �������
void shiftOne(void) {
	if (fld[3] == 0) { fld[3] = fld[2]; fld[2] = 0; }
	if (fld[2] == 0) { fld[2] = fld[1]; fld[1] = 0; }
	if (fld[1] == 0) { fld[1] = fld[0]; fld[0] = 0; }
	if (fld[3] == 0) { fld[3] = fld[2]; fld[2] = 0; }
	if (fld[2] == 0) { fld[2] = fld[1]; fld[1] = 0; }
	if (fld[3] == 0) { fld[3] = fld[2]; fld[2] = 0; }
}

// ������� ����� �� ���������
void fillField(unsigned char x0, unsigned char x1, unsigned char x2, unsigned char x3, unsigned char y0, unsigned char y1, unsigned char y2, unsigned char y3) {
	// ��������� ��������� ������ �� �������� ����
	fld[0] = field[x0][y0];
	fld[1] = field[x1][y1];
	fld[2] = field[x2][y2];
	fld[3] = field[x3][y3];
	// ������� ����� �������
	shiftOne();
	// ��������� ��������
	if ((fld[2] == fld[3]) && (fld[2] > 0)) { fld[2]++; fld[3] = 0; if (fld[2] == 11) YouWin(); }
	if ((fld[1] == fld[2]) && (fld[1] > 0)) { fld[1]++; fld[2] = 0; if (fld[1] == 11) YouWin(); }
	if ((fld[0] == fld[1]) && (fld[0] > 0)) { fld[0]++; fld[1] = 0; if (fld[0] == 11) YouWin(); }
	// �������� ������� ����� �������
	shiftOne();
	// ������� �������� �� ��������� ������ � ������� ����
	field[x0][y0] = fld[0];
	field[x1][y1] = fld[1];
	field[x2][y2] = fld[2];
	field[x3][y3] = fld[3];
}

// ���������� ������� ������
void move_logic(void) {
	// ��������� ��������
	Get_Input();
	// ����������� ������ ������ � ������ ����
	if ((state == 1) && (stopGame == 0)) {
		index = 0;
		if (((joypad1 & RIGHT) != 0) && ((joypad1old & RIGHT) == 0))	for (index = 0; index < 4; ++index) { fillField(0, 1, 2, 3, index, index, index, index); beep(1, 0);}	// ������ ������
		if (((joypad1 & LEFT) != 0)  && ((joypad1old & LEFT) == 0))		for (index = 0; index < 4; ++index) { fillField(3, 2, 1, 0, index, index, index, index); beep(3, 0);}	// ������ �����
		if (((joypad1 & DOWN) != 0)  && ((joypad1old & DOWN) == 0))		for (index = 0; index < 4; ++index) { fillField(index, index, index, index, 0, 1, 2, 3); beep(2, 0);}	// ������ ����
		if (((joypad1 & UP) != 0)    && ((joypad1old & UP) == 0))		for (index = 0; index < 4; ++index) { fillField(index, index, index, index, 3, 2, 1, 0); beep(4, 0);}	// ������ �����
		// ���� ���� ������ ������, ��������� ��������� �����
		if (index > 0) putRandom();
	}
	// ����������� ������ START
	if (((joypad1 & START) != 0) && ((joypad1old & START) == 0)) {
		// ��� ��������� ����������� ������ Start
		if ((((state == 2) || (stopGame == 1)) && (win == 0)) || ((win == 0) && (state == 3))) {
			initGame();
			state = 1;
		}
		// ����� ������ Start ����� ���� ������������, ������� ��������
		if (win == 1) {
			Load_Palette(1);
			win = 0;
			state = 2;
		}
		needRedraw = 1;
		stopGame = 0;
		beep(0, 3);
	}
	// ����
	if (state == 0) {
		if (((joypad1 & UP) != 0) && ((joypad1old & UP) == 0)) countrer++;
	}
}

// ��������� 4 ������� �����
void fillChar(int adr, unsigned char x0, unsigned char x1, unsigned char x2, unsigned char x3) {
	n2[adr]     = x0;
	n2[adr + 1] = x1;
	n2[adr + 2] = x2;
	n2[adr + 3] = x3;
}

// ����� ����� �������� ������ � ���������� �� ����� ���������
void mapField(unsigned char n, int adr) {
	fillChar(adr, 0x00, 0x00, 0x00, 0x00);				// ������� ����
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

// �������� �����
void drawScreen(void) {
	// �������� ����� �� ����� � ���������� ������ ��� ������
	All_Off();
	PPU_ADDRESS = 0x20;
	PPU_ADDRESS = 0x00;
	// ����������� �������� ����
	if (state == 1) {
		for (y = 0; y <= 3; y++) 
			for (x = 0; x <= 3; x++) 
				mapField(field[x][y], map[y * 4 + x]);
	}
	// ������� ������ � PPU
	UnRLE(Screens[state]);
	// �� �������� ����� ��� �������� ���� ����
	Wait_Vblank();		
	All_On();
	// ����� �������, �������� ������� ������������� ����������
	needRedraw = 0;
}

// ���� � ����
void main(void) {
	//�������������
	initGame();
	state = 0;
	needRedraw = 1;
	// �������� ����
	while (1) {
		// ��� �������� ��� ����
		while (NMI_flag == 0);
		// �������� ��������		
		move_logic();
		// ��������, ����� �� �������� �����
		if (needRedraw != 0) drawScreen();
		// �������� ���� ����������
		NMI_flag = 0;
	}
}