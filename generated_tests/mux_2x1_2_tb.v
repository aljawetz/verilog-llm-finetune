`timescale 1ns/1ps

module tb_mux_2x1;

    // Inputs
    reg sel;
    reg i0;
    reg i1;

    // Output
    wire out;

    // Instantiate the Unit Under Test (UUT)
    mux_2x1 uut (
        .sel(sel),
        .i0(i0),
        .i1(i1),
        .out(out)
    );

    initial begin
        // Test case 1: sel = 0, i0 = 0, i1 = 0
        sel = 0; i0 = 0; i1 = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 1 failed, expected out = 0, got out = %b", out);

        // Test case 2: sel = 0, i0 = 1, i1 = 0
        sel = 0; i0 = 1; i1 = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);

        // Test case 3: sel = 1, i0 = 0, i1 = 1
        sel = 1; i0 = 0; i1 = 1;
        #10;
        if (out !== 1) $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);

        // Test case 4: sel = 1, i0 = 1, i1 = 0
        sel = 1; i0 = 1; i1 = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 4 failed, expected out = 0, got out = %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule