`timescale 1ns/1ps

module tb_mux_4_1_dataflow;

    // Inputs
    reg a;
    reg b;
    reg c;
    reg d;
    reg s0;
    reg s1;

    // Output
    wire out;

    // Instantiate the Unit Under Test (UUT)
    mux_4_1_dataflow uut (
        .a(a), 
        .b(b), 
        .c(c), 
        .d(d), 
        .s0(s0), 
        .s1(s1), 
        .out(out)
    );

    initial begin
        // Initialize Inputs
        a = 0; b = 0; c = 0; d = 0; s0 = 0; s1 = 0;

        // Test case 1: Select input a
        #10; a = 1; b = 0; c = 0; d = 0; s0 = 0; s1 = 0;
        #10; if (out !== 1) $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);

        // Test case 2: Select input b
        #10; a = 0; b = 1; c = 0; d = 0; s0 = 1; s1 = 0;
        #10; if (out !== 1) $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);

        // Test case 3: Select input c
        #10; a = 0; b = 0; c = 1; d = 0; s0 = 0; s1 = 1;
        #10; if (out !== 1) $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);

        // Test case 4: Select input d
        #10; a = 0; b = 0; c = 0; d = 1; s0 = 1; s1 = 1;
        #10; if (out !== 1) $display("FAIL: Test case 4 failed, expected out = 1, got out = %b", out);

        // Test case 5: All inputs low
        #10; a = 0; b = 0; c = 0; d = 0; s0 = 0; s1 = 0;
        #10; if (out !== 0) $display("FAIL: Test case 5 failed, expected out = 0, got out = %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule