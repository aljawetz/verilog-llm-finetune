`timescale 1ns/1ps

module tb_ALU_RTL;

  reg [15:0] A;
  reg [15:0] B;
  reg [3:0] ALU_FUNC;
  reg CLK;
  wire [15:0] ALU_OUT;
  wire Arith_flag;
  wire Logic_flag;
  wire CMP_flag;
  wire Shift_flag;

  // Instantiate the ALU_RTL module
  ALU_RTL uut (
    .A(A),
    .B(B),
    .ALU_FUNC(ALU_FUNC),
    .CLK(CLK),
    .ALU_OUT(ALU_OUT),
    .Arith_flag(Arith_flag),
    .Logic_flag(Logic_flag),
    .CMP_flag(CMP_flag),
    .Shift_flag(Shift_flag)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // 100MHz clock
  end

  // Test sequence
  initial begin
    // Test case 1: Addition
    A = 16'h0003; B = 16'h0002; ALU_FUNC = 4'b0000; #10;
    if (ALU_OUT !== 16'h0005 || Arith_flag !== 1) begin
      $display("FAIL: Addition test failed");
      $finish;
    end

    // Test case 2: Subtraction
    A = 16'h0005; B = 16'h0002; ALU_FUNC = 4'b0001; #10;
    if (ALU_OUT !== 16'h0003 || Arith_flag !== 1) begin
      $display("FAIL: Subtraction test failed");
      $finish;
    end

    // Test case 3: Multiplication
    A = 16'h0002; B = 16'h0003; ALU_FUNC = 4'b0010; #10;
    if (ALU_OUT !== 16'h0006 || Arith_flag !== 1) begin
      $display("FAIL: Multiplication test failed");
      $finish;
    end

    // Test case 4: Division
    A = 16'h0006; B = 16'h0002; ALU_FUNC = 4'b0011; #10;
    if (ALU_OUT !== 16'h0003 || Arith_flag !== 1) begin
      $display("FAIL: Division test failed");
      $finish;
    end

    // Test case 5: AND
    A = 16'hFF00; B = 16'h00FF; ALU_FUNC = 4'b0100; #10;
    if (ALU_OUT !== 16'h0000 || Logic_flag !== 1) begin
      $display("FAIL: AND test failed");
      $finish;
    end

    // Test case 6: OR
    A = 16'hFF00; B = 16'h00FF; ALU_FUNC = 4'b0101; #10;
    if (ALU_OUT !== 16'hFFFF || Logic_flag !== 1) begin
      $display("FAIL: OR test failed");
      $finish;
    end

    // Test case 7: Comparison Equal
    A = 16'h0001; B = 16'h0001; ALU_FUNC = 4'b1010; #10;
    if (ALU_OUT !== 16'h0001 || CMP_flag !== 1) begin
      $display("FAIL: Comparison Equal test failed");
      $finish;
    end

    // Test case 8: Comparison Greater
    A = 16'h0002; B = 16'h0001; ALU_FUNC = 4'b1011; #10;
    if (ALU_OUT !== 16'h0002 || CMP_flag !== 1) begin
      $display("FAIL: Comparison Greater test failed");
      $finish;
    end

    // Test case 9: Shift Right
    A = 16'h0002; ALU_FUNC = 4'b1101; #10;
    if (ALU_OUT !== 16'h0001 || Shift_flag !== 1) begin
      $display("FAIL: Shift Right test failed");
      $finish;
    end

    // Test case 10: Shift Left
    A = 16'h0001; ALU_FUNC = 4'b1110; #10;
    if (ALU_OUT !== 16'h0002 || Shift_flag !== 1) begin
      $display("FAIL: Shift Left test failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule