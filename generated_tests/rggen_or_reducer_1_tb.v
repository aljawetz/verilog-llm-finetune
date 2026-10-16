`timescale 1ns/1ps

module tb_rggen_or_reducer;

  reg [1:0] i_data;
  wire o_result;

  rggen_or_reducer #(
    .WIDTH(1),
    .N(2)
  ) uut (
    .i_data(i_data),
    .o_result(o_result)
  );

  initial begin
    // Test case 1: i_data = 2'b00, expect o_result = 1'b0
    i_data = 2'b00;
    #10;
    if (o_result !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected 0 but got %b", o_result);
      $finish;
    end

    // Test case 2: i_data = 2'b01, expect o_result = 1'b1
    i_data = 2'b01;
    #10;
    if (o_result !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected 1 but got %b", o_result);
      $finish;
    end

    // Test case 3: i_data = 2'b10, expect o_result = 1'b1
    i_data = 2'b10;
    #10;
    if (o_result !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected 1 but got %b", o_result);
      $finish;
    end

    // Test case 4: i_data = 2'b11, expect o_result = 1'b1
    i_data = 2'b11;
    #10;
    if (o_result !== 1'b1) begin
      $display("FAIL: Test case 4 failed, expected 1 but got %b", o_result);
      $finish;
    end

    // Test case 5: i_data = 2'b00, expect o_result = 1'b0 again
    i_data = 2'b00;
    #10;
    if (o_result !== 1'b0) begin
      $display("FAIL: Test case 5 failed, expected 0 but got %b", o_result);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule