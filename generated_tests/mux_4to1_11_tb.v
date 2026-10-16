`timescale 1ns/1ps

module tb_mux_4to1;

    // Inputs
    reg a;
    reg b;
    reg c;
    reg d;
    reg [1:0] s;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    mux_4to1 uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        // Initialize inputs
        a = 0; b = 0; c = 0; d = 0; s = 2'b00;

        // Test case 1: Select input a
        a = 1; b = 0; c = 0; d = 0; s = 2'b00;
        #10;
        if (y !== a) $display("FAIL: Test case 1 failed, expected %b, got %b", a, y);

        // Test case 2: Select input b
        a = 0; b = 1; c = 0; d = 0; s = 2'b01;
        #10;
        if (y !== b) $display("FAIL: Test case 2 failed, expected %b, got %b", b, y);

        // Test case 3: Select input c
        a = 0; b = 0; c = 1; d = 0; s = 2'b10;
        #10;
        if (y !== c) $display("FAIL: Test case 3 failed, expected %b, got %b", c, y);

        // Test case 4: Select input d
        a = 0; b = 0; c = 0; d = 1; s = 2'b11;
        #10;
        if (y !== d) $display("FAIL: Test case 4 failed, expected %b, got %b", d, y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule