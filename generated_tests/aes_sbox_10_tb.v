`timescale 1ns/1ps

module tb_aes_sbox;

  reg [7:0] a;
  wire [7:0] d;

  // Instantiate the module under test (uut)
  aes_sbox uut (
    .a(a),
    .d(d)
  );

  initial begin
    // Test cases
    a = 8'h00; #10; if (d !== 8'h63) $display("FAIL: Input 0x00 expected 0x63, got %h", d);
    a = 8'h01; #10; if (d !== 8'h7c) $display("FAIL: Input 0x01 expected 0x7c, got %h", d);
    a = 8'h02; #10; if (d !== 8'h77) $display("FAIL: Input 0x02 expected 0x77, got %h", d);
    a = 8'h03; #10; if (d !== 8'h7b) $display("FAIL: Input 0x03 expected 0x7b, got %h", d);
    a = 8'h04; #10; if (d !== 8'hf2) $display("FAIL: Input 0x04 expected 0xf2, got %h", d);
    a = 8'h05; #10; if (d !== 8'h6b) $display("FAIL: Input 0x05 expected 0x6b, got %h", d);
    a = 8'h0f; #10; if (d !== 8'h76) $display("FAIL: Input 0x0f expected 0x76, got %h", d);
    a = 8'hff; #10; if (d !== 8'h16) $display("FAIL: Input 0xff expected 0x16, got %h", d);
    a = 8'h80; #10; if (d !== 8'hcd) $display("FAIL: Input 0x80 expected 0xcd, got %h", d);
    a = 8'h7e; #10; if (d !== 8'h3d) $display("FAIL: Input 0x7e expected 0x3d, got %h", d);
    a = 8'h3c; #10; if (d !== 8'h9f) $display("FAIL: Input 0x3c expected 0x9f, got %h", d);
    
    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule