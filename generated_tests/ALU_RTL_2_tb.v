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
    // Test addition
    A = 16'h0003; B = 16'h0002; ALU_FUNC = 4'b0000; // A + B
    #10;
    if (ALU_OUT !== 16'h0005 || Arith_flag !== 1) begin
      $display("FAIL: Addition test failed");
      $finish;
    end

    // Test subtraction
    A = 16'h0005; B = 16'h0002; ALU_FUNC = 4'b0001; // A - B
    #10;
    if (ALU_OUT !== 16'h0003 || Arith_flag !== 1) begin
      $display("FAIL: Subtraction test failed");
      $finish;
    end

    // Test multiplication
    A = 16'h0002; B = 16'h0003; ALU_FUNC = 4'b0010; // A * B
    #10;
    if (ALU_OUT !== 16'h0006 || Arith_flag !== 1) begin
      $display("FAIL: Multiplication test failed");
      $finish;
    end

    // Test division
    A = 16'h0006; B = 16'h0002; ALU_FUNC = 4'b0011; // A / B
    #10;
    if (ALU_OUT !== 16'h0003 || Arith_flag !== 1) begin
      $display("FAIL: Division test failed");
      $finish;
    end

    // Test AND
    A = 16'h000F; B = 16'h00F0; ALU_FUNC = 4'b0100; // A & B
    #10;
    if (ALU_OUT !== 16'h0000 || Logic_flag !== 1) begin
      $display("FAIL: AND test failed");
      $finish;
    end

    // Test OR
    A = 16'h000F; B = 16'h00F0; ALU_FUNC = 4'b0101; // A | B
    #10;
    if (ALU_OUT !== 16'h00FF || Logic_flag !== 1) begin
      $display("FAIL: OR test failed");
      $finish;
    end

    // Test NOT AND
    A = 16'h000F; B = 16'h00F0; ALU_FUNC = 4'b0110; // ~(A & B)
    #10;
    if (ALU_OUT !== 16'hFFFF || Logic_flag !== 1) begin
      $display("FAIL: NOT AND test failed");
      $finish;
    end

    // Test NOT OR
    A = 16'h000F; B = 16'h00F0; ALU_FUNC = 4'b0111; // ~(A | B)
    #10;
    if (ALU_OUT !== 16'hFF00 || Logic_flag !== 1) begin
      $display("FAIL: NOT OR test failed");
      $finish;
    end

    // Test XOR
    A = 16'h000F; B = 16'h00F0; ALU_FUNC = 4'b1000; // A ^ B
    #10;
    if (ALU_OUT !== 16'h00FF || Logic_flag !== 1) begin
      $display("FAIL: XOR test failed");
      $finish;
    end

    // Test comparison equal
    A = 16'h0005; B = 16'h0005; ALU_FUNC = 4'b1010; // A == B
    #10;
    if (ALU_OUT !== 16'h0001 || CMP_flag !== 1) begin
      $display("FAIL: Comparison equal test failed");
      $finish;
    end

    // Test comparison greater
    A = 16'h0006; B = 16'h0005; ALU_FUNC = 4'b1011; // A > B
    #10;
    if (ALU_OUT !== 16'h0002 || CMP_flag !== 1) begin
      $display("FAIL: Comparison greater test failed");
      $finish;
    end

    // Test comparison less
    A = 16'h0004; B = 16'h0005; ALU_FUNC = 4'b1100; // A < B
    #10;
    if (ALU_OUT !== 16'h0003 || CMP_flag !== 1) begin
      $display("FAIL: Comparison less test failed");
      $finish;
    end

    // Test right shift
    A = 16'h0004; ALU_FUNC = 4'b1101; // A >> 1
    #10;
    if (ALU_OUT !== 16'h0002 || Shift_flag !== 1) begin
      $display("FAIL: Right shift test failed");
      $finish;
    end

    // Test left shift
    A = 16'h0004; ALU_FUNC = 4'b1110; // A << 1
    #10;
    if (ALU_OUT !== 16'h0008 || Shift_flag !== 1) begin
      $display("FAIL: Left shift test failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule