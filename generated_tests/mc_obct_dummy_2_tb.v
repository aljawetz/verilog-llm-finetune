`timescale 1ns/1ps

module tb_mc_obct_dummy;

  reg clk;
  reg rst;
  reg [12:0] row_adr;
  reg [1:0] bank_adr;
  reg bank_set;
  reg bank_clr;
  reg bank_clr_all;
  
  wire bank_open;
  wire any_bank_open;
  wire row_same;

  // Instantiate the module under test (uut)
  mc_obct_dummy uut (
    .clk(clk),
    .rst(rst),
    .row_adr(row_adr),
    .bank_adr(bank_adr),
    .bank_set(bank_set),
    .bank_clr(bank_clr),
    .bank_clr_all(bank_clr_all),
    .bank_open(bank_open),
    .any_bank_open(any_bank_open),
    .row_same(row_same)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 0;
    row_adr = 0;
    bank_adr = 0;
    bank_set = 0;
    bank_clr = 0;
    bank_clr_all = 0;

    // Apply reset
    rst = 1;
    #10;
    rst = 0;
    #10;

    // Check outputs
    if (bank_open !== 1'b0) begin
      $display("FAIL: bank_open should be 0");
      $finish;
    end

    if (any_bank_open !== 1'b0) begin
      $display("FAIL: any_bank_open should be 0");
      $finish;
    end

    if (row_same !== 1'b0) begin
      $display("FAIL: row_same should be 0");
      $finish;
    end

    // Additional checks with different input values
    row_adr = 13'h1A2; bank_adr = 2'b01; bank_set = 1; bank_clr = 0; bank_clr_all = 0;
    #10;

    if (bank_open !== 1'b0) begin
      $display("FAIL: bank_open should be 0 after inputs change");
      $finish;
    end

    if (any_bank_open !== 1'b0) begin
      $display("FAIL: any_bank_open should be 0 after inputs change");
      $finish;
    end

    if (row_same !== 1'b0) begin
      $display("FAIL: row_same should be 0 after inputs change");
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end

endmodule