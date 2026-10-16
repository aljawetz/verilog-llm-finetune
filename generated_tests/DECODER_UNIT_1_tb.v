`timescale 1ns/1ps

module tb_DECODER_UNIT;

    reg [1:0] ALU_FUN;
    wire Arith_Enable, Logic_Enable, CMP_Enable, Shift_Enable;

    // Instantiate the module under test (uut)
    DECODER_UNIT uut (
        .ALU_FUN(ALU_FUN),
        .Arith_Enable(Arith_Enable),
        .Logic_Enable(Logic_Enable),
        .CMP_Enable(CMP_Enable),
        .Shift_Enable(Shift_Enable)
    );

    initial begin
        // Test case 1: ALU_FUN = 00
        ALU_FUN = 2'b00;
        #10;
        if (Arith_Enable !== 1'b1 || Logic_Enable !== 1'b0 || CMP_Enable !== 1'b0 || Shift_Enable !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: ALU_FUN = 01
        ALU_FUN = 2'b01;
        #10;
        if (Arith_Enable !== 1'b0 || Logic_Enable !== 1'b1 || CMP_Enable !== 1'b0 || Shift_Enable !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: ALU_FUN = 10
        ALU_FUN = 2'b10;
        #10;
        if (Arith_Enable !== 1'b0 || Logic_Enable !== 1'b0 || CMP_Enable !== 1'b1 || Shift_Enable !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: ALU_FUN = 11
        ALU_FUN = 2'b11;
        #10;
        if (Arith_Enable !== 1'b0 || Logic_Enable !== 1'b0 || CMP_Enable !== 1'b0 || Shift_Enable !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: ALU_FUN = invalid value
        ALU_FUN = 2'bxx; // Invalid input
        #10;
        if (Arith_Enable !== 1'b0 || Logic_Enable !== 1'b0 || CMP_Enable !== 1'b0 || Shift_Enable !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule