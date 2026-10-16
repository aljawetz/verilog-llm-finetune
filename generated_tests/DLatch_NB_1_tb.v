`timescale 1ns/1ps

module tb_DLatch_NB;

    reg d;
    reg en;
    wire q;
    wire qbar;

    // Instantiate the DLatch_NB module
    DLatch_NB uut (
        .d(d),
        .en(en),
        .q(q),
        .qbar(qbar)
    );

    initial begin
        // Initialize inputs
        d = 0;
        en = 0;

        // Test sequence
        // Test 1: Check output when enabled
        en = 1; d = 1; #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test 1 failed - expected q=1, qbar=0 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test 2: Change input while enabled
        d = 0; #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test 2 failed - expected q=0, qbar=1 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test 3: Disable the latch and check outputs
        en = 0; #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test 3 failed - expected q=0, qbar=1 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test 4: Change input while disabled
        d = 1; #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test 4 failed - expected q=0, qbar=1 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Test 5: Re-enable and check output
        en = 1; #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test 5 failed - expected q=1, qbar=0 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // Final check with different input
        d = 0; #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Final check failed - expected q=0, qbar=1 but got q=%b, qbar=%b", q, qbar);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule