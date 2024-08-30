module QuantizationUnit (
    output reg [7:0] output_data ,
    input  clk,  
    input rst,             // Clock signal (optional, see note below)
    input  [23:0] input_data
   // input [1:0] operationMode // 24-bit input value
     // 8-bit output value
);

always @(posedge clk or rst) begin 
    //if (operationMode==2) begin
    if(rst) begin
    output_data <= 8'b00000000;
    end
    else if (input_data > 255)
    begin
        output_data <= 255;  // Set to 255 if above threshold
    end 
    else begin
        output_data <= input_data; // Take the lower 8 bits
    end
   // end
   // else output_data <= 8'b00000000;

 end

endmodule
