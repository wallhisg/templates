#include <ets_sys.h>
#include <osapi.h>
#include <os_type.h>
#include <user_interface.h>
#include <uart.h>
#include <espconn.h>
#include <mem.h>
#include <gpio.h>
#include <gpio16.h>
#include <c_types.h>

#include <user_config.h>

static os_timer_t led_timer;
static int led_value = 0;

void led_service_cb(void *args)
{
    //Do blinky stuff
    if (GPIO_REG_READ(GPIO_OUT_ADDRESS) & BIT2)
    {
        //Set GPIO2 to LOW
        gpio_output_set(0, BIT2, BIT2, 0);
    }
    else
    {
        //Set GPIO2 to HIGH
        gpio_output_set(BIT2, 0, BIT2, 0);
    }
    os_printf("Blink\r\n");
}

void app_init()
{
    uart_div_modify(0, UART_CLK_FREQ / 9600);
    WRITE_PERI_REG(PAD_XPD_DCDC_CONF, (READ_PERI_REG(PAD_XPD_DCDC_CONF) & 0xffffffbc) | (uint32_t)0x1);  
    WRITE_PERI_REG(RTC_GPIO_CONF, (READ_PERI_REG(RTC_GPIO_CONF) & (uint32_t)0xfffffffe) | (uint32_t)0x0);
    WRITE_PERI_REG(RTC_GPIO_ENABLE, (READ_PERI_REG(RTC_GPIO_ENABLE) & (uint32_t)0xfffffffe) | (uint32_t)0x1);
	os_printf("SDK version:%s\n", system_get_sdk_version());
    os_timer_setfn(&led_timer, (os_timer_func_t *)led_service_cb, NULL);
    os_timer_arm(&led_timer, 1000, 1);
}

void user_init(void)
{
    system_init_done_cb(app_init);
}
