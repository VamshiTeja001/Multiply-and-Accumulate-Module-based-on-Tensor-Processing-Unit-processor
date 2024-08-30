Activation Unit : This unit is responsible to remove values which are not above the threshold T = 10.  This module is also clocked and uses condition if-else statements.

To run this use the following commands:

iverilog ./Activation_Unit_TB.v ./ActivationUnit.v
vvp ./a.out