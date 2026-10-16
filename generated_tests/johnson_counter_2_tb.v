`timescale 1ns/1ps

module tb_johnson_counter;

    reg clk;
    reg rst_n;
    wire [3:0] q;

    // Instantiate the module under test (uut)
    johnson_counter uut (
        .clk(clk),
        .rst_n(rst_n),
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
        rst_n = 0; // Active low reset
        #10; // Wait for 10ns
        rst_n = 1; // Release reset

        // Check initial state
        if (q !== 4'b0000) begin
            $display("FAIL: Initial state is not zero");
            $finish;
        end

        // Run the counter for a few cycles
        #10; // Wait for 1 clock cycle
        if (q !== 4'b0001) begin
            $display("FAIL: Expected 0001, got %b", q);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q !== 4'b0011) begin
            $display("FAIL: Expected 0011, got %b", q);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q !== 4'b0111) begin
            $display("FAIL: Expected 0111, got %b", q);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q !== 4'b1111) begin
            $display("FAIL: Expected 1111, got %b", q);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q !== 4'b1110) begin
            $display("FAIL: Expected 1110, got %b", q);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q !== 4'b1100) begin
            $display("FAIL: Expected 1100, got %b", q);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q !== 4'b1000) begin
            $display("FAIL: Expected 1000, got %b", q);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (q !== 4'b0000) begin
            $display("FAIL: Expected 0000, got %b", q);
            $finish;
        end

        // Test reset functionality
        rst_n = 0; // Assert reset
        #10; // Wait for 1 clock cycle
        if (q !== 4'b0000) begin
            $display("FAIL: Expected 0000 after reset, got %b", q);
            $finish;
        end

        rst_n = 1; // Release reset
        #10; // Wait for 1 clock cycle
        if (q !== 4'b0001) begin
            $display("FAIL: Expected 0001 after reset release, got %b", q);
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule