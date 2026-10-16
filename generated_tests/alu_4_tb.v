`timescale 1ns/1ps

module tb_alu;

    reg [7:0] a;
    reg [7:0] b;
    reg [3:0] alu_sel;
    wire [7:0] alu_out;
    wire zero;

    alu uut (
        .a(a),
        .b(b),
        .alu_sel(alu_sel),
        .alu_out(alu_out),
        .zero(zero)
    );

    initial begin
        // Test addition
        a = 8'd15; b = 8'd10; alu_sel = 4'b0000; #10;
        if (alu_out !== 8'd25) $display("FAIL: Addition failed");

        // Test subtraction
        a = 8'd20; b = 8'd5; alu_sel = 4'b0001; #10;
        if (alu_out !== 8'd15) $display("FAIL: Subtraction failed");

        // Test multiplication
        a = 8'd3; b = 8'd4; alu_sel = 4'b0010; #10;
        if (alu_out !== 8'd12) $display("FAIL: Multiplication failed");

        // Test division
        a = 8'd20; b = 8'd4; alu_sel = 4'b0011; #10;
        if (alu_out !== 8'd5) $display("FAIL: Division failed");

        // Test logical shift left
        a = 8'b00001111; alu_sel = 4'b0100; #10;
        if (alu_out !== 8'b00011110) $display("FAIL: Logical shift left failed");

        // Test logical shift right
        a = 8'b00001111; alu_sel = 4'b0101; #10;
        if (alu_out !== 8'b00000111) $display("FAIL: Logical shift right failed");

        // Test rotate left
        a = 8'b00001111; alu_sel = 4'b0110; #10;
        if (alu_out !== 8'b00011110) $display("FAIL: Rotate left failed");

        // Test rotate right
        a = 8'b00001111; alu_sel = 4'b0111; #10;
        if (alu_out !== 8'b10000111) $display("FAIL: Rotate right failed");

        // Test AND
        a = 8'b10101010; b = 8'b11001100; alu_sel = 4'b1000; #10;
        if (alu_out !== 8'b10001000) $display("FAIL: AND operation failed");

        // Test OR
        a = 8'b10101010; b = 8'b11001100; alu_sel = 4'b1001; #10;
        if (alu_out !== 8'b11101110) $display("FAIL: OR operation failed");

        // Test XOR
        a = 8'b10101010; b = 8'b11001100; alu_sel = 4'b1010; #10;
        if (alu_out !== 8'b01100110) $display("FAIL: XOR operation failed");

        // Test NOR
        a = 8'b10101010; b = 8'b11001100; alu_sel = 4'b1011; #10;
        if (alu_out !== 8'b00110001) $display("FAIL: NOR operation failed");

        // Test NAND
        a = 8'b10101010; b = 8'b11001100; alu_sel = 4'b1100; #10;
        if (alu_out !== 8'b00111111) $display("FAIL: NAND operation failed");

        // Test XNOR
        a = 8'b10101010; b = 8'b11001100; alu_sel = 4'b1101; #10;
        if (alu_out !== 8'b01011000) $display("FAIL: XNOR operation failed");

        // Test greater than
        a = 8'd10; b = 8'd5; alu_sel = 4'b1110; #10;
        if (alu_out !== 8'd1) $display("FAIL: Greater than comparison failed");

        // Test equality
        a = 8'd10; b = 8'd10; alu_sel = 4'b1111; #10;
        if (alu_out !== 8'd1) $display("FAIL: Equality comparison failed");

        $display("PASS");
        $finish;
    end

endmodule