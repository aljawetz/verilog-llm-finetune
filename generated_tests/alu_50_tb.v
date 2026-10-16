`timescale 1ns/1ps

module tb_alu;

    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] ALU_Sel;
    wire [7:0] ALU_Out;
    wire CarryOut;

    // Instantiate the ALU module
    alu uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut)
    );

    initial begin
        // Test Addition
        A = 8'd15; B = 8'd10; ALU_Sel = 4'b0000; #10;
        if (ALU_Out !== 8'd25 || CarryOut !== 1'b0) $display("FAIL: Addition test failed");

        // Test Subtraction
        A = 8'd20; B = 8'd5; ALU_Sel = 4'b0001; #10;
        if (ALU_Out !== 8'd15 || CarryOut !== 1'b0) $display("FAIL: Subtraction test failed");

        // Test Multiplication
        A = 8'd3; B = 8'd4; ALU_Sel = 4'b0010; #10;
        if (ALU_Out !== 8'd12 || CarryOut !== 1'b0) $display("FAIL: Multiplication test failed");

        // Test Division
        A = 8'd20; B = 8'd4; ALU_Sel = 4'b0011; #10;
        if (ALU_Out !== 8'd5 || CarryOut !== 1'b0) $display("FAIL: Division test failed");

        // Test Logical Shift Left
        A = 8'b00001111; ALU_Sel = 4'b0100; #10;
        if (ALU_Out !== 8'b00011110) $display("FAIL: Logical Shift Left test failed");

        // Test Logical Shift Right
        A = 8'b00001111; ALU_Sel = 4'b0101; #10;
        if (ALU_Out !== 8'b00000111) $display("FAIL: Logical Shift Right test failed");

        // Test Rotate Left
        A = 8'b00001111; ALU_Sel = 4'b0110; #10;
        if (ALU_Out !== 8'b00011110) $display("FAIL: Rotate Left test failed");

        // Test Rotate Right
        A = 8'b00001111; ALU_Sel = 4'b0111; #10;
        if (ALU_Out !== 8'b10000111) $display("FAIL: Rotate Right test failed");

        // Test Logical AND
        A = 8'b11001100; B = 8'b10101010; ALU_Sel = 4'b1000; #10;
        if (ALU_Out !== 8'b10001000) $display("FAIL: Logical AND test failed");

        // Test Logical OR
        A = 8'b11001100; B = 8'b10101010; ALU_Sel = 4'b1001; #10;
        if (ALU_Out !== 8'b11101110) $display("FAIL: Logical OR test failed");

        // Test Logical XOR
        A = 8'b11001100; B = 8'b10101010; ALU_Sel = 4'b1010; #10;
        if (ALU_Out !== 8'b01100110) $display("FAIL: Logical XOR test failed");

        // Test Logical NOR
        A = 8'b11001100; B = 8'b10101010; ALU_Sel = 4'b1011; #10;
        if (ALU_Out !== 8'b00000001) $display("FAIL: Logical NOR test failed");

        // Test Logical NAND
        A = 8'b11001100; B = 8'b10101010; ALU_Sel = 4'b1100; #10;
        if (ALU_Out !== 8'b00000000) $display("FAIL: Logical NAND test failed");

        // Test Logical XNOR
        A = 8'b11001100; B = 8'b10101010; ALU_Sel = 4'b1101; #10;
        if (ALU_Out !== 8'b11111111) $display("FAIL: Logical XNOR test failed");

        // Test Greater Comparison
        A = 8'd10; B = 8'd5; ALU_Sel = 4'b1110; #10;
        if (ALU_Out !== 8'd1) $display("FAIL: Greater Comparison test failed");

        // Test Equal Comparison
        A = 8'd10; B = 8'd10; ALU_Sel = 4'b1111; #10;
        if (ALU_Out !== 8'd1) $display("FAIL: Equal Comparison test failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule