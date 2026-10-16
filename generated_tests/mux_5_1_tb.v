`timescale 1ns/1ps

module tb_mux_5;

  reg [4:0] a;
  reg [4:0] b;
  reg sel;
  wire [4:0] out;

  // Instantiate the module under test (uut)
  mux_5 uut (
    .a(a),
    .b(b),
    .sel(sel),
    .out(out)
  );

  initial begin
    // Test case 1: sel = 1, expect out = a
    a = 5'b10101; 
    b = 5'b01010; 
    sel = 1'b1; 
    #10;
    if (out !== a) begin
      $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", a, out);
      $finish;
    end

    // Test case 2: sel = 0, expect out = b
    a = 5'b10101; 
    b = 5'b01010; 
    sel = 1'b0; 
    #10;
    if (out !== b) begin
      $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", b, out);
      $finish;
    end

    // Test case 3: sel = 1, different values
    a = 5'b11111; 
    b = 5'b00000; 
    sel = 1'b1; 
    #10;
    if (out !== a) begin
      $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", a, out);
      $finish;
    end

    // Test case 4: sel = 0, different values
    a = 5'b11111; 
    b = 5'b00000; 
    sel = 1'b0; 
    #10;
    if (out !== b) begin
      $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", b, out);
      $finish;
    end

    // Test case 5: sel = 1, edge case
    a = 5'b00001; 
    b = 5'b11110; 
    sel = 1'b1; 
    #10;
    if (out !== a) begin
      $display("FAIL: Test case 5 failed, expected out = %b, got out = %b", a, out);
      $finish;
    end

    // Test case 6: sel = 0, edge case
    a = 5'b00001; 
    b = 5'b11110; 
    sel = 1'b0; 
    #10;
    if (out !== b) begin
      $display("FAIL: Test case 6 failed, expected out = %b, got out = %b", b, out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule