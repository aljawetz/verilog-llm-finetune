`timescale 1ns/1ps

module tb_seq_dlatch_rst_bh;

    reg en;
    reg d;
    reg rst;
    wire q;

    // Instantiate the module under test (uut)
    seq_dlatch_rst_bh uut (
        .q(q),
        .en(en),
        .d(d),
        .rst(rst)
    );

    initial begin
        // Initialize inputs
        en = 0;
        d = 0;
        rst = 0;

        // Test sequence
        // Test 1: Check reset functionality
        rst = 1; #10; // Apply reset
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Check latch functionality when enabled
        rst = 0; // Release reset
        en = 1; d = 1; #10; // Enable and set d to 1
        if (q !== 1'b1) begin
            $display("FAIL: q did not update to d when enabled");
            $finish;
        end

        // Test 3: Check latch holds value when enabled
        #10; // Wait
        if (q !== 1'b1) begin
            $display("FAIL: q changed when it should hold value");
            $finish;
        end

        // Test 4: Check latch functionality when d changes
        d = 0; #10; // Change d to 0
        if (q !== 1'b1) begin
            $display("FAIL: q changed when it should hold value");
            $finish;
        end

        // Test 5: Disable latch and check output
        en = 0; #10; // Disable latch
        if (q !== 1'b1) begin
            $display("FAIL: q changed when it should hold value after disable");
            $finish;
        end

        // Test 6: Re-enable and check update
        en = 1; d = 0; #10; // Enable and set d to 0
        if (q !== 1'b0) begin
            $display("FAIL: q did not update to d when enabled");
            $finish;
        end

        // Test 7: Check reset again
        rst = 1; #10; // Apply reset
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule