`timescale 1ns/1ps

module tb_CLA12;
    reg [11:0] in1;
    reg [11:0] in2;
    wire [11:0] sum;
    wire cout;

    // Instantiate the module under test (uut)
    CLA12 uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: 0 + 0
        in1 = 12'b000000000000; 
        in2 = 12'b000000000000; 
        #10;
        if (sum !== 12'b000000000000 || cout !== 1'b0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: 1 + 1
        in1 = 12'b000000000001; 
        in2 = 12'b000000000001; 
        #10;
        if (sum !== 12'b000000000010 || cout !== 1'b0) 
            $display("FAIL: Test case 2 failed");
        
        // Test case 3: 4095 + 1 (max value + 1)
        in1 = 12'b111111111111; 
        in2 = 12'b000000000001; 
        #10;
        if (sum !== 12'b000000000000 || cout !== 1'b1) 
            $display("FAIL: Test case 3 failed");
        
        // Test case 4: 2048 + 2048
        in1 = 12'b100000000000; 
        in2 = 12'b100000000000; 
        #10;
        if (sum !== 12'b000000000000 || cout !== 1'b1) 
            $display("FAIL: Test case 4 failed");
        
        // Test case 5: 1234 + 5678
        in1 = 12'b000001001101; 
        in2 = 12'b000101100010; 
        #10;
        if (sum !== 12'b000111101111 || cout !== 1'b0) 
            $display("FAIL: Test case 5 failed");
        
        // Test case 6: 2047 + 2047
        in1 = 12'b011111111111; 
        in2 = 12'b011111111111; 
        #10;
        if (sum !== 12'b111111111110 || cout !== 1'b1) 
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule