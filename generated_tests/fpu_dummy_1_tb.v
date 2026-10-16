`timescale 1ns/1ps

module tb_fpu_dummy;

  // Inputs
  reg [31:0] fpain;
  reg [31:0] fpbin;
  reg [7:0] fpop;
  reg fpkill;
  reg fphold;
  reg reset_l;
  reg test_mode;
  reg powerdown;
  reg clk;
  reg sin;
  reg sm;
  reg fpop_valid;

  // Outputs
  wire [31:0] fpout;
  wire fpbusyn;
  wire so;

  // Instantiate the Unit Under Test (UUT)
  fpu_dummy uut (
    .fpain(fpain),
    .fpbin(fpbin),
    .fpop(fpop),
    .fpkill(fpkill),
    .fphold(fphold),
    .reset_l(reset_l),
    .test_mode(test_mode),
    .powerdown(powerdown),
    .clk(clk),
    .sin(sin),
    .sm(sm),
    .fpop_valid(fpop_valid),
    .fpout(fpout),
    .fpbusyn(fpbusyn),
    .so(so)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    fpain = 32'h00000000;
    fpbin = 32'h00000000;
    fpop = 8'h00;
    fpkill = 0;
    fphold = 0;
    reset_l = 0;
    test_mode = 0;
    powerdown = 0;
    sin = 0;
    sm = 0;
    fpop_valid = 0;

    // Apply reset
    #10 reset_l = 1; // Release reset
    #10;

    // Check output when FPU is active
    if (fpout !== 32'h00000000) begin
      $display("FAIL: Output should be 0 after reset");
      $finish;
    end

    if (fpbusyn !== 1'b1) begin
      $display("FAIL: fpbusyn should be 1");
      $finish;
    end

    // Test with different inputs
    fpain = 32'h12345678;
    fpbin = 32'h9ABCDEF0;
    fpop = 8'h01;
    fpop_valid = 1;

    #10;

    // Check output remains constant
    if (fpout !== 32'h00000000) begin
      $display("FAIL: Output should remain 0 regardless of inputs");
      $finish;
    end

    if (fpbusyn !== 1'b1) begin
      $display("FAIL: fpbusyn should still be 1");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule