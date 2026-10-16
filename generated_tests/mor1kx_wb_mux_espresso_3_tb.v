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
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1;
    alu_result_i = 32'hA;
    lsu_result_i = 32'hB;
    ppc_i = 32'hC;
    pc_fetch_next_i = 32'hD;
    spr_i = 32'hE;
    op_jal_i = 0;
    op_lsu_load_i = 0;
    op_mfspr_i = 0;

    // Release reset
    #10 rst = 0;

    // Test case 1: Select ALU result
    #10;
    if (rf_result_o !== alu_result_i) begin
      $display("FAIL: Test case 1 failed, expected %h, got %h", alu_result_i, rf_result_o);
      $finish;
    end

    // Test case 2: Select LSU result
    op_lsu_load_i = 1;
    #10;
    if (rf_result_o !== lsu_result_i) begin
      $display("FAIL: Test case 2 failed, expected %h, got %h", lsu_result_i, rf_result_o);
      $finish;
    end

    // Test case 3: Select SPR result
    op_lsu_load_i = 0;
    op_mfspr_i = 1;
    #10;
    if (rf_result_o !== spr_i) begin
      $display("FAIL: Test case 3 failed, expected %h, got %h", spr_i, rf_result_o);
      $finish;
    end

    // Test case 4: Select PC fetch next result
    op_mfspr_i = 0;
    op_jal_i = 1;
    #10;
    if (rf_result_o !== pc_fetch_next_i) begin
      $display("FAIL: Test case 4 failed, expected %h, got %h", pc_fetch_next_i, rf_result_o);
      $finish;
    end

    // Test case 5: Default to ALU result again
    op_jal_i = 0;
    #10;
    if (rf_result_o !== alu_result_i) begin
      $display("FAIL: Test case 5 failed, expected %h, got %h", alu_result_i, rf_result_o);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule