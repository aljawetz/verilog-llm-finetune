`timescale 1ns/1ps

module tb_alu;

    reg [7:0] a_i;
    reg [7:0] b_i;
    reg [2:0] op_i;
    wire [7:0] res_o;

    alu uut (
        .a_i(a_i),
        .b_i(b_i),
        .op_i(op_i),
        .res_o(res_o)
    );

    initial begin
        // Test addition
        a_i = 8'd15; b_i = 8'd10; op_i = 3'b000; #10;
        if (res_o !== 8'd25) $display("FAIL: Addition failed");

        // Test subtraction
        a_i = 8'd20; b_i = 8'd5; op_i = 3'b001; #10;
        if (res_o !== 8'd15) $display("FAIL: Subtraction failed");

        // Test bitwise AND
        a_i = 8'b11001100; b_i = 8'b10101010; op_i = 3'b010; #10;
        if (res_o !== 8'b10001000) $display("FAIL: AND operation failed");

        // Test bitwise OR
        a_i = 8'b11001100; b_i = 8'b10101010; op_i = 3'b011; #10;
        if (res_o !== 8'b11101110) $display("FAIL: OR operation failed");

        // Test bitwise XOR
        a_i = 8'b11001100; b_i = 8'b10101010; op_i = 3'b100; #10;
        if (res_o !== 8'b01100110) $display("FAIL: XOR operation failed");

        // Test shift right
        a_i = 8'b11110000; b_i = 8'd2; op_i = 3'b101; #10;
        if (res_o !== 8'b00111100) $display("FAIL: Shift right operation failed");

        // Test shift left
        a_i = 8'b00001111; b_i = 8'd2; op_i = 3'b110; #10;
        if (res_o !== 8'b00111100) $display("FAIL: Shift left operation failed");

        $display("PASS");
        $finish;
    end

endmodule