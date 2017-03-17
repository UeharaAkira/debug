#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include "mbed.h"

Serial pc(USBTX, USBRX);

AnalogIn analog1(p20);

float Analog1;

int main(){
    while(1){
        Analog1 = analog1*255;
        pc.printf("%c",(int)Analog1);
        wait(0.01); 
    }
}