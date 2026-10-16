`timescale 1ns/1ps

module tb_gost89_sbox;

  reg [63:0] sbox;
  reg [3:0] in;
  wire [3:0] out;

  // Instantiate the module under test
  gost89_sbox uut (
    .sbox(sbox),
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: Check all outputs for a specific sbox value
    sbox = 64'h0123456789abcdef; // Example S-box
    in = 4'h0; #10; if (out !== 4'h0) $display("FAIL: Expected 0x0 for in=0x0, got %h", out);
    in = 4'h1; #10; if (out !== 4'h1) $display("FAIL: Expected 0x1 for in=0x1, got %h", out);
    in = 4'h2; #10; if (out !== 4'h2) $display("FAIL: Expected 0x2 for in=0x2, got %h", out);
    in = 4'h3; #10; if (out !== 4'h3) $display("FAIL: Expected 0x3 for in=0x3, got %h", out);
    in = 4'h4; #10; if (out !== 4'h4) $display("FAIL: Expected 0x4 for in=0x4, got %h", out);
    in = 4'h5; #10; if (out !== 4'h5) $display("FAIL: Expected 0x5 for in=0x5, got %h", out);
    in = 4'h6; #10; if (out !== 4'h6) $display("FAIL: Expected 0x6 for in=0x6, got %h", out);
    in = 4'h7; #10; if (out !== 4'h7) $display("FAIL: Expected 0x7 for in=0x7, got %h", out);
    in = 4'h8; #10; if (out !== 4'h8) $display("FAIL: Expected 0x8 for in=0x8, got %h", out);
    in = 4'h9; #10; if (out !== 4'h9) $display("FAIL: Expected 0x9 for in=0x9, got %h", out);
    in = 4'hA; #10; if (out !== 4'hA) $display("FAIL: Expected 0xA for in=0xA, got %h", out);
    in = 4'hB; #10; if (out !== 4'hB) $display("FAIL: Expected 0xB for in=0xB, got %h", out);
    in = 4'hC; #10; if (out !== 4'hC) $display("FAIL: Expected 0xC for in=0xC, got %h", out);
    in = 4'hD; #10; if (out !== 4'hD) $display("FAIL: Expected 0xD for in=0xD, got %h", out);
    in = 4'hE; #10; if (out !== 4'hE) $display("FAIL: Expected 0xE for in=0xE, got %h", out);
    in = 4'hF; #10; if (out !== 4'hF) $display("FAIL: Expected 0xF for in=0xF, got %h", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule