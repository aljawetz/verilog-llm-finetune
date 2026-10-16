`timescale 1ns/1ps

module tb_alu;
    reg [31:0] a;
    reg [31:0] b;
    reg [2:0] f;
    wire [31:0] s;
    wire overflow;
    wire zero;

    alu uut (
        .a(a),
        .b(b),
        .f(f),
        .s(s),
        .overflow(overflow),
        .zero(zero)
    );

    initial begin
        // Test AND operation
        a = 32'hFFFFFFFF; b = 32'h0; f = 3'b000; #10;
        if (s !== 32'h0 || overflow !== 1'b0) $display("FAIL: AND operation failed");

        // Test OR operation
        a = 32'hFFFFFFFF; b = 32'h0; f = 3'b001; #10;
        if (s !== 32'hFFFFFFFF || overflow !== 1'b0) $display("FAIL: OR operation failed");

        // Test addition without overflow
        a = 32'h00000001; b = 32'h00000001; f = 3'b010; #10;
        if (s !== 32'h00000002 || overflow !== 1'b0) $display("FAIL: Addition operation failed");

        // Test addition with overflow
        a = 32'h7FFFFFFF; b = 32'h00000001; f = 3'b010; #10;
        if (s !== 32'h80000000 || overflow !== 1'b1) $display("FAIL: Addition overflow check failed");

        // Test subtraction without overflow
        a = 32'h00000002; b = 32'h00000001; f = 3'b110; #10;
        if (s !== 32'h00000001 || overflow !== 1'b0) $display("FAIL: Subtraction operation failed");

        // Test negation
        a = 32'h00000001; f = 3'b100; #10;
        if (s !== 32'hFFFFFFFE || overflow !== 1'b0) $display("FAIL: Negation operation failed");

        // Test comparison (less than)
        a = 32'h00000001; b = 32'h00000002; f = 3'b111; #10;
        if (s !== 32'h1 || overflow !== 1'b0) $display("FAIL: Comparison operation failed");

        // Test zero detection
        a = 32'h00000000; b = 32'h00000000; f = 3'b010; #10;
        if (zero !== 1'b1) $display("FAIL: Zero detection failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule