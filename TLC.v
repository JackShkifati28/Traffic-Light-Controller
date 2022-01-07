`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2021 06:16:40 PM
// Design Name: 
// Module Name: TLC
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

module TLC ( input clk, res, sns, output reg GA, GB, RA, RB, OA, OB, sec);

integer Time=32'd0;
//reg sec=0;

always@(posedge clk)
 begin
 if(Time==100000000/2)
 begin
 Time <= 0;
 sec <= ~sec;
 end
 else
 Time <= Time + 1;
 end

parameter TA=0, TB=1, SAP=2, SBP=3 ;

reg[1:0] state=TA, next_state;

always@(posedge sec) state <= next_state;

integer timer =0;

always@(posedge sec) timer=timer+1;

always@(state) timer=0;

always@(timer, res, sns, state) begin

case(state)

TA: if (timer < 10) next_state <= TA;
else next_state <= SAP;

SAP: if(timer < 60) next_state <= SAP;
else if(sns) next_state <= TB;
else  next_state <= SAP;

TB: if ( timer < 10) next_state <= TB;
else next_state <= SBP;

SBP: if(timer < 30) next_state <= SBP;
 else next_state <= TA;

endcase

if(res) next_state <= TA;

end

always @(state) begin 

case(state)

TA: begin GA =0; GB=0; RA =1; RB =0; OA =0; OB = 1; end

TB: begin GA=0; GB=0; RA=0; RB=1; OA=1; OB=0; end

SAP: begin GA=1; GB=0; RA=0; RB=1; OA=0; OB=0; end

SBP: begin GA=0; GB=1; RA=1; RB=0; OA=0; OB=0; end

endcase

end

endmodule

