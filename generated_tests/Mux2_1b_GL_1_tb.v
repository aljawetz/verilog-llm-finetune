`timescale 1ns/1ps

module tb_Mux2_1b_GL;

  // Inputs
  reg in0;
  reg in1;
  reg sel;

  // Output
  wire out;

  // Instantiate the Unit Under Test (UUT)
  Mux2_1b_GL uut (
    .in0(in0),
    .in1(in1),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: sel = 0, expect out = in0
    in0 = 1'b0; in1 = 1'b1; sel = 1'b0;
    #10;
    if (out !== in0) begin
      $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", in0, out);
      $finish;
    end

    // Test case 2: sel = 1, expect out = in1
    in0 = 1'b0; in1 = 1'b1; sel = 1'b1;
    #10;
    if (out !== in1) begin
      $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", in1, out);
      $finish;
    end

    // Test case 3: sel = 0, in0 = 1, expect out = in0
    in0 = 1'b1; in1 = 1'b0; sel = 1'b0;
    #10;
    if (out !== in0) begin
      $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", in0, out);
      $finish;
    end

    // Test case 4: sel = 1, in1 = 1, expect out = in1
    in0 = 1'b0; in1 = 1'b1; sel = 1'b1;
    #10;
    if (out !== in1) begin
      $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", in1, out);
      $finish;
    end

    // Test case 5: sel = 0, in0 = 0, expect out = in0
    in0 = 1'b0; in1 = 1'b0; sel = 1'b0;
    #10;
    if (out !== in0) begin
      $display("FAIL: Test case 5 failed, expected out = %b, got out = %b", in0, out);
      $finish;
    end

    // Test case 6: sel = 1, in1 = 0, expect out = in1
    in0 = 1'b0; in1 = 1'b0; sel = 1'b1;
    #10;
    if (out !== in1) begin
      $display("FAIL: Test case 6 failed, expected out = %b, got out = %b", in1, out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule