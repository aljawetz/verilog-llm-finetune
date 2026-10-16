`timescale 1ns/1ps

module tb_jk_flipflop;

    reg j, k, clk, rst;
    wire q, qbar;

    // Instantiate the JK flip-flop
    jk_flipflop uut (
        .j(j),
        .k(k),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        j = 0; k = 0; rst = 1; // Reset state
        #10; // Wait for reset to take effect

        // Check reset condition
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Release reset
        rst = 0;
        #10;

        // Test case 1: J=1, K=0 (Set)
        j = 1; k = 0;
        #10; // Wait for clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: J=1, K=0 did not set q to 1 and qbar to 0");
            $finish;
        end

        // Test case 2: J=0, K=1 (Reset)
        j = 0; k = 1;
        #10; // Wait for clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: J=0, K=1 did not reset q to 0 and qbar to 1");
            $finish;
        end

        // Test case 3: J=1, K=1 (Toggle)
        j = 1; k = 1;
        #10; // Wait for clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: J=1, K=1 did not toggle q to 1 and qbar to 0");
            $finish;
        end

        // Test case 4: J=0, K=0 (Hold)
        j = 0; k = 0;
        #10; // Wait for clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: J=0, K=0 did not hold q at 1 and qbar at 0");
            $finish;
        end

        // Test case 5: Reset again
        rst = 1;
        #10; // Wait for reset to take effect
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule