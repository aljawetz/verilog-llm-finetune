`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg reset;
    reg clk;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
        .d(d),
        .reset(reset),
        .clk(clk),
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
        reset = 1;

        // Wait for a clock edge
        #10;

        // Test case 1: Check reset functionality
        reset = 0; // Assert reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Release reset
        reset = 1;
        #10;

        // Test case 2: Check D input functionality
        d = 1; // Set D to 1
        #10; // Wait for clock edge
        if (q !== 1) begin
            $display("FAIL: q did not update to D when reset is high");
            $finish;
        end

        // Test case 3: Change D input
        d = 0; // Set D to 0
        #10; // Wait for clock edge
        if (q !== 0) begin
            $display("FAIL: q did not update to D when reset is high");
            $finish;
        end

        // Test case 4: Assert reset again
        reset = 0; // Assert reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Test case 5: Check D input after reset
        reset = 1; // Release reset
        d = 1; // Set D to 1
        #10; // Wait for clock edge
        if (q !== 1) begin
            $display("FAIL: q did not update to D after reset was released");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule