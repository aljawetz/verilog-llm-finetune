`timescale 1ns/1ps

module tb_mux_2x1;

  reg [3:0] a;
  reg [3:0] b;
  reg sel;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  mux_2x1 uut (
    .a(a),
    .b(b),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: sel = 0, expect out = a
    a = 4'b1010; 
    b = 4'b0101; 
    sel = 0; 
    #10;
    if (out !== a) begin
      $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", a, out);
      $finish;
    end

    // Test case 2: sel = 1, expect out = b
    sel = 1; 
    #10;
    if (out !== b) begin
      $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", b, out);
      $finish;
    end

    // Test case 3: sel = 0, different values
    a = 4'b1111; 
    b = 4'b0000; 
    sel = 0; 
    #10;
    if (out !== a) begin
      $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", a, out);
      $finish;
    end

    // Test case 4: sel = 1, different values
    sel = 1; 
    #10;
    if (out !== b) begin
      $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", b, out);
      $finish;
    end

    // Test case 5: sel = 0, edge case
    a = 4'b0000; 
    b = 4'b1111; 
    sel = 0; 
    #10;
    if (out !== a) begin
      $display("FAIL: Test case 5 failed, expected out = %b, got out = %b", a, out);
      $finish;
    end

    // Test case 6: sel = 1, edge case
    sel = 1; 
    #10;
    if (out !== b) begin
      $display("FAIL: Test case 6 failed, expected out = %b, got out = %b", b, out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule