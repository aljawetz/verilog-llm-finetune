`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the D flip-flop
    dff uut (
        .d(d),
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
        // Initialize
        rst = 1; d = 0;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Test case 1: Check reset functionality
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test case 2: Check D input propagation
        d = 1; #10; // Wait for one clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: D input did not propagate correctly");
            $finish;
        end

        // Test case 3: Check D input propagation with reset
        d = 0; #10; // Wait for one clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: D input did not propagate correctly after setting d to 0");
            $finish;
        end

        // Test case 4: Check reset functionality again
        rst = 1; #10; // Wait for reset
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1 again");
            $finish;
        end

        // Test case 5: Check D input propagation after reset
        rst = 0; d = 1; #10; // Wait for one clock cycle
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: D input did not propagate correctly after reset");
            $finish;
        end

        // Test case 6: Final check with d = 0
        d = 0; #10; // Wait for one clock cycle
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Final check failed with d = 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule