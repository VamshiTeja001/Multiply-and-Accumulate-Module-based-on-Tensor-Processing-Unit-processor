`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UAlbany
// Engineer: Raghavendra Chathurajupalli
// 
// Create Date: 12.03.2024 13:03:43
// Design Name: Multiply and Accumulation Module based on Google TPU
// Module Name: MulTPU
// Project Name: Multiply and Accumulation Module based on Google TPU
// Target Devices: 
//  
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Sources/References: www.chipverify.com, 
//////////////////////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////////////////////

module MACUnit( output reg [23:0]AccumulatedSum, output reg [7:0]siglineEast, output reg [7:0] siglineSouth,  input [7:0]FM,input [7:0]WM, input [23:0] AddCarry, input WEn, input clk,input rst );

    reg [15:0]m;
    //reg [7:0]siglineEast; reg[7:0] siglineSouth; 
    //wire[23:0] macOutwire;






always @(posedge clk or posedge rst) 
    begin
 
                AccumulatedSum <= (siglineEast*siglineSouth) + AddCarry; //m+AddCarry

     
    end
/////////////////////////////////////////////////////
always @(posedge clk or posedge rst)
     begin
        if(rst)
            begin
                siglineEast <= 8'b00000000;
                siglineSouth <= 8'b00000000;
            end
        else 
            begin
                 siglineEast<= FM;

                 if( WEn==1 ) 
                 siglineSouth <= WM;

                 else siglineSouth<=siglineSouth;
            end
     end


endmodule
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Quantization Unit: THis module is resposnsible to limit the bits to maximum value of 255 and remove the redundant bits thereby turning a 24 bit input to 8 bit output
// The input is received from the systolic array while the Output is fed to Activation Unit


///////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////











































