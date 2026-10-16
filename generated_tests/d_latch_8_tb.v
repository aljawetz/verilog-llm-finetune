`timescale 1ns/1ps

module tb_d_latch;

    reg d;
    reg en;
    reg rst;
    wire q;

    // Instantiate the D latch
    d_latch uut (
        .q(q),
        .d(d),
        .en(en),
        .rst(rst)
    );

    initial begin
        // Initialize signals
        d = 0;
        en = 0;
        rst = 0;

        // Test sequence
        // Test 1: Reset the latch
        rst = 1; #5;
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Enable latch with d = 1
        rst = 0; en = 1; d = 1; #5;
        if (q !== 1'b1) begin
            $display("FAIL: q did not follow d when enabled");
            $finish;
        end

        // Test 3: Disable latch
        en = 0; #5;
        if (q !== 1'b1) begin
            $display("FAIL: q changed when disabled");
            $finish;
        end

        // Test 4: Change d while disabled
        d = 0; #5;
        if (q !== 1'b1) begin
            $display("FAIL: q changed when d was updated while disabled");
            $finish;
        end

        // Test 5: Re-enable latch with d = 0
        en = 1; #5;
        if (q !== 1'b0) begin
            $display("FAIL: q did not follow d when re-enabled");
            $finish;
        end

        // Test 6: Reset while enabled
        rst = 1; #5;
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0 while enabled");
            $finish;
        end

        // Test 7: Enable and set d to 1 again
        rst = 0; en = 1; d = 1; #5;
        if (q !== 1'b1) begin
            $display("FAIL: q did not follow d after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule