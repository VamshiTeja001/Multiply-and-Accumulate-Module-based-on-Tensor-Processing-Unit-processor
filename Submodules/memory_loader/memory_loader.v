`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company/University: University at Albany, SUNY
// Engineer: Raghavendra Chathurajupalli
// 
// Create Date: 14.03.2024 12:42:51
// Design Name: 
// Module Name: memory_loader
// Project Name: TPU based MAC system for Mid term
// Target Devices: NA
// Tool Versions: NA
// Description: This module is used to load inputs gathered from 8 bit weight and feature ports into 16 KB weight memory and 32 KB Feature memory units. Please note that for weight memory, the first 16 elements are loaded as the rest 16 elements are meant for matrix multiplication output
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: The module shall be modified into Main Module
// Testing commands: iverilog ./memory_loader.v
//////////////////////////////////////////////////////////////////////////////////


module memory_loader (
    
    input clk,
    input rst,
    input signed [7:0] port_A,     // Input port for feature matrix data
    input signed [7:0] port_W,     // Input port for weight matrix data
    input write_enable_A,  // Control signal for writing to Feature Memory
    input write_enable_W   // Control signal for writing to Weight Memory
);

// Memory Arrays
reg signed [7:0] Feature_Memory [0:15];  // 16 elements, 8-bit wide
reg signed [7:0] Weight_Memory [0:31];   // 16 elements, 8-bit wide

// Counters for tracking memory writes
integer i;  // Feature Memory index
integer j;  // Weight Memory index



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

endmodule
