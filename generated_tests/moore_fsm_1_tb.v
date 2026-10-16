`timescale 1ns/1ps

module tb_moore_fsm;

    reg clk;
    reg reset;
    wire [2:0] out;

    // Instantiate the module under test (uut)
    moore_fsm uut (
        .clk(clk),
        .reset(reset),
        .out(out)
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

        // Check initial state
        if (out !== 3'b000) begin
            $display("FAIL: Initial state is incorrect, expected 000, got %b", out);
            $finish;
        end

        // Cycle through states
        #10; // Wait for 1 clock cycle
        if (out !== 3'b001) begin
            $display("FAIL: State S1 is incorrect, expected 001, got %b", out);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 3'b010) begin
            $display("FAIL: State S2 is incorrect, expected 010, got %b", out);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 3'b011) begin
            $display("FAIL: State S3 is incorrect, expected 011, got %b", out);
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (out !== 3'b000) begin
            $display("FAIL: State S0 is incorrect, expected 000, got %b", out);
            $finish;
        end

        // Test reset functionality
        #10; // Wait for 1 clock cycle
        reset = 1; // Assert reset
        #10; // Wait for reset to take effect
        reset = 0; // Deassert reset

        // Check state after reset
        if (out !== 3'b000) begin
            $display("FAIL: After reset, expected 000, got %b", out);
            $finish;
        end

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule