`timescale 1ns/1ps

module tb_mux_2_1;

  // Inputs
  reg in_0;
  reg in_1;
  reg sel;

  // Output
  wire out;

  // Instantiate the Unit Under Test (UUT)
  mux_2_1 uut (
    .in_0(in_0), 
    .in_1(in_1), 
    .sel(sel), 
    .out(out)
  );

  initial begin
    // Test case 1: sel = 0, expect out = in_0
    in_0 = 1'b0; in_1 = 1'b1; sel = 1'b0;
    #10;
    if (out !== in_0) begin
      $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", in_0, out);
      $finish;
    end

    // Test case 2: sel = 1, expect out = in_1
    in_0 = 1'b0; in_1 = 1'b1; sel = 1'b1;
    #10;
    if (out !== in_1) begin
      $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", in_1, out);
      $finish;
    end

    // Test case 3: sel = 0, expect out = in_0
    in_0 = 1'b1; in_1 = 1'b0; sel = 1'b0;
    #10;
    if (out !== in_0) begin
      $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", in_0, out);
      $finish;
    end

    // Test case 4: sel = 1, expect out = in_1
    in_0 = 1'b1; in_1 = 1'b0; sel = 1'b1;
    #10;
    if (out !== in_1) begin
      $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", in_1, out);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule