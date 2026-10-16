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
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    reset = 1;

    // Wait for a few clock cycles
    #10;
    reset = 0;

    // Test sequence
    // Check the output after each state transition
    #10; // Wait for state 0
    if (seq_out !== 8'b00000001) begin
        $display("FAIL: Expected 00000001, got %b", seq_out);
        $finish;
    end

    #10; // Wait for state 1
    if (seq_out !== 8'b00000010) begin
        $display("FAIL: Expected 00000010, got %b", seq_out);
        $finish;
    end

    #10; // Wait for state 2
    if (seq_out !== 8'b00000100) begin
        $display("FAIL: Expected 00000100, got %b", seq_out);
        $finish;
    end

    #10; // Wait for state 3
    if (seq_out !== 8'b00001000) begin
        $display("FAIL: Expected 00001000, got %b", seq_out);
        $finish;
    end

    // Check wrap around to state 0
    #10; // Wait for state 0 again
    if (seq_out !== 8'b00000001) begin
        $display("FAIL: Expected 00000001, got %b", seq_out);
        $finish;
    end

    // Reset the FSM
    reset = 1;
    #10;
    reset = 0;

    // Check output after reset
    #10; // Wait for state 0 after reset
    if (seq_out !== 8'b00000001) begin
        $display("FAIL: Expected 00000001 after reset, got %b", seq_out);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule