`timescale 1ns/1ps

module tb_alu_4bit;
    reg [3:0] A, B;
    reg [2:0] ALU_Sel;
    wire [3:0] ALU_Out;
    wire CarryOut;

    alu_4bit uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut)
    );

    initial begin
        // Test addition
        A = 4'b0011; B = 4'b0001; ALU_Sel = 3'b000; #10;
        if (ALU_Out !== 4'b0100 || CarryOut !== 1'b0) $display("FAIL: Addition test failed");

        // Test subtraction
        A = 4'b0100; B = 4'b0011; ALU_Sel = 3'b001; #10;
        if (ALU_Out !== 4'b0001 || CarryOut !== 1'b0) $display("FAIL: Subtraction test failed");

        // Test bitwise AND
        A = 4'b1100; B = 4'b1010; ALU_Sel = 3'b010; #10;
        if (ALU_Out !== 4'b1000) $display("FAIL: AND test failed");

        // Test bitwise OR
        A = 4'b1100; B = 4'b1010; ALU_Sel = 3'b011; #10;
        if (ALU_Out !== 4'b1110) $display("FAIL: OR test failed");

        // Test bitwise XOR
        A = 4'b1100; B = 4'b1010; ALU_Sel = 3'b100; #10;
        if (ALU_Out !== 4'b0110) $display("FAIL: XOR test failed");

        // Test inversion
        A = 4'b1100; ALU_Sel = 3'b101; #10;
        if (ALU_Out !== 4'b0011) $display("FAIL: Inversion test failed");

        // Test left shift
        A = 4'b0001; ALU_Sel = 3'b110; #10;
        if (ALU_Out !== 4'b0010) $display("FAIL: Left shift test failed");

        // Test right shift
        A = 4'b0010; ALU_Sel = 3'b111; #10;
        if (ALU_Out !== 4'b0001) $display("FAIL: Right shift test failed");

        // Test addition with carry out
        A = 4'b1111; B = 4'b0001; ALU_Sel = 3'b000; #10;
        if (ALU_Out !== 4'b0000 || CarryOut !== 1'b1) $display("FAIL: Addition with carry test failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule