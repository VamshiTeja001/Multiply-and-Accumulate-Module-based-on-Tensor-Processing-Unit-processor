 

 Module Name: memory_loader
 Project Name: TPU based MAC system for Mid term

 Company/University: University at Albany, SUNY
 Engineer: Raghavendra Chathurajupalli

 Project Name: TPU based MAC system for Mid term

 Description: This module is used to load inputs gathered from 8 bit weight and feature ports into 16 KB weight memory and 32 KB Feature memory units. Please note that for weight memory, the first 16 elements are loaded as the rest 16 elements are meant for matrix multiplication    output
 
 Additional Comments: The module shall be modified into Main Module


 Testing commands: 
1. To run only module: iverilog ./memory_loader.v
2. To run along with testbench : iverilog ./memory_loader_tb.v ./memory_loader.v
                                  vvp ./a.out