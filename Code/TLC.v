`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2021 05:53:51 PM
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


module TLC ( input clk, res, sns, output reg GA, GB, RA, RB, OA, OB);

parameter TA=0, TB=1, SAP=2, SBP=3 ;

reg[1:0] state=TA, next_state;

always@(posedge clk) state <= next_state;

integer timer =0;

always@(posedge clk) timer=timer+1;

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

TB: begin GA=0; GB=0; RA=1; RB=1; OA=1; OB=0; end

SAP: begin GA=1; GB=0; RA=1; RB=1; OA=0; OB=0; end

SBP: begin GA=1; GB=1; RA=1; RB=0; OA=0; OB=0; end

endcase

end

endmodule
