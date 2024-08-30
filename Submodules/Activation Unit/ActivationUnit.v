module ActivationUnit (
    output reg [7:0] data_out,
    input clk,
    input rst,
    input [7:0] data_in
    
);

always @(posedge clk or posedge rst) begin
    if (rst) 
    data_out <=0;
    
    else if (data_in >= 10) begin  //  If greater than threshold value pass the value 
    
        data_out <= data_in;
    end 
    else begin  // else set to zero
        data_out <= 8'b00000000;  // Set to zero for negative values if below threshold i.e if
    end
end


endmodule