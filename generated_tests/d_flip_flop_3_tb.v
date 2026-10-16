`timescale 1ns/1ps

module tb_d_flip_flop;

    // Testbench signals
    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the D flip-flop
    d_flip_flop uut (
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

        // Test reset functionality
        reset = 0; // Deactivate reset
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Reset did not set output to 0");
            $finish;
        end

        // Test data capture
        d = 1; // Set data to 1
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: Output did not capture data input correctly");
            $finish;
        end

        // Change data input
        d = 0; // Set data to 0
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Output did not capture data input correctly after change");
            $finish;
        end

        // Test reset functionality again
        reset = 1; // Activate reset
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Reset did not set output to 0 again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule