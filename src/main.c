#include <driver/gpio.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>

#define RELAY 2


void hello_task(void *pvParameter)
{
    printf("Hello world!\n");
    for (int i = 10; i >= 0; i--) {
        printf("Restarting in %d seconds...\n", i);
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
    printf("Restarting now.\n");
    fflush(stdout);
    esp_restart();
}


void led_blink(void *pvParams)
{
    printf("Resetting pin\n");
    gpio_reset_pin(RELAY);
    printf("Setting pin direction\n");
    gpio_set_direction(RELAY,GPIO_MODE_OUTPUT);
    while (1) {
        printf("Setting GPIO level low\n");
        esp_err_t error_num = gpio_set_level(RELAY,0);
        printf("error_num: %d\n", error_num);
        vTaskDelay(pdMS_TO_TICKS(500));
        printf("Setting GPIO level high\n");
        error_num = gpio_set_level(RELAY,1);
        printf("error_num: %d\n", error_num);
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}


void app_main()
{
    xTaskCreate(&hello_task, "hello_task", 2048, NULL, 5, NULL);
    xTaskCreate(&led_blink,"LED_BLINK",8*1024,NULL,5,NULL);
}