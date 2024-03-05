#include <LPC17xx.h>

unsigned char counter = 0x01; 

void delay() {
    unsigned int j;
    for (j = 0; j < 100000; j++); 
	for (j = 0; j < 100000; j++); 
	for (j = 0; j < 100000; j++); 
	for (j = 0; j < 100000; j++); 
}

void up_down_counter() {
    while (1) {
        delay();        
        // SW2 (CNB1 pin 7)
        if ((LPC_GPIO2->FIOPIN & (1 << 12)) == 0) {  
                counter--;
        } else {
                counter++;
        }
        LPC_GPIO0->FIOPIN = (counter << 4); 
    }
}
int main() {
    
    LPC_PINCON->PINSEL4 &= 0XFCFFFFFF;//2.12
    LPC_GPIO2->FIODIR &= 0X00000000;
	 LPC_PINCON->PINSEL0 &= 0xFF0000FF;
    LPC_GPIO0->FIODIR |= 0x00000FF0;
    up_down_counter();
    return 0;
}
