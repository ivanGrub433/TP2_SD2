/*
 * MEF_acelerometro.h
 *
 *  Created on: Jun 2024
 *      Author: Fede
 */

/*===============================[ Inclusions ]===============================*/
#include "SD2_board.h"
#include "key.h"
#include "oled.h"

#ifndef MEF_ACELEROMETRO_H_
#define MEF_ACELEROMETRO_H_

/*===============================[ Functions ]================================*/
extern void MEF_acelerometro_init(void);
extern void MEF_acelerometro(void);

void MEF_acelerometro_task_1ms(void);

#endif /* MEF_ACELEROMETRO_H_ */
