`timescale 1ns/1ps

module tb_alu_1bit;

    reg a_in, b_in, c_in;
    reg [2:0] opcode;
    wire out_not, out_and, out_xor, sum_out, carry_out;

    alu_1bit uut (
        .a_in(a_in),
        .b_in(b_in),
        .c_in(c_in),
        .opcode(opcode),
        .out_not(out_not),
        .out_and(out_and),
        .out_xor(out_xor),
        .sum_out(sum_out),
        .carry_out(carry_out)
    );

    initial begin
        // Test NOT operation
        a_in = 1'b0; b_in = 1'b0; c_in = 1'b0; opcode = 3'b000;
        #10;
        if (out_not !== 1'b1 || out_and !== 1'b0 || out_xor !== 1'b0 || sum_out !== 1'b0 || carry_out !== 1'b0) 
            $display("FAIL: NOT operation failed");

        // Test AND operation
        a_in = 1'b1; b_in = 1'b1; c_in = 1'b0; opcode = 3'b001;
        #10;
        if (out_and !== 1'b1 || out_not !== 1'b0 || out_xor !== 1'b0 || sum_out !== 1'b0 || carry_out !== 1'b0) 
            $display("FAIL: AND operation failed");

        // Test XOR operation
        a_in = 1'b1; b_in = 1'b0; c_in = 1'b0; opcode = 3'b010;
        #10;
        if (out_xor !== 1'b1 || out_not !== 1'b0 || out_and !== 1'b0 || sum_out !== 1'b0 || carry_out !== 1'b0) 
            $display("FAIL: XOR operation failed");

        // Test addition without carry
        a_in = 1'b1; b_in = 1'b0; c_in = 1'b0; opcode = 3'b011;
        #10;
        if (sum_out !== 1'b1 || carry_out !== 1'b0) 
            $display("FAIL: Addition without carry failed");

        // Test addition with carry
        a_in = 1'b1; b_in = 1'b1; c_in = 1'b1; opcode = 3'b100;
        #10;
        if (sum_out !== 1'b1 || carry_out !== 1'b1) 
            $display("FAIL: Addition with carry failed");

        $display("PASS");
        $finish;
    end

endmodule