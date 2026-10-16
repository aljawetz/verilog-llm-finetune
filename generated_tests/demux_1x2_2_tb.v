`timescale 1ns/1ps

module tb_demux_1x2;

  reg a;
  reg sel;
  wire [1:0] out;

  // Instantiate the module under test (uut)
  demux_1x2 uut (
    .a(a),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: sel = 0, a = 1
    a = 1; sel = 0; #10;
    if (out !== 2'b10) begin
      $display("FAIL: Test case 1 failed, expected out = 10, got out = %b", out);
      $finish;
    end

    // Test case 2: sel = 0, a = 0
    a = 0; sel = 0; #10;
    if (out !== 2'b00) begin
      $display("FAIL: Test case 2 failed, expected out = 00, got out = %b", out);
      $finish;
    end

    // Test case 3: sel = 1, a = 1
    a = 1; sel = 1; #10;
    if (out !== 2'b01) begin
      $display("FAIL: Test case 3 failed, expected out = 01, got out = %b", out);
      $finish;
    end

    // Test case 4: sel = 1, a = 0
    a = 0; sel = 1; #10;
    if (out !== 2'b00) begin
      $display("FAIL: Test case 4 failed, expected out = 00, got out = %b", out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule