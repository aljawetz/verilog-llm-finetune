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
        // Test case 1: Both inputs are positive
        in1 = 32'b00000000000000000000000000000001; // +1
        in2 = 32'b00000000000000000000000000000001; // +1
        #10;
        if (sign !== 1'b0) $display("FAIL: Test case 1 failed, expected sign = 0, got sign = %b", sign);

        // Test case 2: One positive and one negative
        in1 = 32'b00000000000000000000000000000001; // +1
        in2 = 32'b10000000000000000000000000000001; // -1
        #10;
        if (sign !== 1'b1) $display("FAIL: Test case 2 failed, expected sign = 1, got sign = %b", sign);

        // Test case 3: Both inputs are negative
        in1 = 32'b10000000000000000000000000000001; // -1
        in2 = 32'b10000000000000000000000000000010; // -2
        #10;
        if (sign !== 1'b0) $display("FAIL: Test case 3 failed, expected sign = 0, got sign = %b", sign);

        // Test case 4: Both inputs are zero
        in1 = 32'b00000000000000000000000000000000; // 0
        in2 = 32'b00000000000000000000000000000000; // 0
        #10;
        if (sign !== 1'b0) $display("FAIL: Test case 4 failed, expected sign = 0, got sign = %b", sign);

        // Test case 5: One input zero, one negative
        in1 = 32'b00000000000000000000000000000000; // 0
        in2 = 32'b10000000000000000000000000000001; // -1
        #10;
        if (sign !== 1'b1) $display("FAIL: Test case 5 failed, expected sign = 1, got sign = %b", sign);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule