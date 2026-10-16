`timescale 1ns/1ps

module tb_sbox4;

reg [4:0] in;
wire [1:0] out;

// Instantiate the module under test (uut)
sbox4 uut (
    .in(in),
    .out(out)
);

initial begin
    // Test cases
    in = 5'h00; #10; if (out !== 2'h3) $display("FAIL: Expected 2'h3 for input 5'h00, got %h", out);
    in = 5'h01; #10; if (out !== 2'h1) $display("FAIL: Expected 2'h1 for input 5'h01, got %h", out);
    in = 5'h02; #10; if (out !== 2'h2) $display("FAIL: Expected 2'h2 for input 5'h02, got %h", out);
    in = 5'h03; #10; if (out !== 2'h3) $display("FAIL: Expected 2'h3 for input 5'h03, got %h", out);
    in = 5'h04; #10; if (out !== 2'h0) $display("FAIL: Expected 2'h0 for input 5'h04, got %h", out);
    in = 5'h05; #10; if (out !== 2'h2) $display("FAIL: Expected 2'h2 for input 5'h05, got %h", out);
    in = 5'h06; #10; if (out !== 2'h1) $display("FAIL: Expected 2'h1 for input 5'h06, got %h", out);
    in = 5'h07; #10; if (out !== 2'h2) $display("FAIL: Expected 2'h2 for input 5'h07, got %h", out);
    in = 5'h08; #10; if (out !== 2'h1) $display("FAIL: Expected 2'h1 for input 5'h08, got %h", out);
    in = 5'h09; #10; if (out !== 2'h2) $display("FAIL: Expected 2'h2 for input 5'h09, got %h", out);
    in = 5'h0a; #10; if (out !== 2'h0) $display("FAIL: Expected 2'h0 for input 5'h0a, got %h", out);
    in = 5'h0b; #10; if (out !== 2'h1) $display("FAIL: Expected 2'h1 for input 5'h0b, got %h", out);
    in = 5'h0c; #10; if (out !== 2'h3) $display("FAIL: Expected 2'h3 for input 5'h0c, got %h", out);
    in = 5'h0d; #10; if (out !== 2'h0) $display("FAIL: Expected 2'h0 for input 5'h0d, got %h", out);
    in = 5'h0e; #10; if (out !== 2'h0) $display("FAIL: Expected 2'h0 for input 5'h0e, got %h", out);
    in = 5'h0f; #10; if (out !== 2'h3) $display("FAIL: Expected 2'h3 for input 5'h0f, got %h", out);
    in = 5'h10; #10; if (out !== 2'h1) $display("FAIL: Expected 2'h1 for input 5'h10, got %h", out);
    in = 5'h11; #10; if (out !== 2'h0) $display("FAIL: Expected 2'h0 for input 5'h11, got %h", out);
    in = 5'h12; #10; if (out !== 2'h3) $display("FAIL: Expected 2'h3 for input 5'h12, got %h", out);
    in = 5'h13; #10; if (out !== 2'h1) $display("FAIL: Expected 2'h1 for input 5'h13, got %h", out);
    in = 5'h14; #10; if (out !== 2'h2) $display("FAIL: Expected 2'h2 for input 5'h14, got %h", out);
    in = 5'h15; #10; if (out !== 2'h3) $display("FAIL: Expected 2'h3 for input 5'h15, got %h", out);
    in = 5'h16; #10; if (out !== 2'h0) $display("FAIL: Expected 2'h0 for input 5'h16, got %h", out);
    in = 5'h17; #10; if (out !== 2'h3) $display("FAIL: Expected 2'h3 for input 5'h17, got %h", out);
    in = 5'h18; #10; if (out !== 2'h0) $display("FAIL: Expected 2'h0 for input 5'h18, got %h", out);
    in = 5'h19; #10; if (out !== 2'h3) $display("FAIL: Expected 2'h3 for input 5'h19, got %h", out);
    in = 5'h1a; #10; if (out !== 2'h2) $display("FAIL: Expected 2'h2 for input 5'h1a, got %h", out);
    in = 5'h1b; #10; if (out !== 2'h0) $display("FAIL: Expected 2'h0 for input 5'h1b, got %h", out);
    in = 5'h1c; #10; if (out !== 2'h1) $display("FAIL: Expected 2'h1 for input 5'h1c, got %h", out);
    in = 5'h1d; #10; if (out !== 2'h2) $display("FAIL: Expected 2'h2 for input 5'h1d, got %h", out);
    in = 5'h1e; #10; if (out !== 2'h2) $display("FAIL: Expected 2'h2 for input 5'h1e, got %h", out);
    in = 5'h1f; #10; if (out !== 2'h1) $display("FAIL: Expected 2'h1 for input 5'h1f, got %h", out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule