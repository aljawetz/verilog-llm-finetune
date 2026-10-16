`timescale 1ns/1ps

module tb_pipo_shift_register;

    // Testbench signals
    reg clk;
    reg reset;
    reg [3:0] parallel_in;
    reg shift;
    wire [3:0] parallel_out;

    // Instantiate the module under test (uut)
    pipo_shift_register uut (
        .clk(clk),
        .reset(reset),
        .parallel_in(parallel_in),
        .shift(shift),
        .parallel_out(parallel_out)
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
        parallel_in = 4'b0000;
        shift = 0;

        // Wait for a clock cycle
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test loading parallel input
        parallel_in = 4'b1010; // Load 1010
        #10;
        if (parallel_out !== 4'b1010) begin
            $display("FAIL: Expected parallel_out = 1010, got %b", parallel_out);
            $finish;
        end

        // Test shifting left
        shift = 1; // Enable shift
        #10;
        if (parallel_out !== 4'b0100) begin
            $display("FAIL: Expected parallel_out = 0100, got %b", parallel_out);
            $finish;
        end

        // Shift again
        #10;
        if (parallel_out !== 4'b1000) begin
            $display("FAIL: Expected parallel_out = 1000, got %b", parallel_out);
            $finish;
        end

        // Test loading new parallel input while shifting
        parallel_in = 4'b1111; // Load 1111
        #10;
        if (parallel_out !== 4'b0000) begin
            $display("FAIL: Expected parallel_out = 0000, got %b", parallel_out);
            $finish;
        end

        // Shift again
        #10;
        if (parallel_out !== 4'b0000) begin
            $display("FAIL: Expected parallel_out = 0000, got %b", parallel_out);
            $finish;
        end

        // Test reset functionality
        reset = 1; // Assert reset
        #10;
        if (parallel_out !== 4'b0000) begin
            $display("FAIL: Expected parallel_out = 0000 after reset, got %b", parallel_out);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule