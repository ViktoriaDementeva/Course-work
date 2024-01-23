`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2024 15:59:56
// Design Name: 
// Module Name: TM1638_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TM1638_TB;

logic clk, clk_kHz, stb, rst;
logic [11:0] cnt;
logic [11:0] cnt_01;
logic [7:0] com1;
logic [7:0] com2;
logic [3:0] cnt2;
logic [7:0] dio;

TM1638 uut(.clk(clk), .stb(stb), .rst(rst), .dio(dio));

initial 
begin
clk = 1'd0;
rst = 1'd1;
stb = 1'd1;
cnt2 = 4'd0;
#20;
rst = 1'd0;
end

initial forever
begin
#5 clk = ~clk;
end

always_ff@(posedge clk)
$display ("clk=%d", "cnt=%d", clk, cnt);
endmodule
