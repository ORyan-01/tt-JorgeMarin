`default_nettype none
module tt_um_jmarin_3lfcc (
    input wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input wire ena,
    input wire clk,
    input wire rst_n
);
    wire [7:0] pwm;
    wire scl1, scl2, sda1_o, sda2_o, sda1_oe, sda2_oe;
    wire oled_sclk, oled_sdin, oled_cs, oled_dc;
    top u_top (
        .clk_i(clk), .rst_ni(rst_n),
        .scl_1_o(scl1), .sda_1_i(uio_in[6]), .sda_1_o(sda1_o), .sda_1_oe(sda1_oe),
        .scl_2_o(scl2), .sda_2_i(uio_in[7]), .sda_2_o(sda2_o), .sda_2_oe(sda2_oe),
        .pwm_o(pwm), .ioSclk(oled_sclk), .ioSdin(oled_sdin), .ioCs(oled_cs), .ioDc(oled_dc),
        .btn1(ui_in[0]), .uart_rx_i(ui_in[1])
    );
    assign uo_out = pwm;
    assign uio_out = {sda2_o, sda1_o, oled_dc, oled_cs, oled_sdin, oled_sclk, scl2, scl1};
    assign uio_oe = {sda2_oe, sda1_oe, 6'b111111};
    wire _unused = &{ena, 1'b0};
endmodule
