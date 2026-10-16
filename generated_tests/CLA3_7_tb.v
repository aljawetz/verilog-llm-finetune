`timescale 1ns/1ps

module tb_CLA3;
    reg [2:0] in1;
    reg [2:0] in2;
    wire [2:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    CLA3 uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: 0 + 0
        in1 = 3'b000; in2 = 3'b000; #10;
        if (sum !== 3'b000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");
        
        // Test case 2: 1 + 1
        in1 = 3'b001; in2 = 3'b001; #10;
        if (sum !== 3'b010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 1 + 2
        in1 = 3'b001; in2 = 3'b010; #10;
        if (sum !== 3'b011 || cout !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 3 + 3
        in1 = 3'b011; in2 = 3'b011; #10;
        if (sum !== 3'b110 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 4 + 2
        in1 = 3'b100; in2 = 3'b010; #10;
        if (sum !== 3'b110 || cout !== 1'b0) $display("FAIL: Test case 5 failed");

        // Test case 6: 5 + 3
        in1 = 3'b101; in2 = 3'b011; #10;
        if (sum !== 3'b000 || cout !== 1'b1) $display("FAIL: Test case 6 failed");

        // Test case 7: 6 + 1
        in1 = 3'b110; in2 = 3'b001; #10;
        if (sum !== 3'b111 || cout !== 1'b0) $display("FAIL: Test case 7 failed");

        // Test case 8: 7 + 1
        in1 = 3'b111; in2 = 3'b001; #10;
        if (sum !== 3'b000 || cout !== 1'b1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule