`timescale 1ns/1ps

module tb_logic_unit;

    reg [3:0] a_in;
    reg [3:0] b_in;
    reg [1:0] opcode;
    wire [3:0] y_out;

    // Instantiate the logic_unit module
    logic_unit #(4) uut (
        .a_in(a_in),
        .b_in(b_in),
        .opcode(opcode),
        .y_out(y_out)
    );

    initial begin
        // Test NOT operation
        a_in = 4'b1010; b_in = 4'bxxxx; opcode = 2'b00; // b_in is don't care
        #10;
        if (y_out !== ~a_in) begin
            $display("FAIL: NOT operation failed");
            $finish;
        end

        // Test OR operation
        a_in = 4'b1010; b_in = 4'b0101; opcode = 2'b01;
        #10;
        if (y_out !== (a_in | b_in)) begin
            $display("FAIL: OR operation failed");
            $finish;
        end

        // Test AND operation
        a_in = 4'b1010; b_in = 4'b0101; opcode = 2'b10;
        #10;
        if (y_out !== (a_in & b_in)) begin
            $display("FAIL: AND operation failed");
            $finish;
        end

        // Test XOR operation
        a_in = 4'b1010; b_in = 4'b0101; opcode = 2'b11;
        #10;
        if (y_out !== (a_in ^ b_in)) begin
            $display("FAIL: XOR operation failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule