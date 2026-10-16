`timescale 1ns/1ps

module tb_d_ff;

    reg d;
    reg clk;
    reg reset;
    wire q;

    // Instantiate the D flip-flop
    d_ff uut (
        .d(d),
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        d = 0;
        reset = 1; // Start with reset active
        #10; // Wait for 10ns

        // Deactivate reset
        reset = 0;
        #10;

        // Test case 1: Check reset functionality
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Set d to 1 and check q
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not update to 1 when d is 1");
            $finish;
        end

        // Test case 3: Set d to 0 and check q
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not update to 0 when d is 0");
            $finish;
        end

        // Test case 4: Check reset functionality again
        reset = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Test case 5: Check if q follows d after reset
        reset = 0; // Deactivate reset
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not update to 1 after reset deactivated");
            $finish;
        end

        // Test case 6: Final check with d = 0
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not update to 0 after reset deactivated");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule