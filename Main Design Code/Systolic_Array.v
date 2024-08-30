`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2024 00:41:32
// Design Name: 
// Module Name: Systolic_Array
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
//

module Systolic_Array(
output reg [4:0] count,

output [7:0]  Activation_result12, Activation_result13, Activation_result14, Activation_result15,
//output [23:0] result0,
input [7:0] w0,w1, w2, w3, 
input [7:0] a0, a4, a8, a12,
input WEn,
input clk,
input rst,
input pauseProcess
    );
    
    //reg [4:0] count;
    reg [1:0] operationMode;
    //Direct Inputs to the array
    //wire [7:0] w0,w1, w2, w3 ; //North Inputs
    //wire [7:0]a0, a4, a8, a12; //West inputs
    //Indirect Inputs to the array
    wire [7:0] wire_south0, wire_south1, wire_south2, wire_south3, wire_south4, wire_south5, wire_south6, wire_south7, wire_south8, wire_south9, wire_south10, wire_south11, wire_south12, wire_south13, wire_south14, wire_south15;
    wire [7:0] wire_east0, wire_east1, wire_east2, wire_east3, wire_east4, wire_east5, wire_east6, wire_east7, wire_east8, wire_east9, wire_east10, wire_east11, wire_east12, wire_east13, wire_east14, wire_east15;
    wire [23:0] result0, result1, result2, result3, result4, result5, result6, result7, result8, result9, result10, result11, result12, result13, result14, result15;
    //wire [23:0] Accu_south0, Accu_south1, Accu_south2, Accu_south3, Accu_south4, Accu_south5, Accu_south6, Accu_south7, Accu_south8, Accu_south9, Accu_south10, Accu_south11, Accu_south12, Accu_south13, Accu_south14, Accu_south15;

    //Wires for Quantization and Activation Unit
    wire [7:0] Quantized_result0, Quantized_result1, Quantized_result2, Quantized_result3, Quantized_result4, Quantized_result5, Quantized_result6, Quantized_result7, Quantized_result8, Quantized_result9, Quantized_result10, Quantized_result11, Quantized_result12, Quantized_result13, Quantized_result14, Quantized_result15;
    //wire [7:0] Activation_result0, Activation_result1, Activation_result2, Activation_result3, Activation_result4, Activation_result5, Activation_result6, Activation_result7, Activation_result8, Activation_result9, Activation_result10, Activation_result11;
    //wire [7:0]  Activation_result12, Activation_result13, Activation_result14, Activation_result15;
    wire [23:0] gnd =0;
    
    
    
    // Begin Array
    
    // Top=North, Lefy= West, Right= East, Down:south. Terminology based on Google TPU Arch lingo
    //North & West End: C11
    MACUnit C11_0(result0,wire_east0,wire_south0,a0,w0,gnd,WEn,clk,rst);
    
    // North Line 
    MACUnit C12_1(result1,wire_east1,wire_south1,wire_east0,w1,gnd,WEn,clk,rst);  
    MACUnit C13_2(result2,wire_east2,wire_south2,wire_east1,w2,gnd,WEn,clk,rst);  
    MACUnit C14_3(result3,wire_east3,wire_south3,wire_east2,w3,gnd,WEn,clk,rst);  
    
    //West Line 
    MACUnit C21_4(result4,wire_east4,wire_south4,a4,wire_south0,result0,WEn,clk,rst);
    MACUnit C31_8(result8,wire_east8,wire_south8,a8,wire_south4,result4,WEn,clk,rst);
    MACUnit C41_12(result12,wire_east12,wire_south12,a12,wire_south8,result8,WEn,clk,rst);
    
    //Indirect Blocks
      //2nd Row 
   MACUnit C22_5(result5,wire_east5,wire_south5,wire_east4,wire_south1,result1,WEn,clk,rst);
   MACUnit C23_6(result6,wire_east6,wire_south6,wire_east5,wire_south2,result2,WEn,clk,rst);
   MACUnit C24_7(result7,wire_east7,wire_south7,wire_east6,wire_south3,result3,WEn,clk,rst);
      // 3rd Row
   MACUnit C32_9(result9,wire_east9,wire_south9,wire_east8,wire_south5,result5,WEn,clk,rst);
   MACUnit C33_10(result10,wire_east10,wire_south10,wire_east9,wire_south6,result6,WEn,clk,rst);
   MACUnit C34_11(result11,wire_east11,wire_south11,wire_east10,wire_south7,result7,WEn,clk,rst);
   
   //4rt Row
   MACUnit C42_13(result13,wire_east13,wire_south13,wire_east12,wire_south9,result9,WEn,clk,rst);
   MACUnit C43_14(result14,wire_east14,wire_south14,wire_east13,wire_south10,result10,WEn,clk,rst);
   MACUnit C44_15(result15,wire_east15,wire_south15,wire_east14,wire_south11,result11,WEn,clk,rst);
    
    
    always @(posedge clk or posedge rst) begin
		if(rst || (~pauseProcess)) begin
			operationMode <= 0; //Reset Array Process to Initial Stage
			count <= 0;
		end
		else begin


			 if(count == 18) begin
			operationMode <= 3; // Once all iteration complete, then set to Array Process Almost Completed
			count <= 0;
			 end
			

      //else if(count == 10) begin
				//operationMode <= 3; // Once all iteration complete, then set to Array Process Completed
				//count <= 0;
			//end

      else if (count==17)
      begin
         operationMode <=2;  // Output Starts

      end


      else begin
				operationMode <= 1; // Array Process set to busy (on-going)
				count <= count + 1;
			end

		end	
	end 
    



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  QuantizationUnit C41_Q12(Quantized_result12, clk, rst, result12);
  QuantizationUnit C42_Q13(Quantized_result13, clk, rst, result13);
  QuantizationUnit C43_Q14(Quantized_result14, clk, rst, result14);
  QuantizationUnit C44_Q15(Quantized_result15, clk, rst, result15);


 
  ActivationUnit C41_Avt12(Activation_result12, clk, rst, Quantized_result12);
  ActivationUnit C42_Avt13(Activation_result13, clk, rst, Quantized_result13);
  ActivationUnit C43_Avt14(Activation_result14, clk, rst, Quantized_result14);
  ActivationUnit C44_Avt15(Activation_result15, clk, rst, Quantized_result15);
  
    
endmodule      
