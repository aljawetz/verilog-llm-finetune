`timescale 1ns/1ps

module tb_CMP_Unit;

  reg [15:0] A;
  reg [15:0] B;
  reg [3:0] ALU_FUN;
  reg clock;
  reg CMP_enble;
  reg rest;
  wire CMP_flag;
  wire [15:0] CMP_OUT;

  // Instantiate the module under test
  CMP_Unit uut (
    .A(A),
    .B(B),
    .ALU_FUN(ALU_FUN),
    .clock(clock),
    .CMP_enble(CMP_enble),
    .rest(rest),
    .CMP_flag(CMP_flag),
    .CMP_OUT(CMP_OUT)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rest = 0;
    CMP_enble = 0;
    A = 0;
    B = 0;
    ALU_FUN = 0;

    // Release reset
    #10;
    rest = 1;

    // Test case 1: A = B, ALU_FUN = 01
    A = 16'hAAAA;
    B = 16'hAAAA;
    ALU_FUN = 4'b0001; // Check equality
    CMP_enble = 1;
    #10;
    if (CMP_flag !== 1 || CMP_OUT !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: A > B, ALU_FUN = 10
    A = 16'hAAAA;
    B = 16'h5555;
    ALU_FUN = 4'b0010; // Check greater than
    #10;
    if (CMP_flag !== 1 || CMP_OUT !== 2) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: A < B, ALU_FUN = 11
    A = 16'h5555;
    B = 16'hAAAA;
    ALU_FUN = 4'b0011; // Check less than
    #10;
    if (CMP_flag !== 1 || CMP_OUT !== 3) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: CMP_enble = 0
    CMP_enble = 0;
    #10;
    if (CMP_flag !== 0 || CMP_OUT !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Reset functionality
    rest = 0;
    #10;
    if (CMP_flag !== 0 || CMP_OUT !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end
    rest = 1;

    // Finalize
    $display("PASS");
    $finish;
  end

endmodule