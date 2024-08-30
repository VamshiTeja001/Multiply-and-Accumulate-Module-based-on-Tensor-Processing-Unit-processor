The MAC Unit within the systolic array has two south lines to propagate weight and accumulated sum respectively. It also has an output port to propagate eastern blocks. The two inputs are from north are for weight and accumulated sum and western side input for feature elements. The MAC unit is also clocked and has the logic below.

to run this:

 iverilog ./MACUnit_TB.v ./MACUnit.v
          vvp ./a.out