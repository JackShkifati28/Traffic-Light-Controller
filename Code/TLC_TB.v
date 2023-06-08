`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2021 06:13:39 PM
// Design Name: 
// Module Name: TLC_TB
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


module TLC_TB( );

wire GA, GB, RA, RB, OA, OB;

reg clk=0, res=1, sns=0;

always  #1 clk = ~clk;

TLC DUT(clk, res, sns, GA, GB, RA, RB, OA, OB);

initial begin #4;
res=0;
#160;

sns=1;
#100;

end


endmodule
