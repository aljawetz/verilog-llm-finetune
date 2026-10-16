`timescale 1ns/1ps

module tb_top_module;

    // Inputs
    reg a;
    reg b;
    reg c;
    reg d;

    // Output
    wire out;

    // Instantiate the Unit Under Test (UUT)
    top_module uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .out(out)
    );

    initial begin
        // Test case 1: 0 XOR 0 XOR 0 XOR 0 = 0
        a = 0; b = 0; c = 0; d = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 1 failed, expected 0, got %b", out);

        // Test case 2: 0 XOR 0 XOR 0 XOR 1 = 1
        a = 0; b = 0; c = 0; d = 1;
        #10;
        if (out !== 1) $display("FAIL: Test case 2 failed, expected 1, got %b", out);

        // Test case 3: 0 XOR 0 XOR 1 XOR 1 = 0
        a = 0; b = 0; c = 1; d = 1;
        #10;
        if (out !== 0) $display("FAIL: Test case 3 failed, expected 0, got %b", out);

        // Test case 4: 0 XOR 1 XOR 1 XOR 1 = 1
        a = 0; b = 1; c = 1; d = 1;
        #10;
        if (out !== 1) $display("FAIL: Test case 4 failed, expected 1, got %b", out);

        // Test case 5: 1 XOR 1 XOR 1 XOR 1 = 0
        a = 1; b = 1; c = 1; d = 1;
        #10;
        if (out !== 0) $display("FAIL: Test case 5 failed, expected 0, got %b", out);

        // Test case 6: 1 XOR 1 XOR 1 XOR 0 = 1
        a = 1; b = 1; c = 1; d = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 6 failed, expected 1, got %b", out);

        // Test case 7: 1 XOR 0 XOR 0 XOR 0 = 1
        a = 1; b = 0; c = 0; d = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 7 failed, expected 1, got %b", out);

        // Test case 8: 1 XOR 1 XOR 0 XOR 0 = 0
        a = 1; b = 1; c = 0; d = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 8 failed, expected 0, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule