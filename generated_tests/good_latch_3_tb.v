`timescale 1ns/1ps

module tb_good_latch;

    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the module under test (uut)
    good_latch uut (
        .clk(clk),
        .reset(reset),
        .d(d),
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
        reset = 1;
        d = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Check output when d is 0
        d = 0;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q = 0 when d = 0");
            $finish;
        end

        // Test case 2: Check output when d is 1
        d = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: Expected q = 1 when d = 1");
            $finish;
        end

        // Test case 3: Check output remains the same on clock edge
        #10; // Wait for next clock edge
        if (q !== 1) begin
            $display("FAIL: Expected q = 1 after clock edge with d = 1");
            $finish;
        end

        // Test case 4: Check reset functionality
        reset = 1;
        #10; // Wait for reset to take effect
        if (q !== 0) begin
            $display("FAIL: Expected q = 0 after reset");
            $finish;
        end

        // Test case 5: Check output when d changes after reset
        reset = 0;
        d = 0;
        #10;
        if (q !== 0) begin
            $display("FAIL: Expected q = 0 when d = 0 after reset");
            $finish;
        end
        
        d = 1;
        #10;
        if (q !== 1) begin
            $display("FAIL: Expected q = 1 when d = 1 after reset");
            $finish;
        end

        // Final check to ensure q holds value
        #10; // Wait for next clock edge
        if (q !== 1) begin
            $display("FAIL: Expected q = 1 after clock edge with d = 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule