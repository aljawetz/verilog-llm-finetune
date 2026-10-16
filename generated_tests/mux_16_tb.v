`timescale 1ns/1ps

module tb_mux;

  reg [7:0] a;
  reg [7:0] b;
  reg sel;
  wire [7:0] out;

  // Instantiate the module under test (uut)
  mux uut (
    .a(a),
    .b(b),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: sel = 1, expect out = a
    a = 8'hAA; // 10101010
    b = 8'h55; // 01010101
    sel = 1'b1;
    #10;
    if (out !== a) begin
      $display("FAIL: Test case 1 failed, expected out = %h, got out = %h", a, out);
      $finish;
    end

    // Test case 2: sel = 0, expect out = b
    sel = 1'b0;
    #10;
    if (out !== b) begin
      $display("FAIL: Test case 2 failed, expected out = %h, got out = %h", b, out);
      $finish;
    end

    // Test case 3: sel = 1, expect out = a again
    sel = 1'b1;
    #10;
    if (out !== a) begin
      $display("FAIL: Test case 3 failed, expected out = %h, got out = %h", a, out);
      $finish;
    end

    // Test case 4: sel = 0, expect out = b again
    sel = 1'b0;
    #10;
    if (out !== b) begin
      $display("FAIL: Test case 4 failed, expected out = %h, got out = %h", b, out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule