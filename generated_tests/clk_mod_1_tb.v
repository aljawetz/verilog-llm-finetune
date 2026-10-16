`timescale 1ns/1ps

module tb_clk_mod;

  reg inclk;
  reg in_prev;
  reg in_ser;
  wire interim;
  wire clk_o;

  // Instantiate the module under test (uut)
  clk_mod uut (
    .inclk(inclk),
    .in_prev(in_prev),
    .in_ser(in_ser),
    .interim(interim),
    .clk_o(clk_o)
  );

  // Clock generation
  initial begin
    inclk = 0;
    forever #5 inclk = ~inclk; // 10ns period clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    in_prev = 0;
    in_ser = 0;

    // Wait for a clock edge
    @(posedge inclk);
    
    // Test case 1: in_prev = 0, in_ser = 0
    if (interim !== 0 || clk_o !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: in_prev = 0, in_ser = 1
    in_ser = 1;
    @(posedge inclk);
    if (interim !== 1 || clk_o !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: in_prev = 1, in_ser = 0
    in_prev = 1;
    in_ser = 0;
    @(posedge inclk);
    if (interim !== 1 || clk_o !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: in_prev = 1, in_ser = 1
    in_ser = 1;
    @(posedge inclk);
    if (interim !== 0 || clk_o !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: in_prev = 0, in_ser = 0, inclk = 1
    in_prev = 0;
    in_ser = 0;
    @(posedge inclk);
    if (interim !== 0 || clk_o !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: in_prev = 1, in_ser = 1, inclk = 1
    in_prev = 1;
    in_ser = 1;
    @(posedge inclk);
    if (interim !== 0 || clk_o !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule