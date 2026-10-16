`timescale 1ns/1ps

module tb_brchcnd;

    reg SF;
    reg ZF;
    reg [3:0] brch_instr;
    wire BrchCnd;

    // Instantiate the module under test (uut)
    brchcnd uut (
        .SF(SF),
        .ZF(ZF),
        .brch_instr(brch_instr),
        .BrchCnd(BrchCnd)
    );

    initial begin
        // Test case 1: BEQZ (brch_instr = 4'b0000)
        SF = 0; ZF = 1; brch_instr = 4'b0000; #10;
        if (BrchCnd !== 1'b1) $display("FAIL: Test case 1 failed (BEQZ)");
        
        // Test case 2: BNEZ (brch_instr = 4'b0001)
        SF = 0; ZF = 0; brch_instr = 4'b0001; #10;
        if (BrchCnd !== 1'b1) $display("FAIL: Test case 2 failed (BNEZ)");

        // Test case 3: BLTZ (brch_instr = 4'b0010)
        SF = 0; ZF = 0; brch_instr = 4'b0010; #10;
        if (BrchCnd !== 1'b1) $display("FAIL: Test case 3 failed (BLTZ)");

        // Test case 4: BGEZ (brch_instr = 4'b0011)
        SF = 1; ZF = 0; brch_instr = 4'b0011; #10;
        if (BrchCnd !== 1'b1) $display("FAIL: Test case 4 failed (BGEZ)");

        // Test case 5: Unconditional branch (brch_instr = 4'b1000)
        SF = 0; ZF = 0; brch_instr = 4'b1000; #10;
        if (BrchCnd !== 1'b1) $display("FAIL: Test case 5 failed (Unconditional branch)");

        // Test case 6: Conditional branch with ZF = 1 (brch_instr = 4'b1100)
        SF = 0; ZF = 1; brch_instr = 4'b1100; #10;
        if (BrchCnd !== 1'b1) $display("FAIL: Test case 6 failed (Conditional branch with ZF = 1)");

        // Test case 7: Conditional branch with ZF = 0 (brch_instr = 4'b1101)
        SF = 0; ZF = 0; brch_instr = 4'b1101; #10;
        if (BrchCnd !== 1'b0) $display("FAIL: Test case 7 failed (Conditional branch with ZF = 0)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule