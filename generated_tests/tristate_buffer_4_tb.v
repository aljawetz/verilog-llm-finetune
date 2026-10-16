`timescale 1ns/1ps

module tb_tristate_buffer;

    reg a;
    reg sel;
    wire out;

    // Instantiate the module under test (uut)
    tristate_buffer uut (
        .a(a),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test sequence
        // Test case 1: sel = 0, expect out = Z
        sel = 0; a = 1; #10;
        if (out !== 1'bz) begin
            $display("FAIL: Test case 1 failed, expected out = Z, got out = %b", out);
            $finish;
        end

        // Test case 2: sel = 1, a = 0, expect out = 0
        sel = 1; a = 0; #10;
        if (out !== 0) begin
            $display("FAIL: Test case 2 failed, expected out = 0, got out = %b", out);
            $finish;
        end

        // Test case 3: sel = 1, a = 1, expect out = 1
        a = 1; #10;
        if (out !== 1) begin
            $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);
            $finish;
        end

        // Test case 4: sel = 0 again, expect out = Z
        sel = 0; #10;
        if (out !== 1'bz) begin
            $display("FAIL: Test case 4 failed, expected out = Z, got out = %b", out);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule