
/*===============================[ Inclusions ]===============================*/
#include "SD2_board.h"
#include <math.h>
#include "MEF_acelerometro.h"
#include "power_mode_switch.h"
#include "key.h"
#include "fxls8974.h"
#include "fsl_smc.h"

/*=================================[ Macros ]=================================*/
#define MAX_ACC2_INIT 		0

#define BLINK_PERIOD_MS 	250
#define INFORM_PERIOD_MS	10000


/*==============================[ Enumerations ]==============================*/
/* Estados de la MEF */
typedef enum {
	EST_reposo = 0,
	EST_cayendo,
	EST_informando
} EST_MEF_acelerometro_enum;

/*=========================+=====[ Variables ]================================*/
static EST_MEF_acelerometro_enum EST_MEF_acelerometro;
static int32_t count_1ms_blink;
static int32_t count_1ms_informando;

volatile float aceleracion_actual= 0.0f,aceleracion_maxima= 0.0f;


/*===============================[ Functions ]================================*/


extern void MEF_acelerometro_init(){

	/* Al iniciar el sistema comienza en el modo de reposo */
	EST_MEF_acelerometro = EST_reposo;

	/* Seteo el estado de caida como falso */
	/* Seteo la aceleracion maxima inicial */
	fxls8974_init();
	/* Inicio el clock en modo bajo consumo */
	//APP_SetClockVlpr();
    /* Show power mode on console */
    //APP_ShowPowerMode(SMC_GetPowerModeState(SMC));

}

extern void MEF_acelerometro(){

	/* Maquina de estados finitos */
	switch (EST_MEF_acelerometro) {

		/* Caso reposo */
		case EST_reposo:

			//__WFI();   // Duerme el micro hasta que llegue una interrupción
			oled_putString(4, 2, (uint8_t*)"SD2 TP2 Gruboy-Rodrigez", OLED_COLOR_WHITE,OLED_COLOR_BLACK);
			if(fxls8974_freefall_detectado()) {
				/* Enciendo el led rojo */
				board_setLed(BOARD_LED_ID_ROJO, BOARD_LED_MSG_ON);
				oled_clearScreen(OLED_COLOR_BLACK);
	    		/* Seteo el periodo del blink */
	    		count_1ms_blink = BLINK_PERIOD_MS;

				/* Transicion al estado EST_cayendo */
				EST_MEF_acelerometro = EST_cayendo;
				APP_SetClockRunFromVlpr();
				aceleracion_maxima = 0.0f;
			}

		break;

		/* Caso cayendo */
		case EST_cayendo:
			aceleracion_actual = Obtener_Valor();
		    /*
		     * Guardar máximo impacto
		     */
		    if(aceleracion_actual > aceleracion_maxima)
		    {
		        aceleracion_maxima = aceleracion_actual;

		    }

			/* Toglge del led para indicar caida */
			if(!count_1ms_blink) {
				/* Tiempo de blink */
				count_1ms_blink = BLINK_PERIOD_MS;

				/* Tooggle del led rojo */
				board_setLed(BOARD_LED_ID_ROJO, BOARD_LED_MSG_TOGGLE);
			}

			/* Guardar la maxima aceleracion */
			//mma8451_evaluate_max_acc2();

			if(!fxls8974_freefall_detectado()) {
				/* Transicion al estado EST_informando */
				EST_MEF_acelerometro = EST_informando;

				/* Limpio posibles pulsadas erroneas */
//				key_getPressEv(BOARD_SW_ID_1);

				/* Seteo el periodo del blink */
				count_1ms_blink = BLINK_PERIOD_MS;

				/* Seteo el tiempo que se muestra la informacion */
				count_1ms_informando = INFORM_PERIOD_MS;
			}

		break;


		/* Caso informando */
		case EST_informando:
			/* Toglge del led para indicar caida */
			if(!count_1ms_blink) {
				/* Tiempo de blink */
				count_1ms_blink = BLINK_PERIOD_MS;

				/* Tooggle del led rojo */
				board_setLed(BOARD_LED_ID_ROJO, BOARD_LED_MSG_TOGGLE);
			}


			/* Muestro la maxima aceleracion en el display*/
			oled_inform_max_acc(aceleracion_maxima);

			if(key_getPressEv(BOARD_SW_ID_2) || !count_1ms_informando) {
				/* Transiciono al estado EST_reposo */
				EST_MEF_acelerometro = EST_reposo;
				APP_SetClockVlpr();
				/* Limpio la pantalla */
				oled_clearScreen(OLED_COLOR_BLACK);
				/* Apago el led rojo */
				board_setLed(BOARD_LED_ID_ROJO, BOARD_LED_MSG_OFF);

			}

		break;
	}
}

void MEF_acelerometro_task_1ms(void) {
	if(EST_MEF_acelerometro == EST_cayendo ||
			EST_MEF_acelerometro == EST_informando) {
		/* Decremento el contador */
		if (count_1ms_blink) {
			count_1ms_blink--;
		}
	}

	if(EST_MEF_acelerometro == EST_informando) {
		/* Decremento el contador */
		if (count_1ms_informando) {
			count_1ms_informando--;
		}
	}
}
