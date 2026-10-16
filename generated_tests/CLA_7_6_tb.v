`timescale 1ns/1ps

module tb_CLA_7;

    reg [6:0] in1;
    reg [6:0] in2;
    wire [6:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    CLA_7 uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: 0 + 0 = 0
        in1 = 7'b0000000; 
        in2 = 7'b0000000; 
        #10;
        if (sum !== 7'b0000000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 = 10 (binary)
        in1 = 7'b0000001; 
        in2 = 7'b0000001; 
        #10;
        if (sum !== 7'b0000000 || cout !== 1'b1) $display("FAIL: Test case 2 failed");

        // Test case 3: 5 + 3 = 8
        in1 = 7'b0000101; 
        in2 = 7'b0000011; 
        #10;
        if (sum !== 7'b0001000 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 15 + 1 = 16
        in1 = 7'b0001111; 
        in2 = 7'b0000001; 
        #10;
        if (sum !== 7'b0010000 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 63 + 1 = 64
        in1 = 7'b0111111; 
        in2 = 7'b0000001; 
        #10;
        if (sum !== 7'b1000000 || cout !== 1'b0) $display("FAIL: Test case 5 failed");

        // Test case 6: 32 + 32 = 64
        in1 = 7'b0100000; 
        in2 = 7'b0100000; 
        #10;
        if (sum !== 7'b1000000 || cout !== 1'b0) $display("FAIL: Test case 6 failed");

        // Test case 7: 50 + 50 = 100
        in1 = 7'b0110010; 
        in2 = 7'b0110010; 
        #10;
        if (sum !== 7'b1100100 || cout !== 1'b0) $display("FAIL: Test case 7 failed");

        // Test case 8: 70 + 70 = 140
        in1 = 7'b1000110; 
        in2 = 7'b1000110; 
        #10;
        if (sum !== 7'b1000110 || cout !== 1'b1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule