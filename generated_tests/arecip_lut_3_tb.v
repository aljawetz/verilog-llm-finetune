`timescale 1ns/1ps

module tb_arecip_lut;

  reg [6:0] b_i;
  wire [8:0] r_o;

  // Instantiate the module under test
  arecip_lut uut (
    .b_i(b_i),
    .r_o(r_o)
  );

  initial begin
    // Test cases
    // Check for input 0
    b_i = 7'd0; #10;
    if (r_o !== 9'd508) begin
      $display("FAIL: Expected r_o = 508 for b_i = 0, got r_o = %d", r_o);
      $finish;
    end

    // Check for input 1
    b_i = 7'd1; #10;
    if (r_o !== 9'd500) begin
      $display("FAIL: Expected r_o = 500 for b_i = 1, got r_o = %d", r_o);
      $finish;
    end

    // Check for input 2
    b_i = 7'd2; #10;
    if (r_o !== 9'd492) begin
      $display("FAIL: Expected r_o = 492 for b_i = 2, got r_o = %d", r_o);
      $finish;
    end

    // Check for input 63 (maximum valid input)
    b_i = 7'd63; #10;
    if (r_o !== 9'd172) begin
      $display("FAIL: Expected r_o = 172 for b_i = 63, got r_o = %d", r_o);
      $finish;
    end

    // Check for input 126 (maximum valid input)
    b_i = 7'd126; #10;
    if (r_o !== 9'd3) begin
      $display("FAIL: Expected r_o = 3 for b_i = 126, got r_o = %d", r_o);
      $finish;
    end

    // Check for input 127 (out of range)
    b_i = 7'd127; #10;
    if (r_o !== 9'd1) begin
      $display("FAIL: Expected r_o = 1 for b_i = 127, got r_o = %d", r_o);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule