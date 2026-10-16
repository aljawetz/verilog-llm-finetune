`timescale 1ns/1ps

module tb_mux_2x1_Nbit;

  parameter N = 3;
  reg [N-1:0] w0;
  reg [N-1:0] w1;
  reg s;
  wire [N-1:0] o;

  // Instantiate the module under test (uut)
  mux_2x1_Nbit #(N) uut (
    .w0(w0),
    .w1(w1),
    .s(s),
    .o(o)
  );

  initial begin
    // Test sequence
    // Test case 1: Select w0
    w0 = 3'b000; w1 = 3'b111; s = 0; #10;
    if (o !== w0) begin
      $display("FAIL: Test case 1 failed, expected %b but got %b", w0, o);
      $finish;
    end

    // Test case 2: Select w1
    w0 = 3'b000; w1 = 3'b111; s = 1; #10;
    if (o !== w1) begin
      $display("FAIL: Test case 2 failed, expected %b but got %b", w1, o);
      $finish;
    end

    // Test case 3: Different values for w0 and w1
    w0 = 3'b101; w1 = 3'b010; s = 0; #10;
    if (o !== w0) begin
      $display("FAIL: Test case 3 failed, expected %b but got %b", w0, o);
      $finish;
    end

    // Test case 4: Different values for w0 and w1
    w0 = 3'b101; w1 = 3'b010; s = 1; #10;
    if (o !== w1) begin
      $display("FAIL: Test case 4 failed, expected %b but got %b", w1, o);
      $finish;
    end

    // Test case 5: Edge case with all zeros
    w0 = 3'b000; w1 = 3'b000; s = 0; #10;
    if (o !== w0) begin
      $display("FAIL: Test case 5 failed, expected %b but got %b", w0, o);
      $finish;
    end

    // Test case 6: Edge case with all ones
    w0 = 3'b111; w1 = 3'b111; s = 1; #10;
    if (o !== w1) begin
      $display("FAIL: Test case 6 failed, expected %b but got %b", w1, o);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule