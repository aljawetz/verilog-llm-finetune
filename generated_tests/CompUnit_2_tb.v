`timescale 1ns/1ps

module tb_CompUnit;

    reg clk;
    reg [2:0] instr;
    reg [15:0] A1;
    reg [15:0] A2;
    reg [15:0] W1;
    reg [15:0] W2;
    wire [15:0] out1;
    wire [15:0] out2;

    // Instantiate the Unit Under Test (UUT)
    CompUnit uut (
        .clk(clk),
        .instr(instr),
        .A1(A1),
        .A2(A2),
        .W1(W1),
        .W2(W2),
        .out1(out1),
        .out2(out2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        A1 = 16'h0002; 
        A2 = 16'h0003; 
        W1 = 16'h0004; 
        W2 = 16'h0005; 
        instr = 3'b000; // Clear

        // Wait for a clock cycle
        #10;
        if (out1 !== 16'h0000) $display("FAIL: Expected out1 to be 0 after clear, got %h", out1);

        // Test multiplication and accumulation
        instr = 3'b111; // Multiply and accumulate
        #10;
        if (out1 !== (A1 * W1 + A2 * W2)) $display("FAIL: Expected out1 to be %h, got %h", (A1 * W1 + A2 * W2), out1);

        // Test modifying inputs
        instr = 3'b110; // Modify A2 with W2
        #10;
        if (out1 !== (A2 * W2)) $display("FAIL: Expected out1 to be %h, got %h", (A2 * W2), out1);

        // Test default case
        instr = 3'b101; // Modify with weights
        #10;
        if (out1 !== (16'h0000 + W1 + W2)) $display("FAIL: Expected out1 to be %h, got %h", (16'h0000 + W1 + W2), out1);

        // Test default case with previous output
        instr = 3'b010; // Default case
        #10;
        if (out1 !== out1) $display("FAIL: Expected out1 to be %h, got %h", out1, out1);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule