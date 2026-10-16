`timescale 1ns/1ps

module tb_demux_1x8;

  reg in;
  reg sel2, sel1, sel0;
  wire out0, out1, out2, out3, out4, out5, out6, out7;

  // Instantiate the module under test (uut)
  demux_1x8 uut (
    .in(in),
    .sel2(sel2),
    .sel1(sel1),
    .sel0(sel0),
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3),
    .out4(out4),
    .out5(out5),
    .out6(out6),
    .out7(out7)
  );

  initial begin
    // Test sequence
    in = 1'b0; sel2 = 1'b0; sel1 = 1'b0; sel0 = 1'b0; #10;
    if (out0 !== 1'b0 || out1 !== 1'b0 || out2 !== 1'b0 || out3 !== 1'b0 || out4 !== 1'b0 || out5 !== 1'b0 || out6 !== 1'b0 || out7 !== 1'b0) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    in = 1'b1; sel2 = 1'b0; sel1 = 1'b0; sel0 = 1'b0; #10;
    if (out0 !== 1'b1 || out1 !== 1'b0 || out2 !== 1'b0 || out3 !== 1'b0 || out4 !== 1'b0 || out5 !== 1'b0 || out6 !== 1'b0 || out7 !== 1'b0) begin
      $display("FAIL: Output check for sel=000 failed");
      $finish;
    end

    in = 1'b1; sel2 = 1'b0; sel1 = 1'b0; sel0 = 1'b1; #10;
    if (out0 !== 1'b0 || out1 !== 1'b1 || out2 !== 1'b0 || out3 !== 1'b0 || out4 !== 1'b0 || out5 !== 1'b0 || out6 !== 1'b0 || out7 !== 1'b0) begin
      $display("FAIL: Output check for sel=001 failed");
      $finish;
    end

    in = 1'b1; sel2 = 1'b0; sel1 = 1'b1; sel0 = 1'b0; #10;
    if (out0 !== 1'b0 || out1 !== 1'b0 || out2 !== 1'b1 || out3 !== 1'b0 || out4 !== 1'b0 || out5 !== 1'b0 || out6 !== 1'b0 || out7 !== 1'b0) begin
      $display("FAIL: Output check for sel=010 failed");
      $finish;
    end

    in = 1'b1; sel2 = 1'b0; sel1 = 1'b1; sel0 = 1'b1; #10;
    if (out0 !== 1'b0 || out1 !== 1'b0 || out2 !== 1'b0 || out3 !== 1'b1 || out4 !== 1'b0 || out5 !== 1'b0 || out6 !== 1'b0 || out7 !== 1'b0) begin
      $display("FAIL: Output check for sel=011 failed");
      $finish;
    end

    in = 1'b1; sel2 = 1'b1; sel1 = 1'b0; sel0 = 1'b0; #10;
    if (out0 !== 1'b0 || out1 !== 1'b0 || out2 !== 1'b0 || out3 !== 1'b0 || out4 !== 1'b1 || out5 !== 1'b0 || out6 !== 1'b0 || out7 !== 1'b0) begin
      $display("FAIL: Output check for sel=100 failed");
      $finish;
    end

    in = 1'b1; sel2 = 1'b1; sel1 = 1'b0; sel0 = 1'b1; #10;
    if (out0 !== 1'b0 || out1 !== 1'b0 || out2 !== 1'b0 || out3 !== 1'b0 || out4 !== 1'b0 || out5 !== 1'b1 || out6 !== 1'b0 || out7 !== 1'b0) begin
      $display("FAIL: Output check for sel=101 failed");
      $finish;
    end

    in = 1'b1; sel2 = 1'b1; sel1 = 1'b1; sel0 = 1'b0; #10;
    if (out0 !== 1'b0 || out1 !== 1'b0 || out2 !== 1'b0 || out3 !== 1'b0 || out4 !== 1'b0 || out5 !== 1'b0 || out6 !== 1'b1 || out7 !== 1'b0) begin
      $display("FAIL: Output check for sel=110 failed");
      $finish;
    end

    in = 1'b1; sel2 = 1'b1; sel1 = 1'b1; sel0 = 1'b1; #10;
    if (out0 !== 1'b0 || out1 !== 1'b0 || out2 !== 1'b0 || out3 !== 1'b0 || out4 !== 1'b0 || out5 !== 1'b0 || out6 !== 1'b0 || out7 !== 1'b1) begin
      $display("FAIL: Output check for sel=111 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule