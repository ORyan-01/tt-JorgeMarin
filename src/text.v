`default_nettype none
module textEngine (
    input wire clk_i,
    input wire [9:0] pixel_address_i,
    output wire [7:0] pixel_data_o,
    output wire [5:0] char_address_o,
    input wire [7:0] char_data_i
);
    wire [2:0] columnAddress;
    wire topRow;
    wire [7:0] chosenChar;
    wire [11:0] font_address;
    wire [7:0] font_data;
    reg [7:0] outputBuffer;
    assign char_address_o = {pixel_address_i[9:8],pixel_address_i[6:3]};
    assign columnAddress = pixel_address_i[2:0];
    assign topRow = !pixel_address_i[7];
    assign chosenChar = (char_data_i >= 8'd32 && char_data_i <= 8'd126) ? char_data_i : 8'd32;
    assign font_address = ((chosenChar - 8'd32) << 4) + (columnAddress << 1) + (topRow ? 12'd0 : 12'd1);
    font_rom u_font_rom(.address_i(font_address), .data_o(font_data));
    always @(posedge clk_i) outputBuffer <= font_data;
    assign pixel_data_o = outputBuffer;
endmodule
