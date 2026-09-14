# PUCV 3LFCC IHP 26b

The external OLED RESET pin must be wired to the chip `rst_n` line. The RTL reset is now synchronous with the original screen startup sequence, so the dedicated OLED reset GPIO is removed without removing the OLED function.

Pin map: `uo[7:0]` PWM/debug; `uio[0:5]` ADC SCL + OLED SCLK/SDIN/CS/DC; `uio[6:7]` ADC SDA bidirectional; `ui[0]` BTN1; `ui[1]` UART RX.
