`timescale 1ns/1ps

module tb_four_mux;

  // Inputs
  reg in1;
  reg in2;
  reg in3;
  reg in4;
  reg s1;
  reg s0;

  // Output
  wire out;

  // Instantiate the Unit Under Test (UUT)
  four_mux uut (
    .in1(in1), 
    .in2(in2), 
    .in3(in3), 
    .in4(in4), 
    .s1(s1), 
    .s0(s0), 
    .out(out)
  );

  initial begin
    // Test case 1: Select in1 (s1=0, s0=0)
    in1 = 1'b1; in2 = 1'b0; in3 = 1'b0; in4 = 1'b0; s1 = 1'b0; s0 = 1'b0;
    #10;
    if (out !== in1) $display("FAIL: Test case 1 failed, expected %b, got %b", in1, out);

    // Test case 2: Select in2 (s1=0, s0=1)
    in1 = 1'b0; in2 = 1'b1; in3 = 1'b0; in4 = 1'b0; s1 = 1'b0; s0 = 1'b1;
    #10;
    if (out !== in2) $display("FAIL: Test case 2 failed, expected %b, got %b", in2, out);

    // Test case 3: Select in3 (s1=1, s0=0)
    in1 = 1'b0; in2 = 1'b0; in3 = 1'b1; in4 = 1'b0; s1 = 1'b1; s0 = 1'b0;
    #10;
    if (out !== in3) $display("FAIL: Test case 3 failed, expected %b, got %b", in3, out);

    // Test case 4: Select in4 (s1=1, s0=1)
    in1 = 1'b0; in2 = 1'b0; in3 = 1'b0; in4 = 1'b1; s1 = 1'b1; s0 = 1'b1;
    #10;
    if (out !== in4) $display("FAIL: Test case 4 failed, expected %b, got %b", in4, out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule