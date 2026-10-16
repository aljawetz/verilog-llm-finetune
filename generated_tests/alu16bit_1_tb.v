`timescale 1ns/1ps

module tb_alu16bit;

    reg [15:0] A;
    reg [15:0] B;
    reg [3:0] ALU_Sel;
    wire [15:0] ALU_Out;
    wire Zero;

    alu16bit uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .Zero(Zero)
    );

    initial begin
        // Test Addition
        A = 16'h0001; B = 16'h0001; ALU_Sel = 4'b0000; #10;
        if (ALU_Out !== 16'h0002 || Zero !== 0) $display("FAIL: Addition test failed");

        // Test Subtraction
        A = 16'h0002; B = 16'h0001; ALU_Sel = 4'b0001; #10;
        if (ALU_Out !== 16'h0001 || Zero !== 0) $display("FAIL: Subtraction test failed");

        // Test AND
        A = 16'hFF00; B = 16'h00FF; ALU_Sel = 4'b0010; #10;
        if (ALU_Out !== 16'h0000 || Zero !== 1) $display("FAIL: AND test failed");

        // Test OR
        A = 16'h00FF; B = 16'h0000; ALU_Sel = 4'b0011; #10;
        if (ALU_Out !== 16'h00FF || Zero !== 0) $display("FAIL: OR test failed");

        // Test XOR
        A = 16'hFFFF; B = 16'h0000; ALU_Sel = 4'b0100; #10;
        if (ALU_Out !== 16'hFFFF || Zero !== 0) $display("FAIL: XOR test failed");

        // Test NOR
        A = 16'h0000; B = 16'h0000; ALU_Sel = 4'b0101; #10;
        if (ALU_Out !== 16'hFFFF || Zero !== 0) $display("FAIL: NOR test failed");

        // Test NAND
        A = 16'hFFFF; B = 16'hFFFF; ALU_Sel = 4'b0110; #10;
        if (ALU_Out !== 16'h0000 || Zero !== 1) $display("FAIL: NAND test failed");

        // Test NXOR
        A = 16'hAAAA; B = 16'h5555; ALU_Sel = 4'b0111; #10;
        if (ALU_Out !== 16'hFFFF || Zero !== 0) $display("FAIL: NXOR test failed");

        // Test Shift Left
        A = 16'h0001; ALU_Sel = 4'b1000; #10;
        if (ALU_Out !== 16'h0002 || Zero !== 0) $display("FAIL: Shift Left test failed");

        // Test Shift Right
        A = 16'h0002; ALU_Sel = 4'b1001; #10;
        if (ALU_Out !== 16'h0001 || Zero !== 0) $display("FAIL: Shift Right test failed");

        // Test Arithmetic Shift Left
        A = 16'h0001; ALU_Sel = 4'b1010; #10;
        if (ALU_Out !== 16'h0002 || Zero !== 0) $display("FAIL: Arithmetic Shift Left test failed");

        // Test Arithmetic Shift Right
        A = 16'h0002; ALU_Sel = 4'b1011; #10;
        if (ALU_Out !== 16'h0001 || Zero !== 0) $display("FAIL: Arithmetic Shift Right test failed");

        $display("PASS");
        $finish;
    end
endmodule