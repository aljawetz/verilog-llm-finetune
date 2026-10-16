`timescale 1ns/1ps

module tb_alu_32bit;

    reg [31:0] a;
    reg [31:0] b;
    reg [2:0] f;
    wire [31:0] y;

    alu_32bit uut (
        .a(a),
        .b(b),
        .f(f),
        .y(y)
    );

    initial begin
        // Test AND operation
        a = 32'hFFFFFFFF; b = 32'h0; f = 3'b000; #10;
        if (y !== 32'h0) $display("FAIL: AND operation failed");

        // Test OR operation
        a = 32'hFFFFFFFF; b = 32'h0; f = 3'b001; #10;
        if (y !== 32'hFFFFFFFF) $display("FAIL: OR operation failed");

        // Test NAND operation
        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; f = 3'b010; #10;
        if (y !== 32'h0) $display("FAIL: NAND operation failed");

        // Test NOR operation
        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; f = 3'b011; #10;
        if (y !== 32'h0) $display("FAIL: NOR operation failed");

        // Test ADD operation
        a = 32'h00000001; b = 32'h00000001; f = 3'b100; #10;
        if (y !== 32'h00000002) $display("FAIL: ADD operation failed");

        // Test SUB operation
        a = 32'h00000002; b = 32'h00000001; f = 3'b101; #10;
        if (y !== 32'h00000001) $display("FAIL: SUB operation failed");

        // Test MUL operation
        a = 32'h00000002; b = 32'h00000003; f = 3'b110; #10;
        if (y !== 32'h00000006) $display("FAIL: MUL operation failed");

        // Test DIV operation
        a = 32'h00000006; b = 32'h00000002; f = 3'b111; #10;
        if (y !== 32'h00000003) $display("FAIL: DIV operation failed");

        $display("PASS");
        $finish;
    end

endmodule