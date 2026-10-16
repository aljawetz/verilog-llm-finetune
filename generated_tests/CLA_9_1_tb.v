`timescale 1ns/1ps

module tb_CLA_9;

    reg [8:0] in1;
    reg [8:0] in2;
    wire [8:0] sum;
    wire cout;

    CLA_99 uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: 0 + 0
        in1 = 9'b000000000; 
        in2 = 9'b000000000; 
        #10;
        if (sum !== 9'b000000000 || cout !== 1'b0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: 1 + 1
        in1 = 9'b000000001; 
        in2 = 9'b000000001; 
        #10;
        if (sum !== 9'b000000010 || cout !== 1'b0) 
            $display("FAIL: Test case 2 failed");
        
        // Test case 3: 255 + 1
        in1 = 9'b111111111; 
        in2 = 9'b000000001; 
        #10;
        if (sum !== 9'b000000000 || cout !== 1'b1) 
            $display("FAIL: Test case 3 failed");
        
        // Test case 4: 128 + 128
        in1 = 9'b010000000; 
        in2 = 9'b010000000; 
        #10;
        if (sum !== 9'b100000000 || cout !== 1'b0) 
            $display("FAIL: Test case 4 failed");
        
        // Test case 5: 100 + 50
        in1 = 9'b011001100; 
        in2 = 9'b001100110; 
        #10;
        if (sum !== 9'b100110010 || cout !== 1'b0) 
            $display("FAIL: Test case 5 failed");

        // Test case 6: 255 + 255
        in1 = 9'b111111111; 
        in2 = 9'b111111111; 
        #10;
        if (sum !== 9'b111111110 || cout !== 1'b1) 
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule