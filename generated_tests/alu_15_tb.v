`timescale 1ns/1ps

module tb_alu;

    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] op;
    wire [7:0] res_o;

    alu uut (
        .a(a),
        .b(b),
        .op(op),
        .res_o(res_o)
    );

    initial begin
        // Test ADD
        a = 8'h1A; b = 8'h05; op = 3'b000; #10;
        if (res_o !== 8'h1F) $display("FAIL: ADD operation failed");

        // Test SUB
        a = 8'h1A; b = 8'h05; op = 3'b001; #10;
        if (res_o !== 8'h15) $display("FAIL: SUB operation failed");

        // Test SLL
        a = 8'h1A; b = 8'h02; op = 3'b010; #10;
        if (res_o !== 8'h68) $display("FAIL: SLL operation failed");

        // Test LSR
        a = 8'h1A; b = 8'h02; op = 3'b011; #10;
        if (res_o !== 8'h0D) $display("FAIL: LSR operation failed");

        // Test AND
        a = 8'h1A; b = 8'h0F; op = 3'b100; #10;
        if (res_o !== 8'h0A) $display("FAIL: AND operation failed");

        // Test OR
        a = 8'h1A; b = 8'h0F; op = 3'b101; #10;
        if (res_o !== 8'h1F) $display("FAIL: OR operation failed");

        // Test XOR
        a = 8'h1A; b = 8'h0F; op = 3'b110; #10;
        if (res_o !== 8'h15) $display("FAIL: XOR operation failed");

        // Test EQL
        a = 8'h1A; b = 8'h1A; op = 3'b111; #10;
        if (res_o !== 8'h01) $display("FAIL: EQL operation failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule