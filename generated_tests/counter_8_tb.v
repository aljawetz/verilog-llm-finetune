`timescale 1ns/1ps

module tb_counter;

    reg clk;
    reg rst;
    wire [7:0] q;

    // Instantiate the counter module
    counter uut (
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
        // Initialize reset
        rst = 0;
        #10; // Wait for 10ns
        rst = 1; // Release reset

        // Check initial value after reset
        if (q !== 8'd0) begin
            $display("FAIL: Initial value after reset is not zero");
            $finish;
        end

        // Wait for a few clock cycles and check the counter value
        #10; // Wait for 1 clock cycle
        if (q !== 8'd1) begin
            $display("FAIL: Counter value is not 1 after 1 clock cycle");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (q !== 8'd2) begin
            $display("FAIL: Counter value is not 2 after 2 clock cycles");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (q !== 8'd3) begin
            $display("FAIL: Counter value is not 3 after 3 clock cycles");
            $finish;
        end

        // Assert reset functionality
        rst = 0; // Assert reset
        #10; // Wait for 1 clock cycle
        rst = 1; // Release reset

        // Check value after reset
        if (q !== 8'd0) begin
            $display("FAIL: Counter value is not zero after reset");
            $finish;
        end

        // Continue counting
        #10; // Wait for 1 clock cycle
        if (q !== 8'd1) begin
            $display("FAIL: Counter value is not 1 after reset and 1 clock cycle");
            $finish;
        end

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule