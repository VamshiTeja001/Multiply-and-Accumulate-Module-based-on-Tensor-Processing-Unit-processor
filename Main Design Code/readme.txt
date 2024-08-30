Overview: 
The main module is the top module for this design project. It main functions are to recieve inputs for matrix multiplication, invoke systolic array module to perform matrix multiplication and then to recive the output of the process and store it in feature memory.

The systollic array uses set of MAC_Unit modules to calculate the matrix multiplication and produces a 24 bit partial sum and this result is quantized to 8 bit with a maximum cap of 255. The quantized 8 bit result is sent through Activation Unit, which allows only values above 10 and if it is below 10, it sets the value to 0.  



To run the program, use below commands in Terminal:

iverilog .\mainTB.v .\main.v .\Systolic_Array.v .\MACUnit.v .\QuantizationUnit.v .\ActivationUnit.v

vvp ./a.out



To change the inputs in testbech, open mainTB.v file, navigate to line  </// ***** Provide Your Inputs Below> at line 51. From the following line, you can change the inputs for the matrix.
