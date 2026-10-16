`timescale 1ns/1ps

module tb_brchcnd;

    reg SF;
    reg ZF;
    reg OF;
    reg [3:0] brch_instr;
    wire BrchCnd;

    // Instantiate the module under test (uut)
    brchcnd uut (
        .SF(SF),
        .ZF(ZF),
        .OF(OF),
        .brch_instr(brch_instr),
        .BrchCnd(BrchCnd)
    );

    initial begin
        // Test case 1: BEQZ (brch_instr = 4'b0000), ZF = 1
        SF = 0; ZF = 1; OF = 0; brch_instr = 4'b0000; #10;
        if (BrchCnd !== 1'b1) $display("FAIL: Test case 1 failed, expected BrchCnd = 1, got %b", BrchCnd);

        // Test case 2: BEQZ (brch_instr = 4'b0000), ZF = 0
        SF = 0; ZF = 0; OF = 0; brch_instr = 4'b0000; #10;
        if (BrchCnd !== 1'b0) $display("FAIL: Test case 2 failed, expected BrchCnd = 0, got %b", BrchCnd);

        // Test case 3: BNEZ (brch_instr = 4'b0001), ZF = 1
        SF = 0; ZF = 1; OF = 0; brch_instr = 4'b0001; #10;
        if (BrchCnd !== 1'b0) $display("FAIL: Test case 3 failed, expected BrchCnd = 0, got %b", BrchCnd);

        // Test case 4: BNEZ (brch_instr = 4'b0001), ZF = 0
        SF = 0; ZF = 0; OF = 0; brch_instr = 4'b0001; #10;
        if (BrchCnd !== 1'b1) $display("FAIL: Test case 4 failed, expected BrchCnd = 1, got %b", BrchCnd);

        // Test case 5: BLTZ (brch_instr = 4'b0010), SF = 0, ZF = 0, OF = 0
        SF = 0; ZF = 0; OF = 0; brch_instr = 4'b0010; #10;
        if (BrchCnd !== 1'b0) $display("FAIL: Test case 5 failed, expected BrchCnd = 0, got %b", BrchCnd);

        // Test case 6: BLTZ (brch_instr = 4'b0010), SF = 1, ZF = 0, OF = 0
        SF = 1; ZF = 0; OF = 0; brch_instr = 4'b0010; #10;
        if (BrchCnd !== 1'b0) $display("FAIL: Test case 6 failed, expected BrchCnd = 0, got %b", BrchCnd);

        // Test case 7: BLTZ (brch_instr = 4'b0010), SF = 0, ZF = 0, OF = 1
        SF = 0; ZF = 0; OF = 1; brch_instr = 4'b0010; #10;
        if (BrchCnd !== 1'b1) $display("FAIL: Test case 7 failed, expected BrchCnd = 1, got %b", BrchCnd);

        // Test case 8: BGEZ (brch_instr = 4'b0011), SF = 0, ZF = 0, OF = 0
        SF = 0; ZF = 0; OF = 0; brch_instr = 4'b0011; #10;
        if (BrchCnd !== 1'b1) $display("FAIL: Test case 8 failed, expected BrchCnd = 1, got %b", BrchCnd);

        // Test case 9: BGEZ (brch_instr = 4'b0011), SF = 1, ZF = 1, OF = 0
        SF = 1; ZF = 1; OF = 0; brch_instr = 4'b0011; #10;
        if (BrchCnd !== 1'b0) $display("FAIL: Test case 9 failed, expected BrchCnd = 0, got %b", BrchCnd);

        // Test case 10: BGEZ (brch_instr = 4'b0011), SF = 1, ZF = 0, OF = 1
        SF = 1; ZF = 0; OF = 1; brch_instr = 4'b0011; #10;
        if (BrchCnd !== 1'b0) $display("FAIL: Test case 10 failed, expected BrchCnd = 0, got %b", BrchCnd);

        // Test case 11: Unconditional branch (brch_instr = 4'b1000)
        SF = 0; ZF = 0; OF = 0; brch_instr = 4'b1000; #10;
        if (BrchCnd !== 1'b1) $display("FAIL: Test case 11 failed, expected BrchCnd = 1, got %b", BrchCnd);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule