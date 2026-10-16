`timescale 1ns/1ps

module tb_mux_2to1;

  parameter WIDTH = 8;
  reg [WIDTH-1:0] din;
  reg [WIDTH-1:0] d_rep;
  reg sel;
  wire [WIDTH-1:0] dout;

  // Instantiate the module under test
  mux_2to1 #(WIDTH) uut (
    .din(din),
    .d_rep(d_rep),
    .sel(sel),
    .dout(dout)
  );

  initial begin
    // Test case 1: sel = 0, expect dout = d_rep
    din = 8'hAA;      // 10101010
    d_rep = 8'h55;    // 01010101
    sel = 0;
    #10;
    if (dout !== d_rep) begin
      $display("FAIL: Test case 1 failed, expected dout = %h, got dout = %h", d_rep, dout);
      $finish;
    end

    // Test case 2: sel = 1, expect dout = din
    sel = 1;
    #10;
    if (dout !== din) begin
      $display("FAIL: Test case 2 failed, expected dout = %h, got dout = %h", din, dout);
      $finish;
    end

    // Test case 3: sel = 0, different values
    din = 8'hFF;      // 11111111
    d_rep = 8'h00;    // 00000000
    sel = 0;
    #10;
    if (dout !== d_rep) begin
      $display("FAIL: Test case 3 failed, expected dout = %h, got dout = %h", d_rep, dout);
      $finish;
    end

    // Test case 4: sel = 1, different values
    sel = 1;
    #10;
    if (dout !== din) begin
      $display("FAIL: Test case 4 failed, expected dout = %h, got dout = %h", din, dout);
      $finish;
    end

    // Test case 5: sel = 0, edge case with zeros
    din = 8'h00;      // 00000000
    d_rep = 8'h00;    // 00000000
    sel = 0;
    #10;
    if (dout !== d_rep) begin
      $display("FAIL: Test case 5 failed, expected dout = %h, got dout = %h", d_rep, dout);
      $finish;
    end

    // Test case 6: sel = 1, edge case with zeros
    sel = 1;
    #10;
    if (dout !== din) begin
      $display("FAIL: Test case 6 failed, expected dout = %h, got dout = %h", din, dout);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule