`timescale 1ns/1ps

module tb_alu;
    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] op;
    wire [7:0] res_o;

    // Instantiate the ALU module
    alu uut (
        .a(a),
        .b(b),
        .op(op),
        .res_o(res_o)
    );

    initial begin
        // Test addition
        a = 8'd15; b = 8'd10; op = 3'b000; #10;
        if (res_o !== 8'd25) $display("FAIL: Addition failed");

        // Test subtraction
        a = 8'd20; b = 8'd5; op = 3'b001; #10;
        if (res_o !== 8'd15) $display("FAIL: Subtraction failed");

        // Test left shift
        a = 8'd2; b = 8'd1; op = 3'b010; #10;
        if (res_o !== 8'd4) $display("FAIL: Left shift failed");

        // Test right shift
        a = 8'd4; b = 8'd1; op = 3'b011; #10;
        if (res_o !== 8'd2) $display("FAIL: Right shift failed");

        // Test bitwise AND
        a = 8'd12; b = 8'd5; op = 3'b100; #10;
        if (res_o !== 8'd4) $display("FAIL: AND operation failed");

        // Test bitwise OR
        a = 8'd12; b = 8'd5; op = 3'b101; #10;
        if (res_o !== 8'd13) $display("FAIL: OR operation failed");

        // Test bitwise XOR
        a = 8'd12; b = 8'd5; op = 3'b110; #10;
        if (res_o !== 8'd9) $display("FAIL: XOR operation failed");

        // Test equality
        a = 8'd10; b = 8'd10; op = 3'b111; #10;
        if (res_o !== 8'd1) $display("FAIL: Equality check failed");

        a = 8'd10; b = 8'd5; op = 3'b111; #10;
        if (res_o !== 8'd0) $display("FAIL: Equality check failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule