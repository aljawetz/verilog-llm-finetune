`timescale 1ns/1ps

module tb_alu_8bit;

    reg [7:0] a, b;
    reg [1:0] op;
    wire [7:0] f;

    alu_8bit uut (
        .f(f),
        .a(a),
        .b(b),
        .op(op)
    );

    initial begin
        // Test ADD
        a = 8'd15; b = 8'd10; op = 2'b00; #10;
        if (f !== 8'd25) $display("FAIL: ADD operation failed, expected 25 but got %d", f);

        // Test SUB
        a = 8'd20; b = 8'd5; op = 2'b01; #10;
        if (f !== 8'd15) $display("FAIL: SUB operation failed, expected 15 but got %d", f);

        // Test MUL
        a = 8'd3; b = 8'd4; op = 2'b10; #10;
        if (f !== 8'd12) $display("FAIL: MUL operation failed, expected 12 but got %d", f);

        // Test DIV
        a = 8'd20; b = 8'd4; op = 2'b11; #10;
        if (f !== 8'd5) $display("FAIL: DIV operation failed, expected 5 but got %d", f);

        // Test DIV by zero
        a = 8'd20; b = 8'd0; op = 2'b11; #10;
        if (f !== 8'd0) $display("FAIL: DIV by zero did not handle correctly, expected 0 but got %d", f);

        $display("PASS");
        $finish;
    end

endmodule