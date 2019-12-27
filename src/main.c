/* Copyright 2019 SiFive, Inc */
/* SPDX-License-Identifier: Apache-2.0 */

#include <stdio.h>

#define DELAY 	200
#define ON		1
#define OFF 	0
#define NUM_LED	3

#define LED_R 	0x00400000
#define LED_B 	0x00200000
#define LED_G 	0x00080000


extern void setupGPIO();
extern int setLED(int color, int state);
extern void delay(int time);




int main() {
	int error = 0;
	int ledNum = 0;
	int color[NUM_LED] = {LED_G, LED_R, LED_B};

	setupGPIO();

	while (!error) {
		setLED(color[ledNum], ON);
		delay(DELAY);
		error = setLED(color[ledNum++], OFF);
		delay(DELAY);
		if (ledNum >= NUM_LED){
			ledNum = 0;
		}
	}

	return 0;
}

