`timescale 1ns/1ps

module tb_CMP_UNIT;

    reg [15:0] A;
    reg [15:0] B;
    reg [1:0] ALU_FUN;
    reg CLK;
    reg RST;
    reg CMP_Enable;
    wire [15:0] CMP_OUT;
    wire CMP_Flag;

    // Instantiate the module under test
    CMP_UNIT uut (
        .A(A),
        .B(B),
        .ALU_FUN(ALU_FUN),
        .CLK(CLK),
        .RST(RST),
        .CMP_Enable(CMP_Enable),
        .CMP_OUT(CMP_OUT),
        .CMP_Flag(CMP_Flag)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        RST = 0;
        CMP_Enable = 0;
        A = 0;
        B = 0;
        ALU_FUN = 2'b00;

        // Apply reset
        #10 RST = 1;

        // Test case 1: ALU_FUN = 00 (no operation)
        #10;
        CMP_Enable = 1;
        ALU_FUN = 2'b00;
        #10;
        if (CMP_OUT !== 16'b0) $display("FAIL: Test case 1 failed, expected CMP_OUT = 0");

        // Test case 2: ALU_FUN = 01 (equality check)
        #10;
        A = 16'hAAAA; B = 16'hAAAA; ALU_FUN = 2'b01;
        #10;
        if (CMP_OUT !== 16'b1) $display("FAIL: Test case 2 failed, expected CMP_OUT = 1");

        // Test case 3: ALU_FUN = 01 (inequality check)
        #10;
        A = 16'hAAAA; B = 16'h5555; ALU_FUN = 2'b01;
        #10;
        if (CMP_OUT !== 16'b0) $display("FAIL: Test case 3 failed, expected CMP_OUT = 0");

        // Test case 4: ALU_FUN = 10 (greater than check)
        #10;
        A = 16'hAAAA; B = 16'h5555; ALU_FUN = 2'b10;
        #10;
        if (CMP_OUT !== 16'b10) $display("FAIL: Test case 4 failed, expected CMP_OUT = 2");

        // Test case 5: ALU_FUN = 10 (not greater than)
        #10;
        A = 16'h5555; B = 16'hAAAA; ALU_FUN = 2'b10;
        #10;
        if (CMP_OUT !== 16'b0) $display("FAIL: Test case 5 failed, expected CMP_OUT = 0");

        // Test case 6: ALU_FUN = 11 (less than check)
        #10;
        A = 16'h5555; B = 16'hAAAA; ALU_FUN = 2'b11;
        #10;
        if (CMP_OUT !== 16'b11) $display("FAIL: Test case 6 failed, expected CMP_OUT = 3");

        // Test case 7: ALU_FUN = 11 (not less than)
        #10;
        A = 16'hAAAA; B = 16'h5555; ALU_FUN = 2'b11;
        #10;
        if (CMP_OUT !== 16'b0) $display("FAIL: Test case 7 failed, expected CMP_OUT = 0");

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule