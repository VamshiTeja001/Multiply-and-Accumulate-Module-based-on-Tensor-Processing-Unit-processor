`timescale 1ns / 1ps


module systollicArray_TB;

reg rst, clk, pauseProcess;

reg [7:0] inp_west0, inp_west1, inp_west2, inp_west3, inp_north0, inp_north1, inp_north2, inp_north3;
reg Wen;
wire [4:0] count;
wire [7:0] Activation_result12, Activation_result13, Activation_result14, Activation_result15;
//wire [23:0] v;

Systolic_Array uut(count,Activation_result12, Activation_result13, Activation_result14, Activation_result15, inp_north0, inp_north1, inp_north2, inp_north3, inp_west0, inp_west1, inp_west2, inp_west3,Wen, clk, rst,pauseProcess);

initial begin


	pauseProcess = 1;
	#5 Wen=1;

//	#20 Wen =1;

//	#20 Wen=1;

//	#20 Wen =1;

	#100 Wen=0;

end





initial begin
	#5  inp_west0 <= 8'd0; //A11
	    inp_north0 <= 8'd1;
		


	#20 inp_west0 <= 8'd0; //A12
	    inp_north0 <= 8'd1;
		

	#20 inp_west0 <= 8'd0; //A13
	    inp_north0 <= 8'd1;
		

	#20 inp_west0 <= 8'd0; //A14
	    inp_north0 <= 8'd1;
		



	#20 inp_west0 <= 8'd1; // First cycle
	    inp_north0 <= 8'd1;
		

	#20 inp_west0 <= 8'd1; //Second Cycle
	    inp_north0 <= 8'd0;
		

	#20 inp_west0 <= 8'd1;	 //Third Cycle
	    inp_north0 <= 8'd0;

	#20 inp_west0 <= 8'd1;	 //Fourth Cycle
	    inp_north0 <= 8'd0;
	
	#20 inp_west0 <= 8'd0;	 //Fifth Cycle
	    inp_north0 <= 8'd0;

	#20 inp_west0 <= 8'd0;	 //6 Cycle
	    inp_north0 <= 8'd0;

	#20 inp_west0 <= 8'd0;	 //7 Cycle
	    inp_north0 <= 8'd0;

	/*#20 inp_west0 <= 8'd0;	 //8 Cycle
	    inp_north0 <= 8'd0;

	#20 inp_west0 <= 8'd0;	 //9 Cycle
	    inp_north0 <= 8'd0;

	#20 inp_west0 <= 8'd0;	 //10 Cycle
	    inp_north0 <= 8'd0; */
end

initial begin
	#5  inp_west1 <= 8'd0;
	    inp_north1 <= 8'd1;
		

	#20 inp_west1 <= 8'd0;
	    inp_north1 <= 8'd1;
		

	#20 inp_west1 <= 8'd0;
	    inp_north1 <= 8'd1;
		

	#20 inp_west1 <= 8'd0;
	    inp_north1 <= 8'd1;
		

	#20 inp_west1 <= 8'd0; // First Cycle
	    inp_north1 <= 8'd1;

	#20 inp_west1 <= 8'd1; //Second Cycle
	    inp_north1 <= 8'd0;

	#20 inp_west1 <= 8'd1;	 //Third cycle
	    inp_north1 <= 8'd0;

	#20 inp_west1 <= 8'd1;	 //Fourth Cycle
	    inp_north1 <= 8'd0;
	
	#20 inp_west1 <= 8'd1;	 //Fifth Cycle
	    inp_north1 <= 8'd0;

	#20 inp_west1 <= 8'd0;	 //Fourth Cycle
	    inp_north1 <= 8'd0;
	
	#20 inp_west1 <= 8'd0;	 //Fifth Cycle
	    inp_north1 <= 8'd0;

	#20 inp_west1 <= 8'd0;	 //6 Cycle
	    inp_north1 <= 8'd0;
	
	#20 inp_west1 <= 8'd0;	 //7 Cycle
	    inp_north1 <= 8'd0;

	/* #20 inp_west1 <= 8'd0;	 //8 Cycle
	    inp_north1 <= 8'd0;
	
	#20 inp_west1 <= 8'd0;	 //9 Cycle
	    inp_north1 <= 8'd0;

	#20 inp_west1 <= 8'd0;	 //10 Cycle
	    inp_north1 <= 8'd0;
	*/
	
end

initial begin
	#5  inp_west2 <= 8'd0;
	    inp_north2 <= 8'd0;
		

	#20 inp_west2 <= 8'd0;
	    inp_north2 <= 8'd1;
		

	#20 inp_west2 <= 8'd0;
	    inp_north2 <= 8'd1;
		

	#20 inp_west2 <= 8'd0;
	    inp_north2 <= 8'd1;
		
		///

	#20 inp_west2 <= 8'd0; //First Cycle
	    inp_north2 <= 8'd1;

	#20 inp_west2 <= 8'd0; //Second Cycle
	    inp_north2 <= 8'd1;

	#20 inp_west2 <= 8'd1;	//Third Cycle
	    inp_north2 <= 8'd0;
	#20 inp_west2 <= 8'd1;	 //Fourth Cycle
	    inp_north2 <= 8'd0;

	#20 inp_west2 <= 8'd1;	 //Fifth Cycle
	    inp_north2 <= 8'd0;

		#20 inp_west2 <= 8'd1;	 //6 Cycle
	    inp_north2 <= 8'd0;

		#20 inp_west2 <= 8'd0;	 //7 Cycle
	    inp_north2 <= 8'd0;

	/*	#20 inp_west2 <= 8'd0;	 //8 Cycle
	    inp_north2 <= 8'd0;

		#20 inp_west2 <= 8'd0;	 //9 Cycle
	    inp_north2 <= 8'd0;

		#20 inp_west2 <= 8'd0;	 //10 Cycle
	    inp_north2 <= 8'd0; */
end

initial begin
	#5  inp_west3 <= 8'd0;
	    inp_north3 <= 8'd1;
		

	#20 inp_west3 <= 8'd0;
	    inp_north3 <= 8'd1;
		

	#20 inp_west3 <= 8'd0;
	    inp_north3 <= 8'd1;
	

	#20 inp_west3 <= 8'd0;
	    inp_north3 <= 8'd1;
		
//// 
	#20 inp_west3 <= 8'd0;   //1st cycle
	    inp_north3 <= 8'd1;

	#20 inp_west3 <= 8'd0; //Second Cycle
	    inp_north3 <= 8'd1;

	#20 inp_west3 <= 8'd0;	//Third Cycle
	    inp_north3 <= 8'd1;
	
	#20 inp_west3 <= 8'd1;	 //Fourth Cycle
	    inp_north3 <= 8'd0;

	#20 inp_west3 <= 8'd1;	 //Fifth Cycle
	    inp_north3 <= 8'd0;
	
	#20 inp_west3 <= 8'd1;	 //6 Cycle
	    inp_north3 <= 8'd0;
	
	#20 inp_west3 <= 8'd1;	 //7 Cycle
	    inp_north3 <= 8'd0;
	
	/*#20 inp_west3 <= 8'd0;	 //8 Cycle
	    inp_north3 <= 8'd0;
	
	#20 inp_west3 <= 8'd0;	 //9 Cycle
	    inp_north3 <= 8'd0;
	
	#20 inp_west3 <= 8'd0;	 //10 Cycle
	    inp_north3 <= 8'd0; */
	
end

initial begin
rst <= 1;
clk <= 0;
#3
rst <= 0;
end

initial begin
	repeat(33)
		#10 clk <= ~clk;
end

initial begin
	$dumpfile("wave.vcd");
	$dumpvars(0, systollicArray_TB);
end

/*always @(uut.result0 or uut.result1 or uut.result2 or uut.result3 or uut.result4 or uut.result5 or uut.result6 or uut.result7
             or uut.result8 or uut.result9 or uut.result10 or uut.result11 or uut.result12 or uut.result13 or uut.result14 or uut.result15) */

			 always@(posedge clk or posedge rst)
			 
			  begin
       /* $monitor("Time: %t, Results:\n %d %d %d %d \n %d %d %d %d \n %d %d %d %d\n %d %d %d %d \t \n mode: %d \t Q&A %d %d", 
                 $time, uut.result0, uut.result1, uut.result2, uut.result3, uut.result4, uut.result5, uut.result6, uut.result7, 
                 uut.result8, uut.result9, uut.result10, uut.result11, uut.result12, uut.result13, uut.result14, uut.result15, uut.operationMode, uut.Quantized_result0, uut.Activation_result0); */
             //$monitor("Time: %t, Results:\n %d %d %d %d \n mode: %d \t Q&A: %d %d \t Wen : %d",  $time, uut.result12, uut.result13, uut.result14, uut.result15, uut.operationMode, uut.Quantized_result12, uut.Activation_result12, Wen); 
			  $monitor("Time: %t, Results:\n %d %d %d %d \n mode: %d \t Q&A: %d %d \t Wen : %d \t Count: %d",  $time, Activation_result12, Activation_result13, Activation_result14, Activation_result15, uut.operationMode, uut.Quantized_result12, uut.Activation_result12, Wen, count);
			 end

endmodule

/*
initial begin
	$dumpfile("wave1.vcd");
	$dumpvars(0, systollicArray_TB);
    //$monitor("Time:\t, ")
    $display("%d\t", uut.result0);
    $display("%d\t", uut.uut.result1);
    $display("%d\t", uut.result2);
    $display("%d\t", uut.result3);

    $display("\n");
     $display("%d\t", uut.result4);
     $display("%d\t", uut.result5);
     $display("%d\t", uut.result6);
     $display("%d\t", uut.result7);

    $display("\n");

    $display("%d\t", uut.result8);
    $display("%d\t", uut.result9);
    $display("%d\t", uut.uut.result10);
    $display("%d\t", uut.uut.result11);

    $display("\n");
     $display("%d\t", uut.uut.result12);
     $display("%d\t", uut.uut.result13);
     $display("%d\t", uut.uut.result14);
     $display("%d\t", uut.uut.result15);
    $display("\n");  

     $display("%d\t", operationMode);
    

end */




