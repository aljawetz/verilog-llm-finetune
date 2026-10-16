`timescale 1ns/1ps

module tb_d_latch;

    reg rst;
    reg en;
    reg D;
    wire Q;

    // Instantiate the D latch
    d_latch uut (
        .rst(rst),
        .en(en),
        .D(D),
        .Q(Q)
    );

    initial begin
        // Initialize signals
        rst = 1;
        en = 0;
        D = 0;

        // Test 1: Reset functionality
        #10;
        rst = 0; // Assert reset
        #5;
        if (Q !== 0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end

        // Test 2: Enable and set D
        rst = 1; // Deassert reset
        en = 1;  // Enable the latch
        D = 1;   // Set D to 1
        #5;
        if (Q !== 1) begin
            $display("FAIL: Q did not follow D when enabled");
            $finish;
        end

        // Test 3: Disable and retain value
        en = 0;  // Disable the latch
        #5;
        if (Q !== 1) begin
            $display("FAIL: Q changed when disabled");
            $finish;
        end

        // Test 4: Change D while disabled
        D = 0;   // Change D to 0
        #5;
        if (Q !== 1) begin
            $display("FAIL: Q changed when D changed while disabled");
            $finish;
        end

        // Test 5: Enable again and change D
        en = 1;  // Enable the latch
        #5;
        if (Q !== 0) begin
            $display("FAIL: Q did not follow D after enabling again");
            $finish;
        end

        // Test 6: Reset again
        rst = 0; // Assert reset
        #5;
        if (Q !== 0) begin
            $display("FAIL: Reset did not set Q to 0 again");
            $finish;
        end

        // Test 7: Enable after reset
        rst = 1; // Deassert reset
        en = 1;  // Enable the latch
        D = 1;   // Set D to 1
        #5;
        if (Q !== 1) begin
            $display("FAIL: Q did not follow D after reset and enable");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule