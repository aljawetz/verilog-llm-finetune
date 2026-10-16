`timescale 1ns/1ps

module tb_four_bit_alu;

  reg [3:0] a;
  reg [3:0] b;
  reg [1:0] sel;
  wire [3:0] out;
  wire of;

  // Instantiate the module under test (uut)
  four_bit_alu uut (
    .a(a),
    .b(b),
    .out(out),
    .of(of),
    .sel(sel)
  );

  initial begin
    // Test case 1: OR operation
    a = 4'b1010; b = 4'b0101; sel = 2'b00;
    #10;
    if (out !== 4'b1111) begin
      $display("FAIL: OR operation failed");
      $finish;
    end

    // Test case 2: AND operation
    a = 4'b1010; b = 4'b0101; sel = 2'b01;
    #10;
    if (out !== 4'b0000) begin
      $display("FAIL: AND operation failed");
      $finish;
    end

    // Test case 3: Addition without overflow
    a = 4'b0011; b = 4'b0001; sel = 2'b10;
    #10;
    if (out !== 4'b0100 || of !== 1'b0) begin
      $display("FAIL: Addition without overflow failed");
      $finish;
    end

    // Test case 4: Addition with overflow
    a = 4'b1111; b = 4'b0001; sel = 2'b10;
    #10;
    if (out !== 4'b0000 || of !== 1'b1) begin
      $display("FAIL: Addition with overflow failed");
      $finish;
    end

    // Test case 5: Subtraction
    a = 4'b0100; b = 4'b0010; sel = 2'b11;
    #10;
    if (out !== 4'b0010) begin
      $display("FAIL: Subtraction failed");
      $finish;
    end

    // Test case 6: Subtraction resulting in negative (underflow)
    a = 4'b0001; b = 4'b0010; sel = 2'b11;
    #10;
    if (out !== 4'b1111) begin
      $display("FAIL: Subtraction underflow failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule