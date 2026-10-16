`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    wire q;
    wire qbar;

    // Instantiate the D flip-flop module
    dff uut (
        .d(d),
        .clk(clk),
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
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Initial state check failed");
            $finish;
        end

        // Test case 1: Set d to 1
        d = 1;
        #10; // Wait for the next clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Set d to 0
        d = 0;
        #10; // Wait for the next clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Toggle d to 1 again
        d = 1;
        #10; // Wait for the next clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Toggle d to 0 again
        d = 0;
        #10; // Wait for the next clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule