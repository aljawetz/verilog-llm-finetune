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
      // Test case 1: BEQZ (ZF = 1)
      SF = 0; ZF = 1; brch_instr = 4'b0000; // Expect BrchCnd = 1
      #10;
      if (BrchCnd !== 1'b1) $display("FAIL: Test case 1 failed");

      // Test case 2: BNEZ (ZF = 0)
      SF = 0; ZF = 0; brch_instr = 4'b0001; // Expect BrchCnd = 1
      #10;
      if (BrchCnd !== 1'b1) $display("FAIL: Test case 2 failed");

      // Test case 3: BLTZ (SF = 0, ZF = 0)
      SF = 0; ZF = 0; brch_instr = 4'b0010; // Expect BrchCnd = 1
      #10;
      if (BrchCnd !== 1'b1) $display("FAIL: Test case 3 failed");

      // Test case 4: BGEZ (SF = 0, ZF = 0)
      SF = 0; ZF = 0; brch_instr = 4'b0011; // Expect BrchCnd = 0
      #10;
      if (BrchCnd !== 1'b0) $display("FAIL: Test case 4 failed");

      // Test case 5: BGEZ (SF = 1, ZF = 0)
      SF = 1; ZF = 0; brch_instr = 4'b0011; // Expect BrchCnd = 1
      #10;
      if (BrchCnd !== 1'b1) $display("FAIL: Test case 5 failed");

      // Test case 6: BGEZ (SF = 0, ZF = 1)
      SF = 0; ZF = 1; brch_instr = 4'b0011; // Expect BrchCnd = 1
      #10;
      if (BrchCnd !== 1'b1) $display("FAIL: Test case 6 failed");

      // Test case 7: BNEZ (ZF = 1)
      SF = 0; ZF = 1; brch_instr = 4'b0001; // Expect BrchCnd = 0
      #10;
      if (BrchCnd !== 1'b0) $display("FAIL: Test case 7 failed");

      // Test case 8: BEQZ (ZF = 0)
      SF = 0; ZF = 0; brch_instr = 4'b0000; // Expect BrchCnd = 0
      #10;
      if (BrchCnd !== 1'b0) $display("FAIL: Test case 8 failed");

      // Test case 9: BNEZ (ZF = 1, with brch_instr[3] = 1)
      SF = 0; ZF = 1; brch_instr = 4'b1001; // Expect BrchCnd = 1
      #10;
      if (BrchCnd !== 1'b1) $display("FAIL: Test case 9 failed");

      // Test case 10: BNEZ (ZF = 0, with brch_instr[3] = 1)
      SF = 0; ZF = 0; brch_instr = 4'b1001; // Expect BrchCnd = 1
      #10;
      if (BrchCnd !== 1'b1) $display("FAIL: Test case 10 failed");

      // If all tests pass
      $display("PASS");
      $finish;
   end

endmodule