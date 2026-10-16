`timescale 1ns/1ps

module tb_sign_bit_32;

    // Inputs
    reg [31:0] in1;
    reg [31:0] in2;

    // Output
    wire sign;

    // Instantiate the Unit Under Test (UUT)
    sign_bit_32 uut (
        .sign(sign),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: Both inputs have the same sign (positive)
        in1 = 32'h00000001; // +1
        in2 = 32'h00000002; // +2
        #10;
        if (sign !== 1'b0) $display("FAIL: Test case 1 failed, expected sign = 0, got sign = %b", sign);

        // Test case 2: Both inputs have the same sign (negative)
        in1 = 32'hFFFFFFFF; // -1
        in2 = 32'hFFFFFFFE; // -2
        #10;
        if (sign !== 1'b0) $display("FAIL: Test case 2 failed, expected sign = 0, got sign = %b", sign);

        // Test case 3: Inputs have different signs (positive and negative)
        in1 = 32'h00000001; // +1
        in2 = 32'hFFFFFFFF; // -1
        #10;
        if (sign !== 1'b1) $display("FAIL: Test case 3 failed, expected sign = 1, got sign = %b", sign);

        // Test case 4: Inputs have different signs (negative and positive)
        in1 = 32'hFFFFFFFF; // -1
        in2 = 32'h00000002; // +2
        #10;
        if (sign !== 1'b1) $display("FAIL: Test case 4 failed, expected sign = 1, got sign = %b", sign);

        // Test case 5: Both inputs are zero
        in1 = 32'h00000000; // 0
        in2 = 32'h00000000; // 0
        #10;
        if (sign !== 1'b0) $display("FAIL: Test case 5 failed, expected sign = 0, got sign = %b", sign);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule