`timescale 1ns/1ps

module tb_IR;

    reg [7:0] IR_in;
    reg li_;
    reg clk;
    reg clr_;
    wire [3:0] opcode;
    wire [3:0] oprand;

    // Instantiate the module under test
    IR uut (
        .opcode(opcode),
        .oprand(oprand),
        .IR_in(IR_in),
        .li_(li_),
        .clk(clk),
        .clr_(clr_)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        IR_in = 8'b00000000;
        li_ = 1;
        clr_ = 1;

        // Test 1: Load instruction
        #10;
        li_ = 0; // Enable load
        IR_in = 8'b10110011; // Opcode: 1011, Operand: 0011
        #10;
        li_ = 1; // Disable load

        // Check opcode and operand
        if (opcode !== 4'b1011) begin
            $display("FAIL: Opcode mismatch, expected 1011, got %b", opcode);
            $finish;
        end
        if (oprand !== 4'b0011) begin
            $display("FAIL: Operand mismatch, expected 0011, got %b", oprand);
            $finish;
        end

        // Test 2: Clear register
        #10;
        clr_ = 0; // Assert clear
        #10;
        clr_ = 1; // Deassert clear

        // Check that opcode and operand are cleared
        if (opcode !== 4'b0000) begin
            $display("FAIL: Opcode not cleared, expected 0000, got %b", opcode);
            $finish;
        end
        if (oprand !== 4'b0000) begin
            $display("FAIL: Operand not cleared, expected 0000, got %b", oprand);
            $finish;
        end

        // Test 3: Load new instruction after clear
        #10;
        li_ = 0; // Enable load
        IR_in = 8'b01101001; // Opcode: 0110, Operand: 1001
        #10;
        li_ = 1; // Disable load

        // Check new opcode and operand
        if (opcode !== 4'b0110) begin
            $display("FAIL: Opcode mismatch after load, expected 0110, got %b", opcode);
            $finish;
        end
        if (oprand !== 4'b1001) begin
            $display("FAIL: Operand mismatch after load, expected 1001, got %b", oprand);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule