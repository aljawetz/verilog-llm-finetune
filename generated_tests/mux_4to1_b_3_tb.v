`timescale 1ns/1ps

module tb_mux_4to1_b;

    reg a, b, c, d;
    reg [1:0] sel;
    wire out;

    // Instantiate the module under test (uut)
    mux_4to1_b uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Initialize inputs
        a = 0; b = 0; c = 0; d = 0; sel = 2'b00;

        // Test case 1: Select input a
        a = 1; b = 0; c = 0; d = 0; sel = 2'b00;
        #10;
        if (out !== a) $display("FAIL: Test case 1 failed, expected %b but got %b", a, out);

        // Test case 2: Select input b
        a = 0; b = 1; c = 0; d = 0; sel = 2'b01;
        #10;
        if (out !== b) $display("FAIL: Test case 2 failed, expected %b but got %b", b, out);

        // Test case 3: Select input c
        a = 0; b = 0; c = 1; d = 0; sel = 2'b10;
        #10;
        if (out !== c) $display("FAIL: Test case 3 failed, expected %b but got %b", c, out);

        // Test case 4: Select input d
        a = 0; b = 0; c = 0; d = 1; sel = 2'b11;
        #10;
        if (out !== d) $display("FAIL: Test case 4 failed, expected %b but got %b", d, out);

        // Test case 5: Check default case (should not happen with valid inputs)
        sel = 2'bxx; // Invalid selector
        #10;
        if (out !== 1'bz) $display("FAIL: Test case 5 failed, expected high impedance but got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule