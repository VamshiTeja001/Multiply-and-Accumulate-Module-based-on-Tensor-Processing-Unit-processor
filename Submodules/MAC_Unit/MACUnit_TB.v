`timescale 1ns / 1ps

module MACUnit_tb;

// Inputs
reg [7:0] FM;
reg [7:0] WM;
reg [23:0] AddCarry;
reg WEn;
reg clk;
reg rst;

// Outputs
wire [23:0] AccumulatedSum;
wire [7:0] siglineEast;
wire [7:0] siglineSouth;

// Instantiate the Unit Under Test (UUT)
MACUnit uut (
    .AccumulatedSum(AccumulatedSum), 
    .siglineEast(siglineEast), 
    .siglineSouth(siglineSouth), 
    .FM(FM), 
    .WM(WM), 
    .AddCarry(AddCarry), 
    .WEn(WEn), 
    .clk(clk), 
    .rst(rst)
);

initial begin
    // Initialize Inputs
    FM = 0;
    WM = 0;
    AddCarry = 0;
    WEn = 0;
    clk = 0;
    rst = 1;

    // Wait 100 ns for global reset to finish
    #100;
    rst = 0;
    
    // **Give inputs here
    FM = 8'd10; WM = 8'd20; AddCarry = 24'd5; WEn = 1; #20;
    FM = 8'd12; WM = 8'd22; AddCarry = 24'd3; WEn = 1; #20;
    FM = 8'd14; WM = 8'd24; AddCarry = 24'd1; WEn = 0; #20; // WM should not update due to WEn=0
    
    rst = 0; #10; // De-assert reset

    // Finish simulation
    $finish;
end

// Clock generation
always #10 clk = ~clk;

// Monitor and display testbench signals
always@(AccumulatedSum)begin
    $monitor("Time=%t, rst=%b, FM=%d, WM=%d, WEn=%b, AccumulatedSum=%d, siglineEast=%d, siglineSouth=%d", 
             $time, rst, FM, WM,  WEn, AccumulatedSum, siglineEast, siglineSouth);
end

endmodule
