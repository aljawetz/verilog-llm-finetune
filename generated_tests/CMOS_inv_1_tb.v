`timescale 1ns/1ps

module tb_CMOS_inv;

    reg in;
    wire out;

    // Instantiate the module under test (uut)
    CMOS_inv uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Initialize input
        in = 0;

        // Test case 1: Check output when input is 0
        #10;
        if (out !== 1'b1) begin
            $display("FAIL: Expected out = 1 when in = 0, got out = %b", out);
            $finish;
        end

        // Test case 2: Check output when input is 1
        in = 1;
        #10;
        if (out !== 1'b0) begin
            $display("FAIL: Expected out = 0 when in = 1, got out = %b", out);
            $finish;
        end

        // Test case 3: Check output when input toggles
        in = 0;
        #10;
        if (out !== 1'b1) begin
            $display("FAIL: Expected out = 1 when in = 0, got out = %b", out);
            $finish;
        end

        in = 1;
        #10;
        if (out !== 1'b0) begin
            $display("FAIL: Expected out = 0 when in = 1, got out = %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule