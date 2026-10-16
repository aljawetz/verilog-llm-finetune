`timescale 1ns/1ps

module tb_bit_shift;

    reg [15:0] in;
    reg [1:0] oper;
    wire [15:0] out;

    // Instantiate the module under test (uut)
    bit_shift uut (
        .in(in),
        .oper(oper),
        .out(out)
    );

    initial begin
        // Test case 1: Rotate left
        in = 16'b0000000000000001; oper = 2'b00; #10;
        if (out !== 16'b0000000000000010) $display("FAIL: Rotate left failed");

        // Test case 2: Shift left
        in = 16'b0000000000000001; oper = 2'b01; #10;
        if (out !== 16'b0000000000000000) $display("FAIL: Shift left failed");

        // Test case 3: Rotate right
        in = 16'b0000000000000001; oper = 2'b10; #10;
        if (out !== 16'b1000000000000000) $display("FAIL: Rotate right failed");

        // Test case 4: Shift right logical
        in = 16'b0000000000000001; oper = 2'b11; #10;
        if (out !== 16'b0000000000000000) $display("FAIL: Shift right logical failed");

        // Test case 5: Rotate left with different input
        in = 16'b1010101010101010; oper = 2'b00; #10;
        if (out !== 16'b0101010101010101) $display("FAIL: Rotate left with different input failed");

        // Test case 6: Shift left with different input
        in = 16'b1010101010101010; oper = 2'b01; #10;
        if (out !== 16'b0101010101010100) $display("FAIL: Shift left with different input failed");

        // Test case 7: Rotate right with different input
        in = 16'b1010101010101010; oper = 2'b10; #10;
        if (out !== 16'b0101010101010101) $display("FAIL: Rotate right with different input failed");

        // Test case 8: Shift right logical with different input
        in = 16'b1010101010101010; oper = 2'b11; #10;
        if (out !== 16'b0101010101010101) $display("FAIL: Shift right logical with different input failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule