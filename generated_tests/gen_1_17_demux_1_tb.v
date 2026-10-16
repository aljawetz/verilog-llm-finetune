`timescale 1ns/1ps

module tb_gen_1_17_demux;

  parameter PA_DATA = 32;
  parameter PA_SEL = 9;

  reg clk;
  reg rst_b;
  reg [PA_DATA-1:0] mux_in;
  reg [PA_SEL-1:0] sel;
  wire [PA_DATA-1:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, pc;

  // Instantiate the module under test
  gen_1_17_demux uut (
    .clk(clk),
    .rst_b(rst_b),
    .mux_in(mux_in),
    .sel(sel),
    .reg0(reg0),
    .reg1(reg1),
    .reg2(reg2),
    .reg3(reg3),
    .reg4(reg4),
    .reg5(reg5),
    .reg6(reg6),
    .reg7(reg7),
    .reg8(reg8),
    .reg9(reg9),
    .reg10(reg10),
    .reg11(reg11),
    .reg12(reg12),
    .reg13(reg13),
    .reg14(reg14),
    .reg15(reg15),
    .pc(pc)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_b = 0;
    mux_in = 0;
    sel = 0;

    // Release reset
    #10;
    rst_b = 1;

    // Test case 1: Select reg0
    mux_in = 32'hA5A5A5A5; // Input data
    sel = 9'h000; // Select reg0
    #10;
    if (reg0 !== mux_in) begin
      $display("FAIL: reg0 did not receive the correct value");
      $finish;
    end

    // Test case 2: Select reg1
    mux_in = 32'h5A5A5A5A; // Input data
    sel = 9'h001; // Select reg1
    #10;
    if (reg1 !== mux_in) begin
      $display("FAIL: reg1 did not receive the correct value");
      $finish;
    end

    // Test case 3: Select reg15
    mux_in = 32'hDEADBEEF; // Input data
    sel = 9'h00F; // Select reg15
    #10;
    if (reg15 !== mux_in) begin
      $display("FAIL: reg15 did not receive the correct value");
      $finish;
    end

    // Test case 4: Select pc
    mux_in = 32'h12345678; // Input data
    sel = 9'h0FF; // Select pc
    #10;
    if (pc !== mux_in) begin
      $display("FAIL: pc did not receive the correct value");
      $finish;
    end

    // Test case 5: Check reset functionality
    rst_b = 0; // Assert reset
    #10;
    if (reg0 !== 0 || reg1 !== 0 || reg15 !== 0 || pc !== 0) begin
      $display("FAIL: Registers or pc did not reset to zero");
      $finish;
    end

    // Finalize the test
    $display("PASS");
    $finish;
  end

endmodule