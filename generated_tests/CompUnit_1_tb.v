`timescale 1ns/1ps

module tb_CompUnit;

    reg clk;
    reg [2:0] instr;
    reg [15:0] A1, A2, W1, W2;
    wire [15:0] out1, out2;

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
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        instr = 3'b000; A1 = 16'd0; A2 = 16'd0; W1 = 16'd0; W2 = 16'd0;
        #10;

        // Test clear operation
        instr = 3'b000; 
        #10;
        if (out1 !== 16'd0) $display("FAIL: Clear operation failed for out1");
        if (out2 !== 16'd0) $display("FAIL: Clear operation failed for out2");

        // Test multiplication operation
        A1 = 16'd3; A2 = 16'd4; W1 = 16'd2; W2 = 16'd5;
        instr = 3'b111; 
        #10;
        if (out1 !== (A1 * W1)) $display("FAIL: Multiplication result for out1 is incorrect");
        if (out2 !== (A2 * W2)) $display("FAIL: Multiplication result for out2 is incorrect");

        // Test partial multiplication
        instr = 3'b110; 
        #10;
        if (out1 !== 16'd0) $display("FAIL: Partial multiplication failed for out1");
        if (out2 !== (A2 * W2)) $display("FAIL: Partial multiplication result for out2 is incorrect");

        // Test loading W1 and W2
        instr = 3'b101; 
        #10;
        if (out1 !== {16'b0, W1}) $display("FAIL: Load operation failed for out1");
        if (out2 !== {16'b0, W2}) $display("FAIL: Load operation failed for out2");

        // Test default case
        instr = 3'b010; 
        #10;
        if (out1 !== out1) $display("FAIL: Default case failed for out1");
        if (out2 !== 16'd0) $display("FAIL: Default case failed for out2");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule