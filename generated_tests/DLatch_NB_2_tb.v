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
        #10; // Wait for 10 ns
        en = 1; // Enable the latch
        d = 1; // Set input to 1
        #10; // Wait for 10 ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Expected q=1, qbar=0 when d=1 and en=1");
            $finish;
        end

        #10; // Wait for 10 ns
        d = 0; // Change input to 0
        #10; // Wait for 10 ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Expected q=0, qbar=1 when d=0 and en=1");
            $finish;
        end

        #10; // Wait for 10 ns
        en = 0; // Disable the latch
        #10; // Wait for 10 ns
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Expected q=0, qbar=1 when en=0 (should hold state)");
            $finish;
        end

        #10; // Wait for 10 ns
        en = 1; // Enable the latch again
        d = 1; // Set input to 1
        #10; // Wait for 10 ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Expected q=1, qbar=0 when d=1 and en=1");
            $finish;
        end

        #10; // Wait for 10 ns
        en = 0; // Disable the latch
        #10; // Wait for 10 ns
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Expected q=1, qbar=0 when en=0 (should hold state)");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule