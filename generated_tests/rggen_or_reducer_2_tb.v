`timescale 1ns/1ps

module tb_rggen_or_reducer;

  parameter WIDTH = 1;
  parameter N = 2;

  reg [WIDTH*N-1:0] i_data;
  wire [WIDTH-1:0] o_result;

  rggen_or_reducer #(
    .WIDTH(WIDTH),
    .N(N)
  ) uut (
    .i_data(i_data),
    .o_result(o_result)
  );

  initial begin
    // Test case 1: All zeros
    i_data = 2'b00;
    #10;
    if (o_result !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected 0, got %b", o_result);
      $finish;
    end

    // Test case 2: One high bit
    i_data = 2'b01;
    #10;
    if (o_result !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected 1, got %b", o_result);
      $finish;
    end

    // Test case 3: Both bits high
    i_data = 2'b11;
    #10;
    if (o_result !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected 1, got %b", o_result);
      $finish;
    end

    // Test case 4: One high bit, one low bit
    i_data = 2'b10;
    #10;
    if (o_result !== 1'b1) begin
      $display("FAIL: Test case 4 failed, expected 1, got %b", o_result);
      $finish;
    end

    // Test case 5: All ones
    i_data = 2'b11;
    #10;
    if (o_result !== 1'b1) begin
      $display("FAIL: Test case 5 failed, expected 1, got %b", o_result);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule