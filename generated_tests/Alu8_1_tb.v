`timescale 1ns/1ps

module tb_Alu8;

    reg [7:0] a, b;
    reg [2:0] op;
    wire [7:0] out;
    wire carry;

    // Instantiate the ALU
    Alu8 uut (
        .a(a),
        .b(b),
        .op(op),
        .out(out),
        .carry(carry)
    );

    initial begin
        // Test addition
        a = 8'h1A; b = 8'h05; op = 3'b000; #10;
        if (out !== 8'h1F || carry !== 1'b0) $display("FAIL: Addition test failed");

        // Test subtraction
        a = 8'h1A; b = 8'h05; op = 3'b001; #10;
        if (out !== 8'h15 || carry !== 1'b0) $display("FAIL: Subtraction test failed");

        // Test left shift
        a = 8'h1A; b = 8'h02; op = 3'b010; #10;
        if (out !== 8'h68) $display("FAIL: Left shift test failed");

        // Test right shift
        a = 8'h1A; b = 8'h02; op = 3'b011; #10;
        if (out !== 8'h0D) $display("FAIL: Right shift test failed");

        // Test bitwise AND
        a = 8'h1A; b = 8'h0F; op = 3'b100; #10;
        if (out !== 8'h0A) $display("FAIL: AND test failed");

        // Test bitwise OR
        a = 8'h1A; b = 8'h0F; op = 3'b101; #10;
        if (out !== 8'h1F) $display("FAIL: OR test failed");

        // Test bitwise XOR
        a = 8'h1A; b = 8'h0F; op = 3'b110; #10;
        if (out !== 8'h15) $display("FAIL: XOR test failed");

        // Test equality
        a = 8'h1A; b = 8'h1A; op = 3'b111; #10;
        if (out !== 8'h01) $display("FAIL: Equality test failed");

        // Test inequality
        a = 8'h1A; b = 8'h05; op = 3'b111; #10;
        if (out !== 8'h00) $display("FAIL: Inequality test failed");

        $display("PASS");
        $finish;
    end

endmodule