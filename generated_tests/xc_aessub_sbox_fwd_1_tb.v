`timescale 1ns/1ps

module tb_xc_aessub_sbox_fwd;

  reg [7:0] in;
  wire [7:0] out;

  // Instantiate the module under test (uut)
  xc_aessub_sbox_fwd uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test vector initialization
    in = 8'h00; #10;
    if (out !== 8'h00) $display("FAIL: Expected 0x00 for input 0x00, got %h", out);

    in = 8'h01; #10;
    if (out !== 8'h01) $display("FAIL: Expected 0x01 for input 0x01, got %h", out);

    in = 8'h02; #10;
    if (out !== 8'h02) $display("FAIL: Expected 0x02 for input 0x02, got %h", out);

    in = 8'h03; #10;
    if (out !== 8'h03) $display("FAIL: Expected 0x03 for input 0x03, got %h", out);

    in = 8'hFF; #10;
    if (out !== 8'hFF) $display("FAIL: Expected 0xFF for input 0xFF, got %h", out);

    // Add more test cases as needed
    in = 8'hA5; #10; // Example input
    if (out !== 8'hA5) $display("FAIL: Expected 0xA5 for input 0xA5, got %h", out);

    in = 8'h7C; #10; // Example input
    if (out !== 8'h7C) $display("FAIL: Expected 0x7C for input 0x7C, got %h", out);

    in = 8'h3C; #10; // Example input
    if (out !== 8'h3C) $display("FAIL: Expected 0x3C for input 0x3C, got %h", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule