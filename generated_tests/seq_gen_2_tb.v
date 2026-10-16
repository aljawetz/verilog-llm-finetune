`timescale 1ns/1ps

module tb_seq_gen;

    reg clk;
    reg reset;
    wire [7:0] seq_out;

    // Instantiate the module under test
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

        // Check the output sequence
        #10; // Wait for 10ns
        if (seq_out !== 8'b00000001) begin
            $display("FAIL: Expected 00000001, got %b", seq_out);
            $finish;
        end

        #10; // Wait for 10ns
        if (seq_out !== 8'b00000010) begin
            $display("FAIL: Expected 00000010, got %b", seq_out);
            $finish;
        end

        #10; // Wait for 10ns
        if (seq_out !== 8'b00000100) begin
            $display("FAIL: Expected 00000100, got %b", seq_out);
            $finish;
        end

        #10; // Wait for 10ns
        if (seq_out !== 8'b00001000) begin
            $display("FAIL: Expected 00001000, got %b", seq_out);
            $finish;
        end

        #10; // Wait for 10ns
        if (seq_out !== 8'b00000001) begin
            $display("FAIL: Expected 00000001, got %b", seq_out);
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule