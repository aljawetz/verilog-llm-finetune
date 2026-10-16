`timescale 1ns/1ps

module tb_mux;

  parameter N = 8;
  reg [N-1:0] a;
  reg [N-1:0] b;
  reg sel;
  wire [N-1:0] out;

  // Instantiate the module under test
  mux #(N) uut (
    .a(a),
    .b(b),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: sel = 0, expect out = a
    a = 8'hAA; // 10101010
    b = 8'h55; // 01010101
    sel = 0;
    #10;
    if (out !== a) begin
      $display("FAIL: Test case 1 failed, expected out = %h, got out = %h", a, out);
      $finish;
    end

    // Test case 2: sel = 1, expect out = b
    sel = 1;
    #10;
    if (out !== b) begin
      $display("FAIL: Test case 2 failed, expected out = %h, got out = %h", b, out);
      $finish;
    end

    // Test case 3: Change inputs
    a = 8'hFF; // 11111111
    b = 8'h00; // 00000000
    sel = 0;
    #10;
    if (out !== a) begin
      $display("FAIL: Test case 3 failed, expected out = %h, got out = %h", a, out);
      $finish;
    end

    sel = 1;
    #10;
    if (out !== b) begin
      $display("FAIL: Test case 4 failed, expected out = %h, got out = %h", b, out);
      $finish;
    end

    // Test case 5: Random values
    a = 8'h1C; // 00011100
    b = 8'hE3; // 11100011
    sel = 0;
    #10;
    if (out !== a) begin
      $display("FAIL: Test case 5 failed, expected out = %h, got out = %h", a, out);
      $finish;
    end

    sel = 1;
    #10;
    if (out !== b) begin
      $display("FAIL: Test case 6 failed, expected out = %h, got out = %h", b, out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule