`timescale 1ns/1ps

module tb_control;

  reg i_clk;
  reg i_rst_n;
  reg i_valid;
  wire o_valid;

  // Instantiate the module under test (uut)
  control uut (
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_valid(i_valid),
    .o_valid(o_valid)
  );

  // Clock generation
  initial begin
    i_clk = 0;
    forever #5 i_clk = ~i_clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    i_rst_n = 0;
    i_valid = 0;

    // Apply reset
    #10;
    i_rst_n = 1;

    // Test case 1: Valid input to start the FSM
    #10;
    i_valid = 1; // Assert valid input
    #10;
    i_valid = 0; // Deassert valid input

    // Wait for a few clock cycles to observe the output
    #100;

    // Check output validity for the first few cycles
    if (uut.row < 28 && uut.column == 0 && o_valid !== 1) begin
      $display("FAIL: Expected o_valid to be 1 when row < 28 and column == 0");
      $finish;
    end

    // Continue to test the behavior as the FSM progresses
    #10;
    if (uut.row == 28 && uut.column == 0 && o_valid !== 0) begin
      $display("FAIL: Expected o_valid to be 0 when row == 28 and column == 0");
      $finish;
    end

    // Test case 2: Continue to traverse the grid
    #100;

    // Check output validity when row and column are at the edge
    if (uut.row == 32 && uut.column == 0 && o_valid !== 0) begin
      $display("FAIL: Expected o_valid to be 0 when row == 32 and column == 0");
      $finish;
    end

    // Test case 3: Check behavior when column is incremented
    #10;
    if (uut.row == 0 && uut.column == 1 && o_valid !== 0) begin
      $display("FAIL: Expected o_valid to be 0 when transitioning to column 1");
      $finish;
    end

    // Final check after all transitions
    #100;
    if (uut.row == 0 && uut.column == 32 && o_valid !== 0) begin
      $display("FAIL: Expected o_valid to be 0 when row == 0 and column == 32");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule