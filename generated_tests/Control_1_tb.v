`timescale 1ns/1ps

module tb_Control;

  reg [6:0] Op_i;
  wire [1:0] ALUOp_o;
  wire ALUSrc_o;
  wire RegWrite_o;
  wire MemRd_o;
  wire MemWr_o;
  wire MemToReg_o;
  wire immSelect_o;

  // Instantiate the Control module
  Control uut (
    .Op_i(Op_i),
    .ALUOp_o(ALUOp_o),
    .ALUSrc_o(ALUSrc_o),
    .RegWrite_o(RegWrite_o),
    .MemRd_o(MemRd_o),
    .MemWr_o(MemWr_o),
    .MemToReg_o(MemToReg_o),
    .immSelect_o(immSelect_o)
  );

  initial begin
    // Test case 1: Test for opcode 0010011 (addi)
    Op_i = 7'b0010011; #10;
    if (ALUOp_o !== 2'b11 || ALUSrc_o !== 1'b1 || RegWrite_o !== 1'b1 || 
        MemRd_o !== 1'b0 || MemWr_o !== 1'b0 || MemToReg_o !== 1'b0 || 
        immSelect_o !== 1'b0) begin
      $display("FAIL: Test case 1 failed for opcode 0010011");
      $finish;
    end

    // Test case 2: Test for opcode 0110011 (others)
    Op_i = 7'b0110011; #10;
    if (ALUOp_o !== 2'b10 || ALUSrc_o !== 1'b0 || RegWrite_o !== 1'b1 || 
        MemRd_o !== 1'b0 || MemWr_o !== 1'b0 || MemToReg_o !== 1'b0 || 
        immSelect_o !== 1'b0) begin
      $display("FAIL: Test case 2 failed for opcode 0110011");
      $finish;
    end

    // Test case 3: Test for opcode 1100011 (beq)
    Op_i = 7'b1100011; #10;
    if (ALUOp_o !== 2'b01 || ALUSrc_o !== 1'b1 || RegWrite_o !== 1'b0 || 
        MemRd_o !== 1'b0 || MemWr_o !== 1'b0 || MemToReg_o !== 1'b0 || 
        immSelect_o !== 1'b0) begin
      $display("FAIL: Test case 3 failed for opcode 1100011");
      $finish;
    end

    // Test case 4: Test for opcode 0000011 (lw)
    Op_i = 7'b0000011; #10;
    if (ALUOp_o !== 2'b00 || ALUSrc_o !== 1'b1 || RegWrite_o !== 1'b1 || 
        MemRd_o !== 1'b1 || MemWr_o !== 1'b0 || MemToReg_o !== 1'b1 || 
        immSelect_o !== 1'b0) begin
      $display("FAIL: Test case 4 failed for opcode 0000011");
      $finish;
    end

    // Test case 5: Test for opcode 0100011 (sw)
    Op_i = 7'b0100011; #10;
    if (ALUOp_o !== 2'b00 || ALUSrc_o !== 1'b1 || RegWrite_o !== 1'b0 || 
        MemRd_o !== 1'b0 || MemWr_o !== 1'b1 || MemToReg_o !== 1'b0 || 
        immSelect_o !== 1'b1) begin
      $display("FAIL: Test case 5 failed for opcode 0100011");
      $finish;
    end

    // Test case 6: Test for opcode 1010111 (vector)
    Op_i = 7'b1010111; #10;
    if (ALUOp_o !== 2'b00 || ALUSrc_o !== 1'b0 || RegWrite_o !== 1'b1 || 
        MemRd_o !== 1'b0 || MemWr_o !== 1'b0 || MemToReg_o !== 1'b0 || 
        immSelect_o !== 1'b0) begin
      $display("FAIL: Test case 6 failed for opcode 1010111");
      $finish;
    end

    // Test case 7: Test for default case
    Op_i = 7'b1111111; #10;
    if (ALUOp_o !== 2'b11 || ALUSrc_o !== 1'b1 || RegWrite_o !== 1'b0 || 
        MemRd_o !== 1'b0 || MemWr_o !== 1'b0 || MemToReg_o !== 1'b0 || 
        immSelect_o !== 1'b0) begin
      $display("FAIL: Test case 7 failed for default case");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule