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
        // Test sequence
        // Test case 1: Input is 0, expect output to be 1
        in = 0;
        #10; // Wait for 10 time units
        if (out !== 1) begin
            $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);
            $finish;
        end

        // Test case 2: Input is 1, expect output to be 0
        in = 1;
        #10; // Wait for 10 time units
        if (out !== 0) begin
            $display("FAIL: Test case 2 failed, expected out = 0, got out = %b", out);
            $finish;
        end

        // Test case 3: Input toggling
        in = 0;
        #10; // Wait for 10 time units
        if (out !== 1) begin
            $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);
            $finish;
        end
        
        in = 1;
        #10; // Wait for 10 time units
        if (out !== 0) begin
            $display("FAIL: Test case 3 failed, expected out = 0, got out = %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule