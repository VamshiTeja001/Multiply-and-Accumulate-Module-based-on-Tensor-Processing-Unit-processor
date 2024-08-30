`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 12:42:51
// Design Name: 
// Module Name: memory_loader
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


module memory_loader (
    output reg [7:0] port_O,
    input clk,
    input rst,
    input signed [7:0] port_A,     // Input port for feature matrix data
    input signed [7:0] port_W,     // Input port for weight matrix data
    input write_enable_A,  // Control signal for writing to Feature Memory
    input write_enable_W,   // Control signal for writing to Weight Memory
    input startSignal
);

// Memory Arrays
reg signed [7:0] Feature_Memory [0:31];  // 8-bit wide : 16 elements of Feature Memory Input and the next 16 elments for Output of Matrix Multiplication, 
reg signed [7:0] Weight_Memory [0:15];   // 16 elements, 8-bit wide
reg ReadEnable;
wire [0:4] count;

reg Wen;
reg [7:0] inp_west0, inp_west1, inp_west2, inp_west3, inp_north0, inp_north1, inp_north2, inp_north3;
wire [7:0] Activation_result12, Activation_result13, Activation_result14, Activation_result15;

// Counters for tracking memory writes
integer i;  // Feature Memory index
integer j;  // Weight Memory index
integer k;  // Reading output from Feature Memory

/////////////////////// Loading memoty

// Writing Logic (Feature Memory)
always @(posedge clk) begin
    if (rst) begin
        i <= 0;  // Reset index
    end else if (write_enable_A) begin
        Feature_Memory[i] <= port_A;
        i <= i + 1;
    end
end

// Writing Logic (Weight Memory)
always @(posedge clk) begin
    if (rst) begin
        j <= 0;  // Reset index
    end else if (write_enable_W) begin
        Weight_Memory[j] <= port_W;
        j <= j + 1;
    end
end


/////////////////////// Start Matrix multiplication
//always@(posedge clk)
//begin

Systolic_Array SA_1(count, Activation_result12, Activation_result13, Activation_result14, Activation_result15,inp_north0, inp_north1, inp_north2, inp_north3, inp_west0, inp_west1, inp_west2, inp_west3,Wen, clk, rst,startSignal);
//end

initial begin 
    #69
    if (startSignal==1) //WEn
    begin
    #5 Wen=1;

//	#20 Wen =1;

//	#20 Wen=1;

//	#20 Wen =1;

	#100 Wen=0;

    end

end
reg [4:0]cnt;
always@(posedge clk)begin
    if(rst)
        cnt <= 4'd0;
    else if (startSignal)begin
        cnt <= cnt +1;
    end
end

always@(*) begin
    if(startSignal && cnt <=3)begin
        Wen <= 1;
        inp_north0 <= Weight_Memory[12-(cnt*4)];
        inp_north1 <= Weight_Memory[13-(cnt*4)];
        inp_north2 <= Weight_Memory[14-(cnt*4)];
        inp_north3 <= Weight_Memory[15-(cnt*4)];
    end
    else
        Wen<= 0;
end
always @(*)begin
    if(startSignal && cnt >3 && cnt <=7)begin
        inp_west0 <= Feature_Memory[(cnt-4)*4];
    end
end


always @(*)begin
    if(startSignal && cnt >4 && cnt <=8)begin
        inp_west1 <= Feature_Memory[(cnt-5)*4 +1];    
    end
end

always @(*)begin
    if(startSignal && cnt >5 && cnt <=9)begin
        inp_west2 <= Feature_Memory[(cnt-6)*4+2];  
    end
end

always @(*)begin
    if(startSignal && cnt >6 && cnt <=10)begin
        inp_west3 <= Feature_Memory[(cnt-7)*4+3];
    end
end






always@(posedge clk)
begin
if(count ==  11) // check to use always block

begin
         Feature_Memory[16] <= Activation_result12;  // First Output

end

else if(count==12)
begin
         Feature_Memory[20] <= Activation_result12;
         Feature_Memory[17] <= Activation_result13;
end

else if(count==13)
begin
        Feature_Memory[24] <= Activation_result12;
        Feature_Memory[21] = Activation_result13;
        Feature_Memory[18]= Activation_result14;
end
    
    else if (count ==14)
    begin
          Feature_Memory[28] <= Activation_result12;
          Feature_Memory[25] = Activation_result13;
          Feature_Memory[22] = Activation_result14;
          Feature_Memory[19] = Activation_result15;
    end

    else if(count==15)
    begin

          Feature_Memory[29]= Activation_result13;
          Feature_Memory[26] = Activation_result14;
          Feature_Memory[23] = Activation_result15;
    end

    else if (count==16)
    begin

          Feature_Memory[30]=Activation_result14;
          Feature_Memory[27]= Activation_result15; 
    end

    else if (count==17)
    begin
        Feature_Memory[31]= Activation_result15;
       ReadEnable <= 1;
    end
    

end

always @(posedge clk) begin
    if (rst) begin
        k <= 16;  // Reset index
    end else if (ReadEnable && (k<32)) begin
         port_O <= Feature_Memory[k];
        k <= k + 1;
    end
end
        
    
endmodule






