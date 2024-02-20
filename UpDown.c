
#include<LPC17xx.h>
int main() {
    unsigned int i, j;
     unsigned char counter = 0x001;  
    LPC_PINCON->PINSEL0 &= 0xFF0000FF;
    LPC_GPIO0->FIODIR |= 0x00000FF0;
	while (1) { 
			LPC_GPIO0->FIOPIN = (counter << 4); 
			//for (j = 0; j < 10; j++); 
			counter++; 
			if (counter == 0xFF) { 
						counter = 0xFF; 
				} 
			}
			counter = 0xFF;
    while (1) {
        LPC_GPIO0->FIOPIN = (counter << 4);
        //for (j = 0; j < 10; j++);
        counter--;
        if (counter == 0xFF) {
            counter = 0xFF;
        }
    }
		
}

