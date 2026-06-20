
/*===============================[ Inclusions ]===============================*/

#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include "SD2_board.h"
#include "board.h"
#include "oled.h"
#include "MEF_acelerometro.h"

#include "pin_mux.h"
#include "SD2_I2C.h"
#include "key.h"

#include "fsl_i2c.h"
#include "pin_mux.h"
#include "fxls8974.h"

#include "peripherals.h"
#include "clock_config.h"
#include "fsl_debug_console.h"
#include "clock_config.h"
#include "fsl_smc.h"
#include "key.h"
#include "power_mode_switch.h"
#include "fsl_common.h"
#include "fsl_smc.h"
#include "fsl_llwu.h"
#include "fsl_rcm.h"
#include "fsl_lptmr.h"
#include "fsl_port.h"
#include "MEF_acelerometro.h"
/* TODO: insert other definitions and declarations here. */
extern void BOARD_InitHardware(void);
/*===================================[ Main ]=================================*/
int main(void){

	BOARD_InitPins();
    BOARD_BootClockRUN();
    BOARD_InitDebugConsole();
	/* Init board hardware. */
	BOARD_InitBootClocks();
	BOARD_InitHardware();
    board_init();
	key_init();
	SD2_I2C_init();
	board_configSPI0();
	/* CONFIGURACIÓN CRÍTICA: Activar interrupción cada 1ms */
	SysTick_Config(SystemCoreClock / 1000);
	oled_init();
	oled_setContrast(16);

    /* Inicializar MEF acelerometro */
	MEF_acelerometro_init();

	/* Habilitar el vector compartido de los puertos C y D */
	EnableIRQ(PORTC_PORTD_IRQn);

	/* Habilitar interrupciones globales (si no están) */
	__enable_irq();


    /* Enter an infinite loop */
    while(true) {
    	MEF_acelerometro();
    }

    return 0 ;
}

/*===========================[ Function implementation ]======================*/
void SysTick_Handler(void) {
	/* Tareas periodicas relacionada con SW */
	key_periodicTask1ms();

	/* Se descuentan los contadores correspondientes */
	MEF_acelerometro_task_1ms();
}
