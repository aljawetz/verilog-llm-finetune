`timescale 1ns/1ps

module tb_arecip_lut;

  reg [6:0] b_i;
  wire [8:0] r_o;

  // Instantiate the Unit Under Test (UUT)
  arecip_lut uut (
    .b_i(b_i),
    .r_o(r_o)
  );

  initial begin
    // Test cases
    b_i = 7'd0; #10;
    if (r_o !== 9'd508) $display("FAIL: Expected r_o = 508 for b_i = 0, got %d", r_o);

    b_i = 7'd1; #10;
    if (r_o !== 9'd500) $display("FAIL: Expected r_o = 500 for b_i = 1, got %d", r_o);

    b_i = 7'd2; #10;
    if (r_o !== 9'd492) $display("FAIL: Expected r_o = 492 for b_i = 2, got %d", r_o);

    b_i = 7'd63; #10;
    if (r_o !== 9'd172) $display("FAIL: Expected r_o = 172 for b_i = 63, got %d", r_o);

    b_i = 7'd126; #10;
    if (r_o !== 9'd3) $display("FAIL: Expected r_o = 3 for b_i = 126, got %d", r_o);

    b_i = 7'd127; #10; // Testing default case
    if (r_o !== 9'd1) $display("FAIL: Expected r_o = 1 for b_i = 127, got %d", r_o);

    $display("PASS");
    $finish;
  end

endmodule