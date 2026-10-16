`timescale 1ns/1ps

module tb_t_flipflop1;

    // Inputs
    reg t;
    reg clk;
    reg rst;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    t_flipflop1 uut (
        .t(t),
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 0; t = 0;
        #10; // Wait for 10ns

        // Test reset functionality
        rst = 1; // Release reset
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test toggling behavior
        t = 1; // Set T to toggle
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: Expected q to toggle to 1");
            $finish;
        end

        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Expected q to toggle to 0");
            $finish;
        end

        // Test holding state when T is low
        t = 0; // Set T to hold
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Expected q to remain 0");
            $finish;
        end

        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Expected q to remain 0");
            $finish;
        end

        // Test toggling again
        t = 1; // Set T to toggle
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: Expected q to toggle to 1");
            $finish;
        end

        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Expected q to toggle to 0");
            $finish;
        end

        // Final check
        rst = 0; // Assert reset
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule