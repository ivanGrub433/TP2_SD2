################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/fsl_clock.c \
../drivers/fsl_common.c \
../drivers/fsl_common_arm.c \
../drivers/fsl_ftfx_cache.c \
../drivers/fsl_ftfx_controller.c \
../drivers/fsl_ftfx_flash.c \
../drivers/fsl_ftfx_flexnvm.c \
../drivers/fsl_gpio.c \
../drivers/fsl_i2c.c \
../drivers/fsl_llwu.c \
../drivers/fsl_lptmr.c \
../drivers/fsl_lpuart.c \
../drivers/fsl_rcm.c \
../drivers/fsl_smc.c \
../drivers/fsl_spi.c \
../drivers/fsl_uart.c 

C_DEPS += \
./drivers/fsl_clock.d \
./drivers/fsl_common.d \
./drivers/fsl_common_arm.d \
./drivers/fsl_ftfx_cache.d \
./drivers/fsl_ftfx_controller.d \
./drivers/fsl_ftfx_flash.d \
./drivers/fsl_ftfx_flexnvm.d \
./drivers/fsl_gpio.d \
./drivers/fsl_i2c.d \
./drivers/fsl_llwu.d \
./drivers/fsl_lptmr.d \
./drivers/fsl_lpuart.d \
./drivers/fsl_rcm.d \
./drivers/fsl_smc.d \
./drivers/fsl_spi.d \
./drivers/fsl_uart.d 

OBJS += \
./drivers/fsl_clock.o \
./drivers/fsl_common.o \
./drivers/fsl_common_arm.o \
./drivers/fsl_ftfx_cache.o \
./drivers/fsl_ftfx_controller.o \
./drivers/fsl_ftfx_flash.o \
./drivers/fsl_ftfx_flexnvm.o \
./drivers/fsl_gpio.o \
./drivers/fsl_i2c.o \
./drivers/fsl_llwu.o \
./drivers/fsl_lptmr.o \
./drivers/fsl_lpuart.o \
./drivers/fsl_rcm.o \
./drivers/fsl_smc.o \
./drivers/fsl_spi.o \
./drivers/fsl_uart.o 


# Each subdirectory must supply rules for building sources it contributes
drivers/%.o: ../drivers/%.c drivers/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MCXC444VLH -DCPU_MCXC444VLH_cm0plus -DSERIAL_PORT_TYPE_UART=1 -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\board" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\source" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\drivers" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\CMSIS" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\CMSIS\m-profile" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\utilities" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\utilities\debug_console\config" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\device" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\device\periph2" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\utilities\debug_console" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\component\serial_manager" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\component\lists" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\utilities\str" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\component\uart" -O0 -fno-common -g3 -gdwarf-4 -Wall -c -ffunction-sections -fdata-sections -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-drivers

clean-drivers:
	-$(RM) ./drivers/fsl_clock.d ./drivers/fsl_clock.o ./drivers/fsl_common.d ./drivers/fsl_common.o ./drivers/fsl_common_arm.d ./drivers/fsl_common_arm.o ./drivers/fsl_ftfx_cache.d ./drivers/fsl_ftfx_cache.o ./drivers/fsl_ftfx_controller.d ./drivers/fsl_ftfx_controller.o ./drivers/fsl_ftfx_flash.d ./drivers/fsl_ftfx_flash.o ./drivers/fsl_ftfx_flexnvm.d ./drivers/fsl_ftfx_flexnvm.o ./drivers/fsl_gpio.d ./drivers/fsl_gpio.o ./drivers/fsl_i2c.d ./drivers/fsl_i2c.o ./drivers/fsl_llwu.d ./drivers/fsl_llwu.o ./drivers/fsl_lptmr.d ./drivers/fsl_lptmr.o ./drivers/fsl_lpuart.d ./drivers/fsl_lpuart.o ./drivers/fsl_rcm.d ./drivers/fsl_rcm.o ./drivers/fsl_smc.d ./drivers/fsl_smc.o ./drivers/fsl_spi.d ./drivers/fsl_spi.o ./drivers/fsl_uart.d ./drivers/fsl_uart.o

.PHONY: clean-drivers

