
#include<LPC17xx.h>
unsigned long LED = 0x00000010;
unsigned int I;
unsigned int J;
int main(void){
	SystemInit();
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL0 = 0x00000000;
	LPC_GPIO0->FIODIR =0X00000FF0;
	while(1){
		LED = 0X00000010;
		for(I=1; I<9; I++){
			LPC_GPIO0->FIOSET=LED;
			for(J=0;J<2000000;J++);
				LED<<=1;
			}
		LED = 0X00000010;
		for(I=1; I<9; I++){
			LPC_GPIO0->FIOCLR=LED;
			for(J=0;J<2000000;J++);
			LED<<=1;
			}
		}
}

