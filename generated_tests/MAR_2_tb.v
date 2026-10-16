`timescale 1ns/1ps

module tb_MAR;

  reg LM;
  reg clk;
  reg clr;
  reg [3:0] MAR_in;
  wire [3:0] MAR_out;

  // Instantiate the module under test (uut)
  MAR uut (
    .LM(LM),
    .clk(clk),
    .clr(clr),
    .MAR_in(MAR_in),
    .MAR_out(MAR_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    LM = 0;
    clr = 0;
    MAR_in = 4'b0000;

    // Test 1: Clear the MAR
    clr = 1; #10; // Assert clear
    clr = 0; #10; // Deassert clear
    if (MAR_out !== 4'b0000) begin
      $display("FAIL: MAR_out should be 0 after clear");
      $finish;
    end

    // Test 2: Load value into MAR
    LM = 1; MAR_in = 4'b1010; #10; // Load 1010
    LM = 0; #10; // Wait
    if (MAR_out !== 4'b1010) begin
      $display("FAIL: MAR_out should be 1010 after loading");
      $finish;
    end

    // Test 3: Load another value into MAR
    LM = 1; MAR_in = 4'b1100; #10; // Load 1100
    LM = 0; #10; // Wait
    if (MAR_out !== 4'b1100) begin
      $display("FAIL: MAR_out should be 1100 after loading");
      $finish;
    end

    // Test 4: Ensure MAR does not change without LM
    #10; // Wait
    if (MAR_out !== 4'b1100) begin
      $display("FAIL: MAR_out should remain 1100 when LM is low");
      $finish;
    end

    // Test 5: Clear again
    clr = 1; #10; // Assert clear
    clr = 0; #10; // Deassert clear
    if (MAR_out !== 4'b0000) begin
      $display("FAIL: MAR_out should be 0 after clear");
      $finish;
    end

    // Test 6: Load value into MAR again
    LM = 1; MAR_in = 4'b1111; #10; // Load 1111
    LM = 0; #10; // Wait
    if (MAR_out !== 4'b1111) begin
      $display("FAIL: MAR_out should be 1111 after loading");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule