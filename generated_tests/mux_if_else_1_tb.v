`timescale 1ns/1ps

module tb_mux_if_else;

    reg a;
    reg b;
    reg c;
    reg d;
    reg [1:0] sel;
    wire out;

    // Instantiate the module under test (uut)
    mux_if_else uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: sel = 00, expect out = a
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; sel = 2'b00;
        #10;
        if (out !== a) $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", a, out);

        // Test case 2: sel = 01, expect out = b
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; sel = 2'b01;
        #10;
        if (out !== b) $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", b, out);

        // Test case 3: sel = 10, expect out = c
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; sel = 2'b10;
        #10;
        if (out !== c) $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", c, out);

        // Test case 4: sel = 11, expect out = d
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1; sel = 2'b11;
        #10;
        if (out !== d) $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", d, out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule