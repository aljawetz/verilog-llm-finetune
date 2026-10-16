`timescale 1ns/1ps

module tb_d_latch;

    reg d;
    reg en;
    reg rst;
    wire q;

    // Instantiate the D-latch module
    d_latch uut (
        .q(q),
        .d(d),
        .en(en),
        .rst(rst)
    );

    initial begin
        // Initialize inputs
        d = 0;
        en = 0;
        rst = 0;

        // Test sequence
        // Test 1: Check reset functionality
        rst = 1; #10; // Assert reset
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not clear output");
            $finish;
        end

        rst = 0; // Deassert reset

        // Test 2: Check output when enabled
        en = 1; d = 1; #10; // Set d to 1
        if (q !== 1'b1) begin
            $display("FAIL: Output did not match input d when enabled");
            $finish;
        end

        d = 0; #10; // Change d to 0
        if (q !== 1'b0) begin
            $display("FAIL: Output did not match input d when enabled");
            $finish;
        end

        // Test 3: Check output when disabled
        en = 0; d = 1; #10; // Set d to 1 but disable
        if (q !== 1'b0) begin
            $display("FAIL: Output changed when disabled");
            $finish;
        end

        // Test 4: Check reset again
        rst = 1; #10; // Assert reset
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not clear output");
            $finish;
        end

        // Finalize the test
        $display("PASS");
        $finish;
    end

endmodule