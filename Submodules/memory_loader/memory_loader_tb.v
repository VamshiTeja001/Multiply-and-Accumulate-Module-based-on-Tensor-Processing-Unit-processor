module memory_loader_tb;

    reg clk;
    reg rst;
    reg [7:0] port_A;          // Input port for feature matrix data
    reg [7:0] port_W;          // Input port for weight matrix data
    reg write_enable_A;        // Control signal for writing to Feature Memory
    reg write_enable_W;        // Control signal for writing to Weight Memory
   
    memory_loader uut (   //Port Mapping
        .clk(clk),
        .rst(rst),
        .port_A(port_A),
        .port_W(port_W),
        .write_enable_A(write_enable_A),
        .write_enable_W(write_enable_W)


      
        
    );
    integer i;
    integer j;

    // Clock generation
    initial clk = 0;
    always #10 clk = ~clk; // Clock with a period of 10 ns for 100 MHz

    // Testbench logic
    initial begin
        // Initialize signals
        rst = 1;  // Apply reset
        port_A = 0;
        port_W = 0;
        write_enable_A = 0;
        write_enable_W = 0;

        // Release reset and start initialization after two clock cycles
        #40;
        rst = 0;

        // Loading the weight memory
        write_enable_W = 1;  // Enable writing to weight memory
        port_W = 8'd4; #20;
        port_W = 8'd0; #20;
        port_W = 8'd2; #20;
        port_W = 8'd1; #20;
        
        port_W = 8'd4; #20;
        port_W = 8'd3; #20;
        port_W = 8'd2; #20;
        port_W = 8'd0; #20;
        
        port_W = 8'd4; #20;
        port_W = 8'd3; #20;
        port_W = 8'd0; #20;
        port_W = 8'd1; #20;
        
        port_W = 8'd4; #20;
        port_W = 8'd3; #20;
        port_W = 8'd2; #20;
        port_W = 8'd1; #20;
        write_enable_W = 0;  // Disable writing to weight memory

        // Load the feature memory
        write_enable_A = 1;  // Enable writing to feature memory
        port_A = 8'd1; #20;
        port_A = 8'd2; #20;
        port_A = 8'd3; #20;
        port_A = 8'd4; #20;
        
        port_A = 8'd1; #20;
        port_A = 8'd2; #20;
        port_A = 8'd3; #20;
        port_A = 8'd4; #20;
        
        port_A = 8'd1; #20;
        port_A = 8'd2; #20;
        port_A = 8'd3; #20;
        port_A = 8'd4; #20;
        
        port_A = 8'd1; #20;
        port_A = 8'd2; #20;
        port_A = 8'sd3; #20;
        port_A = 8'sd4; #20;
        write_enable_A = 0;

        // Display the values loaded into Feature Memory
        $display("Feature Memory:");
        for (i = 0; i < 16; i = i + 1) begin
            $display("[%0d] = %d", i, uut.Feature_Memory[i]);
        end
        
        $display("The feature Matrix is:\n %d %d %d %d \n %d %d %d %d \n %d %d %d %d \n %d %d %d %d \n ", uut.Feature_Memory[0], uut.Feature_Memory[1],uut.Feature_Memory[2],uut.Feature_Memory[3],uut.Feature_Memory[4],uut.Feature_Memory[5],uut.Feature_Memory[6],uut.Feature_Memory[7],
        uut.Feature_Memory[8],uut.Feature_Memory[9],uut.Feature_Memory[10],uut.Feature_Memory[11],uut.Feature_Memory[12],uut.Feature_Memory[13],uut.Feature_Memory[14],uut.Feature_Memory[15]);

        // Display the values loaded into Weight Memory
        $display("\nWeight Memory:");
        for ( j = 0; j < 16; j = j + 1) begin
            $display("[%0d] = %d", j, uut.Weight_Memory[j]);
        end
        
        $display("The Weight Matrix is:\n %d %d %d %d \n %d %d %d %d \n %d %d %d %d \n %d %d %d %d \n ", uut.Weight_Memory[0], uut.Weight_Memory[1],uut.Weight_Memory[2],uut.Weight_Memory[3],uut.Weight_Memory[4],uut.Weight_Memory[5],uut.Weight_Memory[6],uut.Weight_Memory[7],
        uut.Weight_Memory[8],uut.Weight_Memory[9],uut.Weight_Memory[10],uut.Weight_Memory[11],uut.Weight_Memory[12],uut.Weight_Memory[13],uut.Weight_Memory[14],uut.Weight_Memory[15]);
        // End simulation
        $finish;
    end

// Display Input Values being loaded through Input Ports for Feature and Weight memory
    initial begin
        $monitor("Time: %t\t Input Value Through port_A:",$time, port_A);
        // $monitor("Time: %t\t Input Value Through port_W:",$time, port_W);      // ******* Unblock this and block above to view to view inputs being sent through port_W (Weight inputs) 
    end

  
endmodule
