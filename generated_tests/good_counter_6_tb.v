`timescale 1ns/1ps

module tb_good_counter;

    reg clk;
    reg reset;
    wire [1:0] cnt;

    // Instantiate the module under test (uut)
    good_counter uut (
        .clk(clk),
        .reset(reset),
        .cnt(cnt)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Check initial value
        if (cnt !== 2'b00) begin
            $display("FAIL: Initial count is not zero");
            $finish;
        end

        // Test counting
        #10; // Wait for 10ns
        if (cnt !== 2'b01) begin
            $display("FAIL: Count did not increment to 1");
            $finish;
        end

        #10; // Wait for 10ns
        if (cnt !== 2'b10) begin
            $display("FAIL: Count did not increment to 2");
            $finish;
        end

        #10; // Wait for 10ns
        if (cnt !== 2'b00) begin
            $display("FAIL: Count did not reset to 0 after reaching 2");
            $finish;
        end

        // Continue counting
        #10; // Wait for 10ns
        if (cnt !== 2'b01) begin
            $display("FAIL: Count did not increment to 1 after reset");
            $finish;
        end

        #10; // Wait for 10ns
        if (cnt !== 2'b10) begin
            $display("FAIL: Count did not increment to 2 again");
            $finish;
        end

        #10; // Wait for 10ns
        if (cnt !== 2'b00) begin
            $display("FAIL: Count did not reset to 0 after reaching 2 again");
            $finish;
        end

        // Test reset functionality
        #10; // Wait for 10ns
        reset = 1; // Assert reset
        #10; // Wait for 10ns
        reset = 0; // Deassert reset

        // Check if count is reset
        if (cnt !== 2'b00) begin
            $display("FAIL: Count did not reset to 0 after reset signal");
            $finish;
        end

        // Final check
        #10; // Wait for 10ns
        if (cnt !== 2'b01) begin
            $display("FAIL: Count did not increment to 1 after reset");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule