`timescale 1ns/1ps

module tb_msrv32_reg_block_2;

  // Inputs
  reg [4:0] rd_addr_in;
  reg [11:0] csr_addr_in;
  reg [31:0] rs1_in, rs2_in, pc_in, pc_plus_4_in, iadder_in, imm_in;
  reg [3:0] alu_opcode_in;
  reg [1:0] load_size_in;
  reg [2:0] wb_mux_sel_in, csr_op_in;
  reg load_unsigned_in, alu_src_in, csr_wr_en_in, rf_wr_en_in, branch_taken_in;
  reg clk_in;
  reg reset_in;

  // Outputs
  wire [4:0] rd_addr_reg_out;
  wire [11:0] csr_addr_reg_out;
  wire [31:0] rs1_reg_out, rs2_reg_out, pc_reg_out, pc_plus_4_reg_out, iadder_out_reg_out, imm_reg_out;
  wire [3:0] alu_opcode_reg_out;
  wire [1:0] load_size_reg_out;
  wire [2:0] wb_mux_sel_reg_out, csr_op_reg_out;
  wire load_unsigned_reg_out, alu_src_reg_out, csr_wr_en_reg_out, rf_wr_en_reg_out;

  // Instantiate the Unit Under Test (UUT)
  msrv32_reg_block_2 uut (
    .rd_addr_in(rd_addr_in),
    .csr_addr_in(csr_addr_in),
    .rs1_in(rs1_in),
    .rs2_in(rs2_in),
    .pc_in(pc_in),
    .pc_plus_4_in(pc_plus_4_in),
    .iadder_in(iadder_in),
    .imm_in(imm_in),
    .alu_opcode_in(alu_opcode_in),
    .load_size_in(load_size_in),
    .wb_mux_sel_in(wb_mux_sel_in),
    .csr_op_in(csr_op_in),
    .load_unsigned_in(load_unsigned_in),
    .alu_src_in(alu_src_in),
    .csr_wr_en_in(csr_wr_en_in),
    .rf_wr_en_in(rf_wr_en_in),
    .branch_taken_in(branch_taken_in),
    .clk_in(clk_in),
    .reset_in(reset_in),
    .rd_addr_reg_out(rd_addr_reg_out),
    .csr_addr_reg_out(csr_addr_reg_out),
    .rs1_reg_out(rs1_reg_out),
    .rs2_reg_out(rs2_reg_out),
    .pc_reg_out(pc_reg_out),
    .pc_plus_4_reg_out(pc_plus_4_reg_out),
    .iadder_out_reg_out(iadder_out_reg_out),
    .imm_reg_out(imm_reg_out),
    .alu_opcode_reg_out(alu_opcode_reg_out),
    .load_size_reg_out(load_size_reg_out),
    .wb_mux_sel_reg_out(wb_mux_sel_reg_out),
    .csr_op_reg_out(csr_op_reg_out),
    .load_unsigned_reg_out(load_unsigned_reg_out),
    .alu_src_reg_out(alu_src_reg_out),
    .csr_wr_en_reg_out(csr_wr_en_reg_out),
    .rf_wr_en_reg_out(rf_wr_en_reg_out)
  );

  // Clock generation
  initial begin
    clk_in = 0;
    forever #5 clk_in = ~clk_in; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset_in = 1;
    #10;
    reset_in = 0;

    // Test case 1: Check reset values
    #10;
    if (rd_addr_reg_out !== 5'b00000) $display("FAIL: Reset rd_addr_reg_out failed");
    if (csr_addr_reg_out !== 12'b000000000000) $display("FAIL: Reset csr_addr_reg_out failed");
    if (rs1_reg_out !== 32'h00000000) $display("FAIL: Reset rs1_reg_out failed");
    if (rs2_reg_out !== 32'h00000000) $display("FAIL: Reset rs2_reg_out failed");
    if (pc_reg_out !== 32'h00000000) $display("FAIL: Reset pc_reg_out failed");
    if (pc_plus_4_reg_out !== 32'h00000000) $display("FAIL: Reset pc_plus_4_reg_out failed");
    if (iadder_out_reg_out !== 32'h00000000) $display("FAIL: Reset iadder_out_reg_out failed");
    if (alu_opcode_reg_out !== 4'b0000) $display("FAIL: Reset alu_opcode_reg_out failed");
    if (load_size_reg_out !== 2'b00) $display("FAIL: Reset load_size_reg_out failed");
    if (load_unsigned_reg_out !== 1'b0) $display("FAIL: Reset load_unsigned_reg_out failed");
    if (alu_src_reg_out !== 1'b0) $display("FAIL: Reset alu_src_reg_out failed");
    if (csr_wr_en_reg_out !== 1'b0) $display("FAIL: Reset csr_wr_en_reg_out failed");
    if (rf_wr_en_reg_out !== 1'b0) $display("FAIL: Reset rf_wr_en_reg_out failed");
    if (wb_mux_sel_reg_out !== 3'b000) $display("FAIL: Reset wb_mux_sel_reg_out failed");
    if (csr_op_reg_out !== 3'b000) $display("FAIL: Reset csr_op_reg_out failed");
    if (imm_reg_out !== 32'h00000000) $display("FAIL: Reset imm_reg_out failed");

    // Test case 2: Check register values after inputs are applied
    rd_addr_in = 5'b10101;
    csr_addr_in = 12'b000011110000;
    rs1_in = 32'hA5A5A5A5;
    rs2_in = 32'h5A5A5A5A;
    pc_in = 32'h00000010;
    pc_plus_4_in = 32'h00000014;
    iadder_in = 32'h00000020;
    imm_in = 32'h000000FF;
    alu_opcode_in = 4'b1010;
    load_size_in = 2'b01;
    load_unsigned_in = 1'b1;
    alu_src_in = 1'b1;
    csr_wr_en_in = 1'b1;
    rf_wr_en_in = 1'b1;
    branch_taken_in = 1'b0;

    #10; // Wait for one clock cycle

    if (rd_addr_reg_out !== 5'b10101) $display("FAIL: rd_addr_reg_out mismatch");
    if (csr_addr_reg_out !== 12'b000011110000) $display("FAIL: csr_addr_reg_out mismatch");
    if (rs1_reg_out !== 32'hA5A5A5A5) $display("FAIL: rs1_reg_out mismatch");
    if (rs2_reg_out !== 32'h5A5A5A5A) $display("FAIL: rs2_reg_out mismatch");
    if (pc_reg_out !== 32'h00000010) $display("FAIL: pc_reg_out mismatch");
    if (pc_plus_4_reg_out !== 32'h00000014) $display("FAIL: pc_plus_4_reg_out mismatch");
    if (iadder_out_reg_out !== 32'h00000020) $display("FAIL: iadder_out_reg_out mismatch");
    if (imm_reg_out !== 32'h000000FF) $display("FAIL: imm_reg_out mismatch");
    if (alu_opcode_reg_out !== 4'b1010) $display("FAIL: alu_opcode_reg_out mismatch");
    if (load_size_reg_out !== 2'b01) $display("FAIL: load_size_reg_out mismatch");
    if (load_unsigned_reg_out !== 1'b1) $display("FAIL: load_unsigned_reg_out mismatch");
    if (alu_src_reg_out !== 1'b1) $display("FAIL: alu_src_reg_out mismatch");
    if (csr_wr_en_reg_out !== 1'b1) $display("FAIL: csr_wr_en_reg_out mismatch");
    if (rf_wr_en_reg_out !== 1'b1) $display("FAIL: rf_wr_en_reg_out mismatch");

    // Test case 3: Check iadder_out_reg_out with branch taken
    branch_taken_in = 1'b1;
    iadder_in = 32'h00000001; // Change input to see effect
    #10; // Wait for one clock cycle

    if (iadder_out_reg_out !== 32'h00000000) $display("FAIL: iadder_out_reg_out mismatch with branch taken");

    $display("PASS");
    $finish;
  end

endmodule