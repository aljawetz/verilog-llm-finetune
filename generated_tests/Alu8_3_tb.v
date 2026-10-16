`timescale 1ns/1ps

module tb_Alu8;

    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] op;
    wire [7:0] out;
    wire carry;

    // Instantiate the ALU module
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
        a = 8'h01; b = 8'h03; op = 3'b010; #10;
        if (out !== 8'h08) $display("FAIL: Left shift test failed");

        // Test right shift
        a = 8'h08; b = 8'h03; op = 3'b011; #10;
        if (out !== 8'h01) $display("FAIL: Right shift test failed");

        // Test AND operation
        a = 8'hFF; b = 8'h0F; op = 3'b100; #10;
        if (out !== 8'h0F) $display("FAIL: AND operation test failed");

        // Test OR operation
        a = 8'hF0; b = 8'h0F; op = 3'b101; #10;
        if (out !== 8'hFF) $display("FAIL: OR operation test failed");

        // Test XOR operation
        a = 8'hF0; b = 8'h0F; op = 3'b110; #10;
        if (out !== 8'hFF) $display("FAIL: XOR operation test failed");

        // Test equality check
        a = 8'h1A; b = 8'h1A; op = 3'b111; #10;
        if (out !== 8'h01) $display("FAIL: Equality test failed");

        // Test inequality check
        a = 8'h1A; b = 8'h1B; op = 3'b111; #10;
        if (out !== 8'h00) $display("FAIL: Inequality test failed");

        $display("PASS");
        $finish;
    end

endmodule