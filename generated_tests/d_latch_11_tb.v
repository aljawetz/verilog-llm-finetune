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
        // Test 1: Reset the latch
        rst = 1; #10;
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not clear output");
            $finish;
        end

        // Test 2: Enable and set d
        rst = 0; #10;
        en = 1; d = 1; #10;
        if (q !== 1'b1) begin
            $display("FAIL: Output did not match input d when enabled");
            $finish;
        end

        // Test 3: Disable and check output remains the same
        en = 0; #10;
        if (q !== 1'b1) begin
            $display("FAIL: Output changed when disabled");
            $finish;
        end

        // Test 4: Change d while disabled
        d = 0; #10;
        if (q !== 1'b1) begin
            $display("FAIL: Output changed when d was updated while disabled");
            $finish;
        end

        // Test 5: Re-enable and check output updates
        en = 1; #10;
        if (q !== 1'b0) begin
            $display("FAIL: Output did not update to new d when re-enabled");
            $finish;
        end

        // Test 6: Reset again
        rst = 1; #10;
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not clear output again");
            $finish;
        end

        // Test 7: Enable after reset
        rst = 0; #10;
        en = 1; d = 1; #10;
        if (q !== 1'b1) begin
            $display("FAIL: Output did not match input d after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule