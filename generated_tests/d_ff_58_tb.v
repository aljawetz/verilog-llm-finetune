`timescale 1ns/1ps

module tb_d_ff;

    reg clk;
    reg d;
    wire q;
    wire qbar;

    // Instantiate the D flip-flop
    d_ff uut (
        .clk(clk),
        .d(d),
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
        d = 0;

        // Wait for the first clock edge
        #10;

        // Test case 1: Check initial state
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Initial state check failed");
            $finish;
        end

        // Test case 2: Set d to 1
        d = 1;
        #10; // Wait for clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: d=1 check failed");
            $finish;
        end

        // Test case 3: Set d to 0
        d = 0;
        #10; // Wait for clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: d=0 check failed");
            $finish;
        end

        // Test case 4: Toggle d to 1 again
        d = 1;
        #10; // Wait for clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: d=1 after d=0 check failed");
            $finish;
        end

        // Test case 5: Toggle d to 0 again
        d = 0;
        #10; // Wait for clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: d=0 after d=1 check failed");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule