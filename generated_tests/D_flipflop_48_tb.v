`timescale 1ns/1ps

module tb_D_flipflop;

    reg clk;
    reg reset;
    reg d;
    wire Q;

    // Instantiate the D_flipflop module
    D_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .Q(Q)
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

        // Wait for a clock edge
        #10;

        // Test reset functionality
        reset = 1; // Assert reset
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when reset is asserted.");
            $finish;
        end

        // Release reset and test D input
        reset = 0;
        #10;

        // Test D input capture
        d = 1; // Set D to 1
        #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 after capturing D when reset is not asserted.");
            $finish;
        end

        // Change D input
        d = 0; // Set D to 0
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 after capturing D when reset is not asserted.");
            $finish;
        end

        // Test multiple clock cycles
        d = 1; // Set D to 1
        #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q should be 1 after capturing D again.");
            $finish;
        end

        // Assert reset again
        reset = 1; // Assert reset
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q should be 0 when reset is asserted again.");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule