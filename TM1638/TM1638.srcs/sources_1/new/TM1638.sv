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
(* mark_debug = "true" *)output logic stb,
input logic rst,
(* mark_debug = "true" *)output logic dio,
(* mark_debug = "true" *)output logic clk_kHz
);

    logic [11:0] cnt;
    logic [11:0] cnt_01;
    logic clk_kHz2, rst2;
    logic [15:0] i;
    logic [2:0] per;
    logic [7:0] pos;
    
    logic [7:0] data1 = 8'b0111_0110;
    logic [7:0] data2 = 8'b0111_1001;
    logic [7:0] data3 = 8'b0011_1000;
    logic [7:0] com1 = 8'b0100_0000;
    logic [7:0] com2 = 8'b1100_0000;
    logic [7:0] com3 = 8'b1000_1111;
    
    logic [151:0] data = {com3, 8'b1111_1111, data3, 8'b0, data3, 8'b1111_1111, data2, 8'b0, data1, 8'b1111_1111, data3, 8'b0, data3, 8'b1111_1111, data2, 8'b0, data1, com2, com1};
    
      
   always_ff@(posedge clk)
   if (rst)
    begin
   cnt <= 12'd0;
   clk_kHz2 <= 1'd0;
    end
   else
   begin
     if (cnt < 12'd499)
     cnt <= cnt + 12'd1;
        else
            begin
           cnt <= 12'd0;
           clk_kHz2 <= ~clk_kHz2;
            end
            end

   always_ff@(posedge clk)
   if (rst)
   begin
   rst2 <= 1'd1;
   cnt_01 <= 12'd0;
   end
   else 
   begin
   cnt_01 <= cnt_01 + 12'd1;
   if (cnt_01 == 12'd998)
   rst2 <= 1'd0;
   end
   
   enum logic [2:0]
   {
   IDLE,
   COM1,
   COM2,
   DATA,
   COM3,
   DONE
   } 
   state, new_state;
   
   always_ff@(posedge clk_kHz2)
    begin
    case(state)
    IDLE: new_state <= COM1;
    COM1: new_state <= (per == 3'd1) ? COM2 : state;
    COM2: new_state <= (per == 3'd2) ? DATA : state; 
    DATA: new_state <= (per == 3'd3) ? COM3 : state;  
    COM3: new_state <= (per == 3'd4) ? DONE : state;
    endcase
    end
    
    always_ff@(posedge clk_kHz2)
    begin
    case (state)
    
        IDLE:
            begin
            stb <= 1'd1;
            clk_kHz <= 1'd1;
            i <= 16'd0;
            per <= 3'd0;
            end
            
        COM1:
            begin
            stb <= 1'd0;
            i <= i + 16'd1;
            if (i > 16'd0 && i < 16'd17)
            clk_kHz <= ~clk_kHz;
            if (i == 16'd17)
            begin
            stb <= 1'd1;
            i <= 16'd0;
            per <= 3'd1;
            end
            end
      
      COM2:
        begin
        i <= i + 16'd1;
        if (i > 16'd0)
        stb <= 1'd0;    
        if (i > 16'd0 && i < 16'd17)
        clk_kHz <= ~clk_kHz;
        if (i == 16'd17)
            begin
            i <= 16'd0;
            per <= 3'd2;
            end
        end
        
     DATA:
         begin
         stb <= 1'd0;
         i <= i + 16'd1;
         if (i > 16'd0 && i < 16'd257)
         clk_kHz <= ~clk_kHz;
         if (i == 16'd257)
         begin
         stb <= 1'd1;
         i <= 16'd0;
         per <= 3'd3;
         end
     end
     
     COM3:
        begin
        i <= i + 16'd1;
        if (i > 16'd0)
        stb <= 1'd0;
        if (i > 16'd1 && i < 16'd17)
        clk_kHz <= ~clk_kHz;
        if (i == 16'd17)
            begin
            i <= 16'd0;
            per <= 3'd4;
            stb <= 1'd1;
            end
        end
        
     DONE:
        begin
        i <= i+ 16'd1;
        stb <= 1'd1;
        if (i == 16'd5) 
        begin 
        i <= 16'd0;
        per <= 3'd5;
        end
        end
        
    endcase
    end
    
     always_ff@(negedge clk_kHz or posedge rst)
        if (rst)
        begin
        dio <= 1'd0;
        pos <= 8'd0;
        end
        else
        begin
        dio <= data[pos];
        pos <= pos + 8'd1;
        if (pos == 8'd151)
        pos <= 8'd0;
        end
        
    always_ff@(posedge clk_kHz2)
        if (rst2)
        state <= IDLE;
        else 
        state <= new_state;
    
           
            
            
            
            
        
   
   
 
    
   
endmodule
