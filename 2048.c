/*	���� 2048 ��� NES
	��� ������ ������������ cc65 
 */


#include "defines.c"
#include <stdlib.h>

// ����������� 4 ������ (����������� � RLE), ������� ������������ � ����
#include "screens/1.h" // ��������� ����� 
#include "screens/2.h" // ������� �������
#include "screens/3.h" // ���� ��������
#include "screens/4.h" // ����� �������

// ������ ���������� �� ������
const unsigned char * const All_Backgrounds[]={n1,n2,n3,n4};

// �������� ��������� ��������� ������
void putRandom(void) {
	x = rand() % 4;
	y = rand() % 4;
	z = 1;

	// ��������, ��������� �� ��� �����
	while ((field[x][y] > 0) && (state == 1)) {
		x = rand() % 4;
		y = rand() % 4;
		z++;
		// ���� ��� ������ ���������, �������� ����
		if (z == 16) {
			state = 2;
		}
	}
	if (state == 1) {
		// � ������������ 25% ������� 4
		if (rand() % 4 == 0) {
			field[x][y] = 2;
		}
		else {
			field[x][y] = 1;
		}
	}
	needRedraw = 1;
}

// ������� ������� ����
void initGame(void) {
	srand(Frame_Count);
	for (y = 0; y <= 3; y++) {
		for (x = 0; x <= 3; x++) {
			field[x][y] = 0x00;
		}
	}
	state = 1;
	putRandom();
	putRandom();
	state = 0;
}

// ���� � ����
void main (void) {
	//�������������
	initGame();
	Load_Palette();
	state = 0; // ������ ����
	needRedraw = 1;

	// �������� ����
	while (1){ 	
		// ��� �������� ��� ����
		while (NMI_flag == 0); 

		// �������� ��������		
		move_logic();

		// ��������, ����� �� �������� �����
		if (needRedraw != 0) {
			drawScreen();
		}
		// �������� ���� ����������
		NMI_flag = 0;
	}
}

// ��������� ������ �� �����
void All_Off(void) {
	PPU_CTRL = 0;
	PPU_MASK = 0;
}

// ��������� ������ �� �����
void All_On(void) {
	PPU_CTRL = 0x90; // screen is on, NMI on
	PPU_MASK = 0x1e;
}

// �������� �������� ������� � PPU
void Load_Palette (void) {
	All_Off();
	PPU_ADDRESS = 0x3f;
	PPU_ADDRESS = 0x00;
	for( index = 0; index < sizeof(PALETTE); ++index ){
		PPU_DATA = PALETTE[index];
	}
	All_On();
}

// ������� ����� ����� �����
void shiftOne(void) {
	if (fld[3] == 0) { fld[3] = fld[2]; fld[2] = 0; }
	if (fld[2] == 0) { fld[2] = fld[1]; fld[1] = 0; }
	if (fld[1] == 0) { fld[1] = fld[0]; fld[0] = 0; }
	if (fld[3] == 0) { fld[3] = fld[2]; fld[2] = 0; }
	if (fld[2] == 0) { fld[2] = fld[1]; fld[1] = 0; }
	if (fld[3] == 0) { fld[3] = fld[2]; fld[2] = 0; }
}

// ������� ����� ������� �� ���������
void shiftLine(void) {
	shiftOne();
	if ((fld[2] == fld[3]) && (fld[2] > 0)) { fld[2]++; fld[3] = 0; if (fld[2] == 11) state = 3; }
	if ((fld[1] == fld[2]) && (fld[1] > 0)) { fld[1]++; fld[2] = 0; if (fld[1] == 11) state = 3; }
	if ((fld[0] == fld[1]) && (fld[0] > 0)) { fld[0]++; fld[1] = 0; if (fld[0] == 11) state = 3; }	
	shiftOne();
}

// ��������� ������ � ������� �������� �� ������
void fillFldX(unsigned char n0, unsigned char n1, unsigned char n2, unsigned char n3, unsigned char rw) {
	fld[0] = field[rw][n0];
	fld[1] = field[rw][n1];
	fld[2] = field[rw][n2];
	fld[3] = field[rw][n3];
	shiftLine();
	field[rw][n0] = fld[0];
	field[rw][n1] = fld[1];
	field[rw][n2] = fld[2];
	field[rw][n3] = fld[3];
}

// ��������� ������ � ������� �������� �� �������
void fillFldY(unsigned char n0, unsigned char n1, unsigned char n2, unsigned char n3, unsigned char rw) {
	fld[0] = field[n0][rw];
	fld[1] = field[n1][rw];
	fld[2] = field[n2][rw];
	fld[3] = field[n3][rw];
	shiftLine();
	field[n0][rw] = fld[0];
	field[n1][rw] = fld[1];
	field[n2][rw] = fld[2];
	field[n3][rw] = fld[3];
}

// ���������� ������� ������
void move_logic(void) {
	// ��������� ��������
	Get_Input();
	// ����������� ������ ������ � ������ ����
	if (state == 1) {
		if (((joypad1 & RIGHT) != 0) && ((joypad1old & RIGHT) == 0)) { // ������ ������
			for (index = 0; index < 4; ++index) fillFldY(0, 1, 2, 3, index);
			putRandom();
		}
		if (((joypad1 & LEFT) != 0) && ((joypad1old & LEFT) == 0)) { // ������ �����
			for (index = 0; index < 4; ++index) fillFldY(3, 2, 1, 0, index);
			putRandom();
		}
		if (((joypad1 & DOWN) != 0) && ((joypad1old & DOWN) == 0)) { // ������ ����
			for (index = 0; index < 4; ++index) fillFldX(0, 1, 2, 3, index);
			putRandom();
		}
		if (((joypad1 & UP) != 0) && ((joypad1old & UP) == 0)) { // ������ �����
			for (index = 0; index < 4; ++index) fillFldX(3, 2, 1, 0, index);
			putRandom();
		}
	}
	// ����������� ������ START
	if (((joypad1 & START) != 0) && ((joypad1old & START) == 0)) {
		if (state != 1) {
			initGame();
			state = 1;
			needRedraw = 1;
		}
	}
}

// ����� ����� �������� ������ � ���������� �� ����� ���������
void mapField(unsigned char n, int adr) {
	n2[adr]   = 0x00;
	n2[adr+1] = 0x00;
	n2[adr+2] = 0x00;
	n2[adr+3] = 0x00;

	//2
	if (n == 1) { 
		n2[adr + 3] = 0x03; 
	}
	//4
	if (n == 2) { 
		n2[adr + 3] = 0x05; 
	}
	//8
	if (n == 3) { 
		n2[adr + 3] = 0x09; 
	}
	//16
	if (n == 4) { 
		n2[adr + 2] = 0x02;
		n2[adr + 3] = 0x07;
	}
	//32
	if (n == 5) {
		n2[adr + 2] = 0x04;
		n2[adr + 3] = 0x03;
	}
	//64
	if (n == 6) { 
		n2[adr + 2] = 0x07;
		n2[adr + 3] = 0x05;
	}
	//128
	if (n == 7) { 
		n2[adr + 1] = 0x02;
		n2[adr + 2] = 0x03;
		n2[adr + 3] = 0x09;
	}
	//256
	if (n == 8) { 
		n2[adr + 1] = 0x03;
		n2[adr + 2] = 0x06;
		n2[adr + 3] = 0x07;
	}
	//512
	if (n == 9) { 
		n2[adr + 1] = 0x06;
		n2[adr + 2] = 0x02;
		n2[adr + 3] = 0x03;
	}
	//1024
	if (n == 10) { 
		n2[adr] = 0x02;
		n2[adr + 1] = 0x01;
		n2[adr + 2] = 0x03;
		n2[adr + 3] = 0x05;
	}
	//2048
	if (n == 11) {
		n2[adr] = 0x03;
		n2[adr + 1] = 0x01;
		n2[adr + 2] = 0x05;
		n2[adr + 3] = 0x09;
	}
}

// �������� �����
void drawScreen(void) {
	// �������� ����� �� ����� � ���������� ������ ��� ������
	All_Off();
	PPU_ADDRESS = 0x20;
	PPU_ADDRESS = 0x00;
	if (state == 1) {
		z = 0;
		for (y = 0; y <= 3; y++) {
			for (x = 0; x <= 3; x++) {
				mapField(field[x][y], map[z]);
				z++;
			}
		}
	}
	// ������� ������ � PPU
	UnRLE(All_Backgrounds[state]);
	Wait_Vblank();		// �� �������� ����� ��� �������� ���� ����
	All_On();

	// ����� �������, �������� ������� ������������� ����������
	needRedraw = 0;
}