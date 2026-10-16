`timescale 1ns/1ps

module tb_mor1kx_wb_mux_espresso;

  reg clk;
  reg rst;
  reg [31:0] alu_result_i;
  reg [31:0] lsu_result_i;
  reg [31:0] ppc_i;
  reg [31:0] pc_fetch_next_i;
  reg [31:0] spr_i;
  reg op_jal_i;
  reg op_lsu_load_i;
  reg op_mfspr_i;
  wire [31:0] rf_result_o;

  // Instantiate the module under test (uut)
  mor1kx_wb_mux_espresso uut (
    .rf_result_o(rf_result_o),
    .clk(clk),
    .rst(rst),
    .alu_result_i(alu_result_i),
    .lsu_result_i(lsu_result_i),
    .ppc_i(ppc_i),
    .pc_fetch_next_i(pc_fetch_next_i),
    .spr_i(spr_i),
    .op_jal_i(op_jal_i),
    .op_lsu_load_i(op_lsu_load_i),
    .op_mfspr_i(op_mfspr_i)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1;
    alu_result_i = 32'hAAAA_AAAA;
    lsu_result_i = 32'hBBBB_BBBB;
    ppc_i = 32'hCCCC_CCCC;
    pc_fetch_next_i = 32'hDDDD_DDDD;
    spr_i = 32'hEEEE_EEEE;
    op_jal_i = 0;
    op_lsu_load_i = 0;
    op_mfspr_i = 0;

    // Release reset
    #10;
    rst = 0;

    // Test case 1: Select ALU result
    #10;
    if (rf_result_o !== alu_result_i) begin
      $display("FAIL: Expected ALU result");
      $finish;
    end

    // Test case 2: Select LSU result
    op_lsu_load_i = 1;
    #10;
    if (rf_result_o !== lsu_result_i) begin
      $display("FAIL: Expected LSU result");
      $finish;
    end

    // Test case 3: Select SPR result
    op_lsu_load_i = 0;
    op_mfspr_i = 1;
    #10;
    if (rf_result_o !== spr_i) begin
      $display("FAIL: Expected SPR result");
      $finish;
    end

    // Test case 4: Select PC fetch next result
    op_mfspr_i = 0;
    op_jal_i = 1;
    #10;
    if (rf_result_o !== pc_fetch_next_i) begin
      $display("FAIL: Expected PC fetch next result");
      $finish;
    end

    // Test case 5: Default to ALU result
    op_jal_i = 0;
    #10;
    if (rf_result_o !== alu_result_i) begin
      $display("FAIL: Expected ALU result");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule