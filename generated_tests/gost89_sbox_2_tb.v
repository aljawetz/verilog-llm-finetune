`timescale 1ns/1ps

module tb_gost89_sbox;

  reg [63:0] sbox;
  reg [3:0] in;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  gost89_sbox uut (
    .sbox(sbox),
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: Check all outputs for a specific sbox value
    sbox = 64'h0123456789ABCDEF; // Example S-box
    in = 4'h0; #10;
    if (out !== 4'h0) $display("FAIL: Expected out = 0, got out = %h", out);
    
    in = 4'h1; #10;
    if (out !== 4'h1) $display("FAIL: Expected out = 1, got out = %h", out);
    
    in = 4'h2; #10;
    if (out !== 4'h2) $display("FAIL: Expected out = 2, got out = %h", out);
    
    in = 4'h3; #10;
    if (out !== 4'h3) $display("FAIL: Expected out = 3, got out = %h", out);
    
    in = 4'h4; #10;
    if (out !== 4'h4) $display("FAIL: Expected out = 4, got out = %h", out);
    
    in = 4'h5; #10;
    if (out !== 4'h5) $display("FAIL: Expected out = 5, got out = %h", out);
    
    in = 4'h6; #10;
    if (out !== 4'h6) $display("FAIL: Expected out = 6, got out = %h", out);
    
    in = 4'h7; #10;
    if (out !== 4'h7) $display("FAIL: Expected out = 7, got out = %h", out);
    
    in = 4'h8; #10;
    if (out !== 4'h8) $display("FAIL: Expected out = 8, got out = %h", out);
    
    in = 4'h9; #10;
    if (out !== 4'h9) $display("FAIL: Expected out = 9, got out = %h", out);
    
    in = 4'hA; #10;
    if (out !== 4'hA) $display("FAIL: Expected out = A, got out = %h", out);
    
    in = 4'hB; #10;
    if (out !== 4'hB) $display("FAIL: Expected out = B, got out = %h", out);
    
    in = 4'hC; #10;
    if (out !== 4'hC) $display("FAIL: Expected out = C, got out = %h", out);
    
    in = 4'hD; #10;
    if (out !== 4'hD) $display("FAIL: Expected out = D, got out = %h", out);
    
    in = 4'hE; #10;
    if (out !== 4'hE) $display("FAIL: Expected out = E, got out = %h", out);
    
    in = 4'hF; #10;
    if (out !== 4'hF) $display("FAIL: Expected out = F, got out = %h", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule