`timescale 1ns/1ps

module tb_block_perm;

reg [7:0] in;
wire [7:0] out;

// Instantiate the module under test
block_perm uut (
    .in(in),
    .out(out)
);

initial begin
    // Test all input values from 0 to 255
    in = 8'h00; #10;
    if (out !== 8'h00) $display("FAIL: Input 0x00 expected 0x00, got %h", out);

    in = 8'h01; #10;
    if (out !== 8'h02) $display("FAIL: Input 0x01 expected 0x02, got %h", out);

    in = 8'h02; #10;
    if (out !== 8'h80) $display("FAIL: Input 0x02 expected 0x80, got %h", out);

    in = 8'h03; #10;
    if (out !== 8'h82) $display("FAIL: Input 0x03 expected 0x82, got %h", out);

    in = 8'h04; #10;
    if (out !== 8'h20) $display("FAIL: Input 0x04 expected 0x20, got %h", out);

    in = 8'h05; #10;
    if (out !== 8'h22) $display("FAIL: Input 0x05 expected 0x22, got %h", out);

    in = 8'h06; #10;
    if (out !== 8'hA0) $display("FAIL: Input 0x06 expected 0xA0, got %h", out);

    in = 8'h07; #10;
    if (out !== 8'hA2) $display("FAIL: Input 0x07 expected 0xA2, got %h", out);

    in = 8'h08; #10;
    if (out !== 8'h10) $display("FAIL: Input 0x08 expected 0x10, got %h", out);

    in = 8'h09; #10;
    if (out !== 8'h12) $display("FAIL: Input 0x09 expected 0x12, got %h", out);

    in = 8'h0A; #10;
    if (out !== 8'h90) $display("FAIL: Input 0x0A expected 0x90, got %h", out);

    in = 8'h0B; #10;
    if (out !== 8'h92) $display("FAIL: Input 0x0B expected 0x92, got %h", out);

    in = 8'h0C; #10;
    if (out !== 8'h30) $display("FAIL: Input 0x0C expected 0x30, got %h", out);

    in = 8'h0D; #10;
    if (out !== 8'h32) $display("FAIL: Input 0x0D expected 0x32, got %h", out);

    in = 8'h0E; #10;
    if (out !== 8'hB0) $display("FAIL: Input 0x0E expected 0xB0, got %h", out);

    in = 8'h0F; #10;
    if (out !== 8'hB2) $display("FAIL: Input 0x0F expected 0xB2, got %h", out);

    // Continue testing other values...

    in = 8'hFF; #10;
    if (out !== 8'hFF) $display("FAIL: Input 0xFF expected 0xFF, got %h", out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule