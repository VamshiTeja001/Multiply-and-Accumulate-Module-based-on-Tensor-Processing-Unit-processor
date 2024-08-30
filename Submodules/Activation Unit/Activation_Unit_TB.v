`timescale 1ns / 1ps

module ActivationUnit_tb;

// Inputs
reg clk;
reg rst;
reg [7:0] data_in;

// Outputs
wire [7:0] data_out;

// Instantiate the Unit Under Test (UUT)
ActivationUnit uut (
    .clk(clk), 
    .rst(rst), 
    .data_in(data_in), 
    .data_out(data_out)
);

initial begin
    // Initialize Inputs
    clk = 0;
    rst = 1; // Begin with reset
    data_in = 0;

    // Wait for 100 ns for global reset to finish
    #100;
    
    // Release reset
    rst = 0;

    // *Apply input values here
    #20 data_in = 0; 
    #20 data_in = 12; 
    
    #20 data_in = 8;
    #20 data_in = 255; 
    
    // Stimulate the reset again
    rst = 1; #10;
    rst = 0; #10;
    
    // Final input to check after reset
    data_in = 18; #20;
    
    // Finish simulation
    $finish;
end

// Clock generation
always #10 clk = ~clk;

always @(data_out) begin
    $display(" Inpu Data %d, data_out=%d", data_in,  data_out);
end

endmodule
