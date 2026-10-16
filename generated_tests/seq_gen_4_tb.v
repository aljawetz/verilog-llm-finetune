`timescale 1ns/1ps

module tb_seq_gen;

    reg clk;
    reg reset;
    wire [7:0] seq_out;

    // Instantiate the module under test (uut)
    seq_gen uut (
        .clk(clk),
        .reset(reset),
        .seq_out(seq_out)
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
        #10; // Wait for a few clock cycles
        reset = 0;

        // Check the output for the first cycle
        #10;
        if (seq_out !== 8'b00000001) begin
            $display("FAIL: Expected 00000001, got %b", seq_out);
            $finish;
        end

        // Check the output for the second cycle
        #10;
        if (seq_out !== 8'b00000010) begin
            $display("FAIL: Expected 00000010, got %b", seq_out);
            $finish;
        end

        // Check the output for the third cycle
        #10;
        if (seq_out !== 8'b00000100) begin
            $display("FAIL: Expected 00000100, got %b", seq_out);
            $finish;
        end

        // Check the output for the fourth cycle
        #10;
        if (seq_out !== 8'b00001000) begin
            $display("FAIL: Expected 00001000, got %b", seq_out);
            $finish;
        end

        // Check the output wraps around to the first state
        #10;
        if (seq_out !== 8'b00000001) begin
            $display("FAIL: Expected 00000001 after wrap, got %b", seq_out);
            $finish;
        end

        // Assert reset functionality
        reset = 1;
        #10;
        if (seq_out !== 8'b00000000) begin
            $display("FAIL: Expected 00000000 after reset, got %b", seq_out);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule