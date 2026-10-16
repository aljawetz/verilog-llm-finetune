`timescale 1ns/1ps

module tb_e203_ifu_minidec;

  // Parameters
  parameter E203_INSTR_SIZE = 32;
  parameter E203_RFIDX_WIDTH = 5;
  parameter E203_XLEN = 32;

  // Inputs
  reg [E203_INSTR_SIZE-1:0] instr;

  // Outputs
  wire dec_rs1en;
  wire dec_rs2en;
  wire [E203_RFIDX_WIDTH-1:0] dec_rs1idx;
  wire [E203_RFIDX_WIDTH-1:0] dec_rs2idx;
  wire dec_mul;
  wire dec_mulhsu;
  wire dec_div;
  wire dec_divu;
  wire dec_rem;
  wire dec_remu;
  wire dec_rv32;
  wire dec_bjp;
  wire dec_jal;
  wire dec_jalr;
  wire dec_bxx;
  wire [E203_RFIDX_WIDTH-1:0] dec_jalr_rs1idx;
  wire [E203_XLEN-1:0] dec_bjp_imm;

  // Instantiate the Unit Under Test (UUT)
  e203_ifu_minidec uut (
    .instr(instr),
    .dec_rs1en(dec_rs1en),
    .dec_rs2en(dec_rs2en),
    .dec_rs1idx(dec_rs1idx),
    .dec_rs2idx(dec_rs2idx),
    .dec_mul(dec_mul),
    .dec_mulhsu(dec_mulhsu),
    .dec_div(dec_div),
    .dec_divu(dec_divu),
    .dec_rem(dec_rem),
    .dec_remu(dec_remu),
    .dec_rv32(dec_rv32),
    .dec_bjp(dec_bjp),
    .dec_jal(dec_jal),
    .dec_jalr(dec_jalr),
    .dec_bxx(dec_bxx),
    .dec_jalr_rs1idx(dec_jalr_rs1idx),
    .dec_bjp_imm(dec_bjp_imm)
  );

  initial begin
    // Test case 1: Test a JAL instruction
    instr = 32'b1101111_00000000000000000000000000; // JAL instruction
    #10;
    if (dec_jal !== 1'b1) $display("FAIL: JAL instruction did not decode correctly");
    if (dec_bjp !== 1'b1) $display("FAIL: JAL instruction did not set bjp correctly");
    if (dec_jalr !== 1'b0) $display("FAIL: JAL instruction incorrectly set jalr");
    
    // Test case 2: Test a JALR instruction
    instr = 32'b1100111_00000000000000000000000000; // JALR instruction
    #10;
    if (dec_jalr !== 1'b1) $display("FAIL: JALR instruction did not decode correctly");
    if (dec_bjp !== 1'b1) $display("FAIL: JALR instruction did not set bjp correctly");
    if (dec_jal !== 1'b0) $display("FAIL: JALR instruction incorrectly set jal");
    
    // Test case 3: Test a ADD instruction
    instr = 32'b0000000_00000000000_000_00000_0110011; // ADD instruction
    #10;
    if (dec_rs1en !== 1'b1) $display("FAIL: ADD instruction did not enable rs1");
    if (dec_rs2en !== 1'b1) $display("FAIL: ADD instruction did not enable rs2");
    if (dec_mul !== 1'b0) $display("FAIL: ADD instruction incorrectly set mul");
    
    // Test case 4: Test a MUL instruction
    instr = 32'b0000001_00000000000_000_00000_0110011; // MUL instruction
    #10;
    if (dec_mul !== 1'b1) $display("FAIL: MUL instruction did not decode correctly");
    
    // Test case 5: Test a DIV instruction
    instr = 32'b0000001_00000000000_000_00000_0110011; // DIV instruction
    #10;
    if (dec_div !== 1'b1) $display("FAIL: DIV instruction did not decode correctly");
    
    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule