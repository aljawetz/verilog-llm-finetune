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
        #10; // Wait for 10ns
        reset = 0;

        // Check the output for 4 clock cycles
        #10;
        if (seq_out !== 8'b00000001) begin
            $display("FAIL: Expected 00000001, got %b", seq_out);
            $finish;
        end

        #10;
        if (seq_out !== 8'b00000010) begin
            $display("FAIL: Expected 00000010, got %b", seq_out);
            $finish;
        end

        #10;
        if (seq_out !== 8'b00000100) begin
            $display("FAIL: Expected 00000100, got %b", seq_out);
            $finish;
        end

        #10;
        if (seq_out !== 8'b00001000) begin
            $display("FAIL: Expected 00001000, got %b", seq_out);
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10;
        reset = 0;

        // Check the output after reset
        #10;
        if (seq_out !== 8'b00000001) begin
            $display("FAIL: Expected 00000001 after reset, got %b", seq_out);
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule