`timescale 1ns/1ps

module tb_fp_add_10;

    // Parameters
    parameter N = 20;

    // Inputs
    reg [N-1:0] a;
    reg [N-1:0] b;

    // Outputs
    wire [N-1:0] c;

    // Instantiate the Unit Under Test (UUT)
    fp_add_10 uut (
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        // Test case 1: Both positive numbers
        a = 20'b00000000000000000001; // 1
        b = 20'b00000000000000000001; // 1
        #10;
        if (c !== 20'b00000000000000000010) $display("FAIL: Test case 1 failed");

        // Test case 2: Both negative numbers
        a = 20'b11111111111111111111; // -1
        b = 20'b11111111111111111111; // -1
        #10;
        if (c !== 20'b11111111111111111110) $display("FAIL: Test case 2 failed");

        // Test case 3: One positive, one negative (positive larger)
        a = 20'b00000000000000000010; // 2
        b = 20'b11111111111111111111; // -1
        #10;
        if (c !== 20'b00000000000000000001) $display("FAIL: Test case 3 failed");

        // Test case 4: One positive, one negative (negative larger)
        a = 20'b11111111111111111111; // -1
        b = 20'b00000000000000000010; // 2
        #10;
        if (c !== 20'b11111111111111111101) $display("FAIL: Test case 4 failed");

        // Test case 5: Zero addition
        a = 20'b00000000000000000000; // 0
        b = 20'b00000000000000000000; // 0
        #10;
        if (c !== 20'b00000000000000000000) $display("FAIL: Test case 5 failed");

        // Test case 6: Positive and zero
        a = 20'b00000000000000000000; // 0
        b = 20'b00000000000000000001; // 1
        #10;
        if (c !== 20'b00000000000000000001) $display("FAIL: Test case 6 failed");

        // Test case 7: Negative and zero
        a = 20'b11111111111111111111; // -1
        b = 20'b00000000000000000000; // 0
        #10;
        if (c !== 20'b11111111111111111111) $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule