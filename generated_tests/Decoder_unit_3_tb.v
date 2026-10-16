`timescale 1ns/1ps

module tb_Decoder_unit;

    reg [3:0] ALU_FUN;
    wire Arith_enable, Logic_enable, CMP_enable, Shift_enable;

    // Instantiate the module under test (uut)
    Decoder_unit uut (
        .ALU_FUN(ALU_FUN),
        .Arith_enable(Arith_enable),
        .Logic_enable(Logic_enable),
        .CMP_enable(CMP_enable),
        .Shift_enable(Shift_enable)
    );

    initial begin
        // Test case 1: ALU_FUN = 4'b0000 (Arith_enable should be 1)
        ALU_FUN = 4'b0000;
        #10;
        if (Arith_enable !== 1 || Logic_enable !== 0 || CMP_enable !== 0 || Shift_enable !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: ALU_FUN = 4'b0100 (Logic_enable should be 1)
        ALU_FUN = 4'b0100;
        #10;
        if (Arith_enable !== 0 || Logic_enable !== 1 || CMP_enable !== 0 || Shift_enable !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: ALU_FUN = 4'b1000 (CMP_enable should be 1)
        ALU_FUN = 4'b1000;
        #10;
        if (Arith_enable !== 0 || Logic_enable !== 0 || CMP_enable !== 1 || Shift_enable !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: ALU_FUN = 4'b1100 (Shift_enable should be 1)
        ALU_FUN = 4'b1100;
        #10;
        if (Arith_enable !== 0 || Logic_enable !== 0 || CMP_enable !== 0 || Shift_enable !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: ALU_FUN = 4'b1111 (Shift_enable should still be 1)
        ALU_FUN = 4'b1111;
        #10;
        if (Arith_enable !== 0 || Logic_enable !== 0 || CMP_enable !== 0 || Shift_enable !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule