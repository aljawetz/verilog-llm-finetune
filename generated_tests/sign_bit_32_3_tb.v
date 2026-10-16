`timescale 1ns/1ps

module tb_sign_bit_32;

    reg [31:0] in1;
    reg [31:0] in2;
    wire sign;

    // Instantiate the module under test (uut)
    sign_bit_32 uut (
        .sign(sign),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: Both inputs have the same sign (positive)
        in1 = 32'b01111111111111111111111111111111; // +2147483647
        in2 = 32'b01111111111111111111111111111111; // +2147483647
        #10;
        if (sign !== 1'b0) $display("FAIL: Test case 1 failed, expected sign = 0, got sign = %b", sign);

        // Test case 2: Both inputs have the same sign (negative)
        in1 = 32'b10000000000000000000000000000000; // -2147483648
        in2 = 32'b10000000000000000000000000000000; // -2147483648
        #10;
        if (sign !== 1'b0) $display("FAIL: Test case 2 failed, expected sign = 0, got sign = %b", sign);

        // Test case 3: Inputs have different signs (in1 positive, in2 negative)
        in1 = 32'b01111111111111111111111111111111; // +2147483647
        in2 = 32'b10000000000000000000000000000001; // -2147483647
        #10;
        if (sign !== 1'b1) $display("FAIL: Test case 3 failed, expected sign = 1, got sign = %b", sign);

        // Test case 4: Inputs have different signs (in1 negative, in2 positive)
        in1 = 32'b10000000000000000000000000000001; // -2147483647
        in2 = 32'b01111111111111111111111111111111; // +2147483647
        #10;
        if (sign !== 1'b1) $display("FAIL: Test case 4 failed, expected sign = 1, got sign = %b", sign);

        // Test case 5: Both inputs are zero
        in1 = 32'b00000000000000000000000000000000; // 0
        in2 = 32'b00000000000000000000000000000000; // 0
        #10;
        if (sign !== 1'b0) $display("FAIL: Test case 5 failed, expected sign = 0, got sign = %b", sign);

        // Test case 6: One input is zero, the other is positive
        in1 = 32'b00000000000000000000000000000000; // 0
        in2 = 32'b01111111111111111111111111111111; // +2147483647
        #10;
        if (sign !== 1'b1) $display("FAIL: Test case 6 failed, expected sign = 1, got sign = %b", sign);

        // Test case 7: One input is zero, the other is negative
        in1 = 32'b00000000000000000000000000000000; // 0
        in2 = 32'b10000000000000000000000000000001; // -2147483647
        #10;
        if (sign !== 1'b1) $display("FAIL: Test case 7 failed, expected sign = 1, got sign = %b", sign);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule