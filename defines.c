// определим адреса PPU
#define PPU_CTRL		*((unsigned char*)0x2000)
#define PPU_MASK		*((unsigned char*)0x2001)
#define PPU_STATUS		*((unsigned char*)0x2002)
#define OAM_ADDRESS		*((unsigned char*)0x2003)
#define SCROLL			*((unsigned char*)0x2005)
#define PPU_ADDRESS		*((unsigned char*)0x2006)
#define PPU_DATA		*((unsigned char*)0x2007)
#define OAM_DMA			*((unsigned char*)0x4014)

// коды нажатых клавиш
#define RIGHT		0x01
#define LEFT		0x02
#define DOWN		0x04
#define UP			0x08
#define START		0x10
#define SELECT		0x20
#define B_BUTTON	0x40
#define A_BUTTON	0x80

// Глобальные переменные разместим в нулевой странице
#pragma bss-name(push, "ZEROPAGE")
unsigned char NMI_flag;
unsigned char Frame_Count;
unsigned char index;
unsigned char joypad1;
unsigned char joypad1old;
unsigned char joypad1test; 
unsigned char joypad2; 
unsigned char joypad2old;
unsigned char joypad2test;
unsigned char needRedraw;
unsigned char state;
unsigned char fld[4];
unsigned char x;
unsigned char y;
unsigned char stopGame = 0;

// массив игровой области
unsigned char field[4][4];

// мапер между массивом игровой области и координатами экрана в PPU
int map[16] = { 53, 59, 65, 71, 141, 147, 153, 159, 229, 235, 241, 247, 317, 323, 329, 335 };

// основная палитра
const unsigned char PALETTE[] = { 
	0x0f, 0x00, 0x10, 0x30,
	0x0f, 0x01, 0x11, 0x21,
	0x0f, 0x06, 0x16, 0x26,
	0x0f, 0x09, 0x19, 0x38 
};

// Прототипы процедур и функций
void All_Off(void);
void All_On(void);
void Load_Palette(void);
void move_logic (void);
void drawScreen(void);
void Wait_Vblank(void);
void __fastcall__ UnRLE(const unsigned char *data);
void Get_Input(void);
