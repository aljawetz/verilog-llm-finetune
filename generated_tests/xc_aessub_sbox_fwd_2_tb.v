`timescale 1ns/1ps

module tb_xc_aessub_sbox_fwd;

reg [7:0] in;
wire [7:0] out;

// Instantiate the unit under test (uut)
xc_aessub_sbox_fwd uut (
    .in(in),
    .out(out)
);

initial begin
    // Test vectors for AES S-box
    // Input: 0x00, Expected Output: 0x63
    in = 8'h00; #10;
    if (out !== 8'h63) $display("FAIL: Expected 0x63 for input 0x00, got %h", out);

    // Input: 0x01, Expected Output: 0x7C
    in = 8'h01; #10;
    if (out !== 8'h7C) $display("FAIL: Expected 0x7C for input 0x01, got %h", out);

    // Input: 0x02, Expected Output: 0x77
    in = 8'h02; #10;
    if (out !== 8'h77) $display("FAIL: Expected 0x77 for input 0x02, got %h", out);

    // Input: 0x03, Expected Output: 0x7B
    in = 8'h03; #10;
    if (out !== 8'h7B) $display("FAIL: Expected 0x7B for input 0x03, got %h", out);

    // Input: 0x04, Expected Output: 0xF2
    in = 8'h04; #10;
    if (out !== 8'hF2) $display("FAIL: Expected 0xF2 for input 0x04, got %h", out);

    // Input: 0x05, Expected Output: 0x6B
    in = 8'h05; #10;
    if (out !== 8'h6B) $display("FAIL: Expected 0x6B for input 0x05, got %h", out);

    // Input: 0x06, Expected Output: 0x6F
    in = 8'h06; #10;
    if (out !== 8'h6F) $display("FAIL: Expected 0x6F for input 0x06, got %h", out);

    // Input: 0x07, Expected Output: 0xC5
    in = 8'h07; #10;
    if (out !== 8'hC5) $display("FAIL: Expected 0xC5 for input 0x07, got %h", out);

    // Input: 0x08, Expected Output: 0x30
    in = 8'h08; #10;
    if (out !== 8'h30) $display("FAIL: Expected 0x30 for input 0x08, got %h", out);

    // Input: 0x09, Expected Output: 0x01
    in = 8'h09; #10;
    if (out !== 8'h01) $display("FAIL: Expected 0x01 for input 0x09, got %h", out);

    // Input: 0x0A, Expected Output: 0x67
    in = 8'h0A; #10;
    if (out !== 8'h67) $display("FAIL: Expected 0x67 for input 0x0A, got %h", out);

    // Input: 0x0B, Expected Output: 0x2B
    in = 8'h0B; #10;
    if (out !== 8'h2B) $display("FAIL: Expected 0x2B for input 0x0B, got %h", out);

    // Input: 0x0C, Expected Output: 0xFE
    in = 8'h0C; #10;
    if (out !== 8'hFE) $display("FAIL: Expected 0xFE for input 0x0C, got %h", out);

    // Input: 0x0D, Expected Output: 0xD7
    in = 8'h0D; #10;
    if (out !== 8'hD7) $display("FAIL: Expected 0xD7 for input 0x0D, got %h", out);

    // Input: 0x0E, Expected Output: 0xAB
    in = 8'h0E; #10;
    if (out !== 8'hAB) $display("FAIL: Expected 0xAB for input 0x0E, got %h", out);

    // Input: 0x0F, Expected Output: 0x76
    in = 8'h0F; #10;
    if (out !== 8'h76) $display("FAIL: Expected 0x76 for input 0x0F, got %h", out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule