`timescale 1ns/1ps

module tb_sbox1;

reg [4:0] in;
wire [1:0] out;
reg [1:0] expected_out;

sbox1 uut (
    .in(in),
    .out(out)
);

initial begin
    // Test cases
    in = 5'h00; expected_out = 2'h2; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h01; expected_out = 2'h0; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h02; expected_out = 2'h1; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h03; expected_out = 2'h1; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h04; expected_out = 2'h2; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h05; expected_out = 2'h3; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h06; expected_out = 2'h3; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h07; expected_out = 2'h0; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h08; expected_out = 2'h3; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h09; expected_out = 2'h2; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h0a; expected_out = 2'h2; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h0b; expected_out = 2'h0; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h0c; expected_out = 2'h1; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h0d; expected_out = 2'h1; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h0e; expected_out = 2'h0; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h0f; expected_out = 2'h3; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h10; expected_out = 2'h0; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h11; expected_out = 2'h3; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h12; expected_out = 2'h3; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h13; expected_out = 2'h0; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h14; expected_out = 2'h2; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h15; expected_out = 2'h2; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h16; expected_out = 2'h1; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h17; expected_out = 2'h1; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h18; expected_out = 2'h2; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h19; expected_out = 2'h2; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h1a; expected_out = 2'h0; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h1b; expected_out = 2'h3; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h1c; expected_out = 2'h1; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h1d; expected_out = 2'h1; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h1e; expected_out = 2'h3; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    in = 5'h1f; expected_out = 2'h0; #10;
    if (out !== expected_out) $display("FAIL: Expected %h, got %h for input %h", expected_out, out, in);

    $display("PASS");
    $finish;
end

endmodule