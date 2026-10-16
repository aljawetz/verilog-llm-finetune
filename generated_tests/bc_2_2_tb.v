`timescale 1ns/1ps

module tb_bc_2;

  reg capture_clk;
  reg update_clk;
  reg capture_en;
  reg update_en;
  reg shift_dr;
  reg mode;
  reg si;
  reg data_in;
  reg reset_n;
  wire data_out;
  wire so;

  // Instantiate the Unit Under Test (UUT)
  bc_2 uut (
    .capture_clk(capture_clk),
    .update_clk(update_clk),
    .capture_en(capture_en),
    .update_en(update_en),
    .shift_dr(shift_dr),
    .mode(mode),
    .si(si),
    .data_in(data_in),
    .reset_n(reset_n),
    .data_out(data_out),
    .so(so)
  );

  // Clock generation
  initial begin
    capture_clk = 0;
    update_clk = 0;
    forever begin
      #5 capture_clk = ~capture_clk; // 100MHz
      #5 update_clk = ~update_clk;   // 100MHz
    end
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset_n = 0;
    capture_en = 0;
    update_en = 0;
    shift_dr = 0;
    mode = 0;
    si = 0;
    data_in = 0;

    // Release reset
    #10 reset_n = 1;

    // Test case 1: Parallel capture mode
    capture_en = 1;
    data_in = 1; // Set data_in to 1
    #10;
    if (data_out !== 1) begin
      $display("FAIL: Expected data_out to be 1 in parallel mode");
      $finish;
    end

    // Test case 2: Shift mode
    capture_en = 1;
    shift_dr = 1;
    si = 1; // Shift in 1
    #10;
    if (so !== 1) begin
      $display("FAIL: Expected so to be 1 after shifting in");
      $finish;
    end

    // Test case 3: Update holding register
    capture_en = 0;
    update_en = 1;
    #10;
    if (uut.data_reg !== 1) begin
      $display("FAIL: Expected data_reg to be 1 after update");
      $finish;
    end

    // Test case 4: Change mode to mission mode
    mode = 1;
    #10;
    if (data_out !== 1) begin
      $display("FAIL: Expected data_out to be 1 in mission mode");
      $finish;
    end

    // Test case 5: Reset functionality
    reset_n = 0;
    #10;
    reset_n = 1;
    #10;
    if (uut.data_reg !== 0 || so !== 0) begin
      $display("FAIL: Expected data_reg and so to be 0 after reset");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule