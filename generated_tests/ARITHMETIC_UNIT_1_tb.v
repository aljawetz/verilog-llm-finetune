`timescale 1ns/1ps

module tb_ARITHMETIC_UNIT;

    reg signed [15:0] A;
    reg signed [15:0] B;
    reg [1:0] ALU_FUN;
    reg CLK;
    reg RST;
    reg Arith_Enable;
    wire signed [31:0] Arith_OUT;
    wire Carry_OUT;
    wire Arith_Flag;

    // Instantiate the module under test
    ARITHMETIC_UNIT uut (
        .A(A),
        .B(B),
        .ALU_FUN(ALU_FUN),
        .CLK(CLK),
        .RST(RST),
        .Arith_Enable(Arith_Enable),
        .Arith_OUT(Arith_OUT),
        .Carry_OUT(Carry_OUT),
        .Arith_Flag(Arith_Flag)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        RST = 0;
        A = 0;
        B = 0;
        ALU_FUN = 0;
        Arith_Enable = 0;

        // Apply reset
        #10 RST = 1; // Release reset
        #10;

        // Test Addition
        A = 16'd10; B = 16'd5; ALU_FUN = 2'b00; Arith_Enable = 1;
        #10;
        if (Arith_OUT !== 16'd15 || Carry_OUT !== 1'b0 || Arith_Flag !== 1'b1) begin
            $display("FAIL: Addition test failed");
            $finish;
        end

        // Test Subtraction
        A = 16'd10; B = 16'd5; ALU_FUN = 2'b01; Arith_Enable = 1;
        #10;
        if (Arith_OUT !== 16'd5 || Carry_OUT !== 1'b0 || Arith_Flag !== 1'b1) begin
            $display("FAIL: Subtraction test failed");
            $finish;
        end

        // Test Multiplication
        A = 16'd10; B = 16'd5; ALU_FUN = 2'b10; Arith_Enable = 1;
        #10;
        if (Arith_OUT !== 16'd50 || Carry_OUT !== 1'b0 || Arith_Flag !== 1'b1) begin
            $display("FAIL: Multiplication test failed");
            $finish;
        end

        // Test Division
        A = 16'd10; B = 16'd5; ALU_FUN = 2'b11; Arith_Enable = 1;
        #10;
        if (Arith_OUT !== 16'd2 || Carry_OUT !== 1'b0 || Arith_Flag !== 1'b1) begin
            $display("FAIL: Division test failed");
            $finish;
        end

        // Test Reset
        Arith_Enable = 0; RST = 0; #10;
        if (Arith_OUT !== 32'b0 || Carry_OUT !== 1'b0 || Arith_Flag !== 1'b0) begin
            $display("FAIL: Reset test failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule