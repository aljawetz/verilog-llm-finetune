`timescale 1ns/1ps

module tb_mor1kx_wb_mux_cappuccino;

  reg clk;
  reg rst;
  reg [31:0] alu_result_i;
  reg [31:0] lsu_result_i;
  reg [31:0] mul_result_i;
  reg [31:0] spr_i;
  wire [31:0] rf_result_o;
  reg op_mul_i;
  reg op_lsu_load_i;
  reg op_mfspr_i;

  // Instantiate the module under test (uut)
  mor1kx_wb_mux_cappuccino uut (
    .clk(clk),
    .rst(rst),
    .alu_result_i(alu_result_i),
    .lsu_result_i(lsu_result_i),
    .mul_result_i(mul_result_i),
    .spr_i(spr_i),
    .rf_result_o(rf_result_o),
    .op_mul_i(op_mul_i),
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
    // Initialize signals
    rst = 1;
    alu_result_i = 32'hA;
    lsu_result_i = 32'hB;
    mul_result_i = 32'hC;
    spr_i = 32'hD;
    op_mul_i = 0;
    op_lsu_load_i = 0;
    op_mfspr_i = 0;

    // Release reset
    #10 rst = 0;

    // Test ALU result
    #10;
    if (rf_result_o !== alu_result_i) begin
      $display("FAIL: Expected ALU result, got %h", rf_result_o);
      $finish;
    end

    // Test LSU result
    op_lsu_load_i = 1;
    #10;
    if (rf_result_o !== lsu_result_i) begin
      $display("FAIL: Expected LSU result, got %h", rf_result_o);
      $finish;
    end
    op_lsu_load_i = 0;

    // Test SPR result
    op_mfspr_i = 1;
    #10;
    if (rf_result_o !== spr_i) begin
      $display("FAIL: Expected SPR result, got %h", rf_result_o);
      $finish;
    end
    op_mfspr_i = 0;

    // Test multiplication result
    op_mul_i = 1;
    #10;
    if (rf_result_o !== mul_result_i) begin
      $display("FAIL: Expected multiplication result, got %h", rf_result_o);
      $finish;
    end
    op_mul_i = 0;

    // Test back to ALU result
    #10;
    if (rf_result_o !== alu_result_i) begin
      $display("FAIL: Expected ALU result after mul, got %h", rf_result_o);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule