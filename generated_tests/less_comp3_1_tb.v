`timescale 1ns/1ps

module tb_less_comp3;

    reg [2:0] in1;
    reg [2:0] in2;
    wire less;

    // Instantiate the module under test (uut)
    less_comp3 uut (
        .in1(in1),
        .in2(in2),
        .less(less)
    );

    initial begin
        // Test case 1: in1 < in2
        in1 = 3'b001; // 1
        in2 = 3'b010; // 2
        #10;
        if (less !== 1'b1) $display("FAIL: Test case 1 failed (1 < 2)");

        // Test case 2: in1 > in2
        in1 = 3'b011; // 3
        in2 = 3'b001; // 1
        #10;
        if (less !== 1'b0) $display("FAIL: Test case 2 failed (3 > 1)");

        // Test case 3: in1 == in2
        in1 = 3'b010; // 2
        in2 = 3'b010; // 2
        #10;
        if (less !== 1'b0) $display("FAIL: Test case 3 failed (2 == 2)");

        // Test case 4: in1 < in2 (edge case)
        in1 = 3'b000; // 0
        in2 = 3'b001; // 1
        #10;
        if (less !== 1'b1) $display("FAIL: Test case 4 failed (0 < 1)");

        // Test case 5: in1 > in2 (edge case)
        in1 = 3'b111; // 7
        in2 = 3'b110; // 6
        #10;
        if (less !== 1'b0) $display("FAIL: Test case 5 failed (7 > 6)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule