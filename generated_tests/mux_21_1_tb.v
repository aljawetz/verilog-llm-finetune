`timescale 1ns/1ps

module tb_mux_21;

    reg sel;
    reg d0;
    reg d1;
    wire out;

    // Instantiate the module under test (uut)
    mux_21 uut (
        .sel(sel),
        .d0(d0),
        .d1(d1),
        .out(out)
    );

    initial begin
        // Test sequence
        // Test case 1: sel = 0, d0 = 0, d1 = 0
        sel = 0; d0 = 0; d1 = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 1 failed, expected out = 0, got out = %b", out);

        // Test case 2: sel = 0, d0 = 1, d1 = 0
        sel = 0; d0 = 1; d1 = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);

        // Test case 3: sel = 1, d0 = 0, d1 = 1
        sel = 1; d0 = 0; d1 = 1;
        #10;
        if (out !== 1) $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);

        // Test case 4: sel = 1, d0 = 1, d1 = 0
        sel = 1; d0 = 1; d1 = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 4 failed, expected out = 0, got out = %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule