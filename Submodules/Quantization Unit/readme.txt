 This unit is responsible for converting a 24 bit data into 8 bit data by removing the redundant bits. If output is greater than 255, the data is set to 255 else, the data is allowed to pass as it is.

To run this:

iverilog ./QuantizationUnit_TB.v ./QuantizationUnit.v
vvp ./a.out 