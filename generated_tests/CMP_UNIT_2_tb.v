`timescale 1ns/1ps

module tb_CMP_UNIT;

  reg [15:0] A;
  reg [15:0] B;
  reg [1:0] ALU_FUN;
  reg CLK;
  reg RST;
  reg CMP_Enable;
  wire [15:0] CMP_OUT;
  wire CMP_Flag;

  // Instantiate the unit under test (UUT)
  CMP_UNIT uut (
    .A(A),
    .B(B),
    .ALU_FUN(ALU_FUN),
    .CLK(CLK),
    .RST(RST),
    .CMP_Enable(CMP_Enable),
    .CMP_OUT(CMP_OUT),
    .CMP_Flag(CMP_Flag)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize signals
    RST = 0;
    CMP_Enable = 0;
    A = 0;
    B = 0;
    ALU_FUN = 2'b00;

    // Apply reset
    #10 RST = 1;

    // Test case 1: Equality check
    A = 16'hAAAA; B = 16'hAAAA; ALU_FUN = 2'b01; CMP_Enable = 1;
    #10;
    if (CMP_OUT !== 16'b1 || CMP_Flag !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Greater than check
    A = 16'hAAAA; B = 16'hAAAA; ALU_FUN = 2'b10; CMP_Enable = 1;
    #10;
    if (CMP_OUT !== 16'b0 || CMP_Flag !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Less than check
    A = 16'hAAAA; B = 16'hBBBB; ALU_FUN = 2'b11; CMP_Enable = 1;
    #10;
    if (CMP_OUT !== 16'b11 || CMP_Flag !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Disable comparison
    CMP_Enable = 0; A = 16'hAAAA; B = 16'hBBBB; ALU_FUN = 2'b01;
    #10;
    if (CMP_OUT !== 16'b0 || CMP_Flag !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Reset behavior
    RST = 0; 
    #10;
    if (CMP_OUT !== 16'b0 || CMP_Flag !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule