`timescale 1ns/1ps

module tb_MAR;
  reg LM;
  reg clk;
  reg clr;
  reg [3:0] MAR_in;
  wire [3:0] MAR_out;

  // Instantiate the module under test
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

    // Test 1: Check reset functionality
    clr = 1; // Assert clear
    #10; // Wait for one clock cycle
    if (MAR_out !== 4'b0000) begin
      $display("FAIL: Reset did not set MAR_out to 0");
      $finish;
    end
    clr = 0; // Deassert clear

    // Test 2: Load value into MAR
    MAR_in = 4'b1010; // Input value
    LM = 1; // Assert load
    #10; // Wait for one clock cycle
    if (MAR_out !== 4'b1010) begin
      $display("FAIL: MAR_out did not load the input value");
      $finish;
    end
    LM = 0; // Deassert load

    // Test 3: Hold current value
    #10; // Wait for one clock cycle
    if (MAR_out !== 4'b1010) begin
      $display("FAIL: MAR_out changed when it should hold the value");
      $finish;
    end

    // Test 4: Clear again
    clr = 1; // Assert clear
    #10; // Wait for one clock cycle
    if (MAR_out !== 4'b0000) begin
      $display("FAIL: Reset did not set MAR_out to 0");
      $finish;
    end
    clr = 0; // Deassert clear

    // Test 5: Load another value
    MAR_in = 4'b1111; // New input value
    LM = 1; // Assert load
    #10; // Wait for one clock cycle
    if (MAR_out !== 4'b1111) begin
      $display("FAIL: MAR_out did not load the new input value");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule