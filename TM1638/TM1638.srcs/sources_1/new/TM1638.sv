`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2024 15:46:16
// Design Name: 
// Module Name: TM1638
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


module TM1638(
input logic clk,
input logic stb,
input logic rst,
output logic dio
);

    logic [11:0] cnt;
    logic [11:0] cnt_01;
    logic clk_kHz;
    logic [7:0] com1;
    logic [7:0] com2;
    logic [3:0] cnt2;
    logic [7:0] i;
    
    assign com1 = 8'b01000000;
    assign com2 = 8'b11000000;
    
   always_ff@(posedge clk)
   if (rst)
    begin
   cnt <= 12'd0;
   clk_kHz <= 1'd0;
    end
    
   else
   
   begin
     if (cnt < 12'd999)
     cnt <= cnt + 12'd1;
        else
            begin
           cnt <= 12'd0;
           clk_kHz <= ~clk_kHz;
            end
            end
            
   always_ff@(posedge clk)
   if (rst)
   cnt_01 <= 12'd0;
   else
   cnt_01 <= cnt_01 + 12'd1;
            
   
   always_ff@(negedge clk_kHz)
    if (rst)
    begin
    dio <= 1'd0;
    i <= 8'd0;
    cnt2 <= 4'd0;
    end
    else
            begin
            if (cnt2 <= 4'd8)
            begin
            cnt2 <= cnt2 + 4'd1;
            dio <= com1[i];   
            i <= i+8'd1;
            end
            //else 
//            if (cnt1 >= 12'd1000 && cnt < 12'd999)
////            begin
////            //cnt2 <= 4'd0;
////            dio <= 1'd0;
////            i <= 8'd0;
//            clk_kHz <= 1'd1;
//            end
           // end
end   
  
 
    
   
endmodule
