`timescale 1ns / 1ps

module QuantizationUnit_tb;

// Inputs
reg clk;
reg rst;
reg [23:0] input_data;

// Outputs
wire [7:0] output_data;

// Instantiate the Unit Under Test (UUT)
QuantizationUnit uut (
    .clk(clk), 
    .rst(rst), 
    .input_data(input_data), 
    .output_data(output_data)
);

initial begin
    // Initialize Inputs
    clk = 0;
    rst = 1; // Assert reset initially
    input_data = 0;

    $display("Time=%t, Reset Applied, output_data=%d", $time, output_data);

    // Wait for 100 ns for global reset to finish
    #100;
    rst = 0; // Release reset
    $display("Time=%t, Reset Released", $time);

    // Apply various input values
    input_data = 100; #20; // Below threshold
    $display("Time=%t, input_data=%d, output_data=%d", $time, input_data, output_data);
    
    input_data = 256; #20; // Above threshold, should cap at 255
    $display("Time=%t, input_data=%d, output_data=%d", $time, input_data, output_data);
    
    input_data = 1024; #20; // Well above threshold, should cap at 255
    $display("Time=%t, input_data=%d, output_data=%d", $time, input_data, output_data);
    
    input_data = 200; #20; // Below threshold, should be equal to input
    $display("Time=%t, input_data=%d, output_data=%d", $time, input_data, output_data);
    
    // Re-assert reset to see the output reset to 0
    rst = 1; #10;
    $display("Time=%t, Reset Applied, output_data=%d", $time, output_data);
    rst = 0; #10;
    
    // Finish simulation
    $finish;
end

// Clock generation
always #10 clk = ~clk;

endmodule
