`timescale 1ns/1ps

module tb_ALU_st;

    reg [7:0] A;
    reg [7:0] B;
    reg LOGIC_SEL;
    reg [2:0] SEL;
    wire [7:0] RESULT;

    // Instantiate the ALU module
    ALU_st uut (
        .A(A),
        .B(B),
        .LOGIC_SEL(LOGIC_SEL),
        .SEL(SEL),
        .RESULT(RESULT)
    );

    initial begin
        // Test arithmetic operations
        LOGIC_SEL = 0;

        // Test addition
        A = 8'd15; B = 8'd10; SEL = 3'b000; #10;
        if (RESULT !== 8'd25) $display("FAIL: Addition failed");

        // Test subtraction
        A = 8'd20; B = 8'd5; SEL = 3'b001; #10;
        if (RESULT !== 8'd15) $display("FAIL: Subtraction failed");

        // Test multiplication
        A = 8'd3; B = 8'd4; SEL = 3'b010; #10;
        if (RESULT !== 8'd12) $display("FAIL: Multiplication failed");

        // Test increment
        A = 8'd7; SEL = 3'b011; #10;
        if (RESULT !== 8'd8) $display("FAIL: Increment failed");

        // Test concatenation
        A = 8'd1; B = 8'd2; SEL = 3'b100; #10;
        if (RESULT !== 16'h0102) $display("FAIL: Concatenation failed");

        // Test duplication
        A = 8'd5; SEL = 3'b101; #10;
        if (RESULT !== 8'd5) $display("FAIL: Duplication failed");

        // Test left shift
        A = 8'd4; SEL = 3'b110; #10;
        if (RESULT !== 8'd8) $display("FAIL: Left shift failed");

        // Test right shift
        A = 8'd8; SEL = 3'b111; #10;
        if (RESULT !== 8'd4) $display("FAIL: Right shift failed");

        // Test logical operations
        LOGIC_SEL = 1;

        // Test AND
        A = 8'd15; B = 8'd7; SEL = 3'b000; #10;
        if (RESULT !== 8'd7) $display("FAIL: AND operation failed");

        // Test OR
        A = 8'd5; B = 8'd3; SEL = 3'b001; #10;
        if (RESULT !== 8'd7) $display("FAIL: OR operation failed");

        // Test NOT
        A = 8'd5; SEL = 3'b010; #10;
        if (RESULT !== 8'd250) $display("FAIL: NOT operation failed");

        // Test NAND
        A = 8'd3; B = 8'd3; SEL = 3'b011; #10;
        if (RESULT !== 8'd252) $display("FAIL: NAND operation failed");

        // Test NOR
        A = 8'd2; B = 8'd3; SEL = 3'b100; #10;
        if (RESULT !== 8'd250) $display("FAIL: NOR operation failed");

        // Test XOR
        A = 8'd5; B = 8'd3; SEL = 3'b101; #10;
        if (RESULT !== 8'd6) $display("FAIL: XOR operation failed");

        // Test XNOR
        A = 8'd5; B = 8'd3; SEL = 3'b110; #10;
        if (RESULT !== 8'd249) $display("FAIL: XNOR operation failed");

        // Test identity
        A = 8'd10; SEL = 3'b111; #10;
        if (RESULT !== 8'd10) $display("FAIL: Identity operation failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule