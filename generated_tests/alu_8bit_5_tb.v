`timescale 1ns/1ps

module tb_alu_8bit;
    reg [7:0] a, b;
    reg [1:0] op;
    wire [7:0] f;

    // Instantiate the ALU module
    alu_8bit uut (
        .f(f),
        .a(a),
        .b(b),
        .op(op)
    );

    initial begin
        // Test addition
        a = 8'd15; b = 8'd10; op = 2'b00; #10;
        if (f !== 8'd25) $display("FAIL: Addition test failed, expected 25 but got %d", f);

        // Test subtraction
        a = 8'd20; b = 8'd5; op = 2'b01; #10;
        if (f !== 8'd15) $display("FAIL: Subtraction test failed, expected 15 but got %d", f);

        // Test multiplication
        a = 8'd3; b = 8'd4; op = 2'b10; #10;
        if (f !== 8'd12) $display("FAIL: Multiplication test failed, expected 12 but got %d", f);

        // Test division
        a = 8'd16; b = 8'd4; op = 2'b11; #10;
        if (f !== 8'd4) $display("FAIL: Division test failed, expected 4 but got %d", f);

        // Test division by zero
        a = 8'd16; b = 8'd0; op = 2'b11; #10;
        if (f !== 8'd255) $display("FAIL: Division by zero test failed, expected 255 but got %d", f);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule