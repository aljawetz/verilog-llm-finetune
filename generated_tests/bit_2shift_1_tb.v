`timescale 1ns/1ps

module tb_bit_2shift;

    reg [15:0] in;
    reg [1:0] oper;
    wire [15:0] out;

    // Instantiate the module under test (uut)
    bit_2shift uut (
        .in(in),
        .oper(oper),
        .out(out)
    );

    initial begin
        // Test case 1: Rotate left
        in = 16'b0000000000000001; oper = 2'b00; #10;
        if (out !== 16'b0000000000000010) $display("FAIL: Rotate left test case 1 failed");

        // Test case 2: Shift left
        in = 16'b0000000000000001; oper = 2'b01; #10;
        if (out !== 16'b0000000000000000) $display("FAIL: Shift left test case 2 failed");

        // Test case 3: Rotate right
        in = 16'b0000000000000001; oper = 2'b10; #10;
        if (out !== 16'b1000000000000000) $display("FAIL: Rotate right test case 3 failed");

        // Test case 4: Shift right logical
        in = 16'b0000000000000001; oper = 2'b11; #10;
        if (out !== 16'b0000000000000000) $display("FAIL: Shift right logical test case 4 failed");

        // Test case 5: Rotate left with a different input
        in = 16'b0000000000000011; oper = 2'b00; #10;
        if (out !== 16'b0000000000000110) $display("FAIL: Rotate left test case 5 failed");

        // Test case 6: Shift left with a different input
        in = 16'b0000000000000011; oper = 2'b01; #10;
        if (out !== 16'b0000000000000110) $display("FAIL: Shift left test case 6 failed");

        // Test case 7: Rotate right with a different input
        in = 16'b0000000000000011; oper = 2'b10; #10;
        if (out !== 16'b1000000000000001) $display("FAIL: Rotate right test case 7 failed");

        // Test case 8: Shift right logical with a different input
        in = 16'b0000000000000011; oper = 2'b11; #10;
        if (out !== 16'b0000000000000001) $display("FAIL: Shift right logical test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule