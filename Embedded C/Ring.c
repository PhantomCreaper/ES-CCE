#include <LPC17xx.h>

unsigned int ring = 0x10000000;

void delay() {
    unsigned int j;
    for (j = 0; j < 1000000; j++); 
}

int rightRotate(int n, unsigned int d)
{
    /* In n>>d, first d bits are 0. To put last 3 bits of at
            first, do bitwise or of n>>d with n <<(INT_BITS
       - d) */
    return (n >> d) | (n << (32 - d));
}

int main()
{
		LPC_PINCON->PINSEL0 &= 0xFF0000FF;
    LPC_GPIO0->FIODIR |= 0x00000FF0;	
		LPC_PINCON->PINSEL4 &= 0XFCFFFFFF;//2.12
    LPC_GPIO2->FIODIR &= 0X00000000;
		while(1){
			if(ring==0x00000001){
				ring = 0x10000000;
			}
				//if ((LPC_GPIO2->FIOPIN & (1 << 12)) == 0){
							ring = rightRotate(ring, 1);
				//}
				LPC_GPIO0->FIOSET=ring;
				delay();
				LPC_GPIO0->FIOCLR=ring;
			
				
		}
}
