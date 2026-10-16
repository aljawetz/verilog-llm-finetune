`timescale 1ns/1ps

module tb_mux_2x1;

    // Inputs
    reg a;
    reg b;
    reg sel;

    // Output
    wire out;

    // Instantiate the module under test (uut)
    mux_2x1 uut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: sel = 0, expect out = a
        a = 1; b = 0; sel = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);

        // Test case 2: sel = 0, expect out = a
        a = 0; b = 1; sel = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 2 failed, expected out = 0, got out = %b", out);

        // Test case 3: sel = 1, expect out = b
        a = 1; b = 0; sel = 1;
        #10;
        if (out !== 0) $display("FAIL: Test case 3 failed, expected out = 0, got out = %b", out);

        // Test case 4: sel = 1, expect out = b
        a = 0; b = 1; sel = 1;
        #10;
        if (out !== 1) $display("FAIL: Test case 4 failed, expected out = 1, got out = %b", out);

        // Test case 5: sel = 0, a = 1, b = 1, expect out = a
        a = 1; b = 1; sel = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 5 failed, expected out = 1, got out = %b", out);

        // Test case 6: sel = 1, a = 1, b = 1, expect out = b
        a = 1; b = 1; sel = 1;
        #10;
        if (out !== 1) $display("FAIL: Test case 6 failed, expected out = 1, got out = %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule