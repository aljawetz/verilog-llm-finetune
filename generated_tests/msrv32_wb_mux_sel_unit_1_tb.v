`timescale 1ns/1ps

module tb_msrv32_wb_mux_sel_unit;

  reg [2:0] wb_mux_sel_reg_in;
  reg [31:0] alu_result_in, lu_output_in, imm_reg_in, iadder_out_reg_in, csr_data_in, pc_plus_4_reg_in, rs2_reg_in;
  reg alu_source_reg_in;
  wire [31:0] wb_mux_out;
  wire [31:0] alu_2nd_src_mux_out;

  // Instantiate the module under test (uut)
  msrv32_wb_mux_sel_unit uut (
    .wb_mux_sel_reg_in(wb_mux_sel_reg_in),
    .alu_result_in(alu_result_in),
    .lu_output_in(lu_output_in),
    .imm_reg_in(imm_reg_in),
    .iadder_out_reg_in(iadder_out_reg_in),
    .csr_data_in(csr_data_in),
    .pc_plus_4_reg_in(pc_plus_4_reg_in),
    .rs2_reg_in(rs2_reg_in),
    .alu_source_reg_in(alu_source_reg_in),
    .wb_mux_out(wb_mux_out),
    .alu_2nd_src_mux_out(alu_2nd_src_mux_out)
  );

  initial begin
    // Initialize inputs
    wb_mux_sel_reg_in = 3'b000;
    alu_result_in = 32'hA;
    lu_output_in = 32'hB;
    imm_reg_in = 32'hC;
    iadder_out_reg_in = 32'hD;
    csr_data_in = 32'hE;
    pc_plus_4_reg_in = 32'hF;
    rs2_reg_in = 32'h10;
    alu_source_reg_in = 0;

    // Test cases
    // Test WB_ALU
    wb_mux_sel_reg_in = 3'b000;
    #10;
    if (wb_mux_out !== alu_result_in) begin
      $display("FAIL: WB_ALU selection failed");
      $finish;
    end

    // Test WB_LU
    wb_mux_sel_reg_in = 3'b001;
    #10;
    if (wb_mux_out !== lu_output_in) begin
      $display("FAIL: WB_LU selection failed");
      $finish;
    end

    // Test WB_IMM
    wb_mux_sel_reg_in = 3'b010;
    #10;
    if (wb_mux_out !== imm_reg_in) begin
      $display("FAIL: WB_IMM selection failed");
      $finish;
    end

    // Test WB_IADDER_OUT
    wb_mux_sel_reg_in = 3'b011;
    #10;
    if (wb_mux_out !== iadder_out_reg_in) begin
      $display("FAIL: WB_IADDER_OUT selection failed");
      $finish;
    end

    // Test WB_CSR
    wb_mux_sel_reg_in = 3'b100;
    #10;
    if (wb_mux_out !== csr_data_in) begin
      $display("FAIL: WB_CSR selection failed");
      $finish;
    end

    // Test WB_PC_PLUS
    wb_mux_sel_reg_in = 3'b101;
    #10;
    if (wb_mux_out !== pc_plus_4_reg_in) begin
      $display("FAIL: WB_PC_PLUS selection failed");
      $finish;
    end

    // Test alu_source_reg_in = 0 (select imm_reg_in)
    alu_source_reg_in = 0;
    #10;
    if (alu_2nd_src_mux_out !== imm_reg_in) begin
      $display("FAIL: alu_source_reg_in = 0 selection failed");
      $finish;
    end

    // Test alu_source_reg_in = 1 (select rs2_reg_in)
    alu_source_reg_in = 1;
    #10;
    if (alu_2nd_src_mux_out !== rs2_reg_in) begin
      $display("FAIL: alu_source_reg_in = 1 selection failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule