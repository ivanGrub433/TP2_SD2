################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../component/lists/fsl_component_generic_list.c 

C_DEPS += \
./component/lists/fsl_component_generic_list.d 

OBJS += \
./component/lists/fsl_component_generic_list.o 


# Each subdirectory must supply rules for building sources it contributes
component/lists/%.o: ../component/lists/%.c component/lists/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MCXC444VLH -DCPU_MCXC444VLH_cm0plus -DSERIAL_PORT_TYPE_UART=1 -DSDK_DEBUGCONSOLE=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\board" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\source" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\drivers" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\CMSIS" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\CMSIS\m-profile" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\utilities" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\utilities\debug_console\config" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\device" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\device\periph2" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\utilities\debug_console" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\component\serial_manager" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\component\lists" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\utilities\str" -I"C:\Users\ivang\Documents\MCUXpressoIDE_25.6.136\workspace\SD2_TP2\component\uart" -O0 -fno-common -g3 -gdwarf-4 -Wall -c -ffunction-sections -fdata-sections -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m0plus -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-component-2f-lists

clean-component-2f-lists:
	-$(RM) ./component/lists/fsl_component_generic_list.d ./component/lists/fsl_component_generic_list.o

.PHONY: clean-component-2f-lists

