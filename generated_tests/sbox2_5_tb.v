`timescale 1ns/1ps

module tb_sbox2;

reg [4:0] in;
wire [1:0] out;

// Instantiate the module under test
sbox2 uut (
    .in(in),
    .out(out)
);

initial begin
    // Test cases
    in = 5'h00; #10; if (out !== 2'h3) $display("FAIL: Expected 3 for input 0, got %h", out);
    in = 5'h01; #10; if (out !== 2'h1) $display("FAIL: Expected 1 for input 1, got %h", out);
    in = 5'h02; #10; if (out !== 2'h0) $display("FAIL: Expected 0 for input 2, got %h", out);
    in = 5'h03; #10; if (out !== 2'h2) $display("FAIL: Expected 2 for input 3, got %h", out);
    in = 5'h04; #10; if (out !== 2'h2) $display("FAIL: Expected 2 for input 4, got %h", out);
    in = 5'h05; #10; if (out !== 2'h3) $display("FAIL: Expected 3 for input 5, got %h", out);
    in = 5'h06; #10; if (out !== 2'h3) $display("FAIL: Expected 3 for input 6, got %h", out);
    in = 5'h07; #10; if (out !== 2'h0) $display("FAIL: Expected 0 for input 7, got %h", out);
    in = 5'h08; #10; if (out !== 2'h1) $display("FAIL: Expected 1 for input 8, got %h", out);
    in = 5'h09; #10; if (out !== 2'h3) $display("FAIL: Expected 3 for input 9, got %h", out);
    in = 5'h0A; #10; if (out !== 2'h2) $display("FAIL: Expected 2 for input A, got %h", out);
    in = 5'h0B; #10; if (out !== 2'h1) $display("FAIL: Expected 1 for input B, got %h", out);
    in = 5'h0C; #10; if (out !== 2'h0) $display("FAIL: Expected 0 for input C, got %h", out);
    in = 5'h0D; #10; if (out !== 2'h0) $display("FAIL: Expected 0 for input D, got %h", out);
    in = 5'h0E; #10; if (out !== 2'h1) $display("FAIL: Expected 1 for input E, got %h", out);
    in = 5'h0F; #10; if (out !== 2'h2) $display("FAIL: Expected 2 for input F, got %h", out);
    in = 5'h10; #10; if (out !== 2'h3) $display("FAIL: Expected 3 for input 10, got %h", out);
    in = 5'h11; #10; if (out !== 2'h1) $display("FAIL: Expected 1 for input 11, got %h", out);
    in = 5'h12; #10; if (out !== 2'h0) $display("FAIL: Expected 0 for input 12, got %h", out);
    in = 5'h13; #10; if (out !== 2'h3) $display("FAIL: Expected 3 for input 13, got %h", out);
    in = 5'h14; #10; if (out !== 2'h3) $display("FAIL: Expected 3 for input 14, got %h", out);
    in = 5'h15; #10; if (out !== 2'h2) $display("FAIL: Expected 2 for input 15, got %h", out);
    in = 5'h16; #10; if (out !== 2'h0) $display("FAIL: Expected 0 for input 16, got %h", out);
    in = 5'h17; #10; if (out !== 2'h2) $display("FAIL: Expected 2 for input 17, got %h", out);
    in = 5'h18; #10; if (out !== 2'h0) $display("FAIL: Expected 0 for input 18, got %h", out);
    in = 5'h19; #10; if (out !== 2'h0) $display("FAIL: Expected 0 for input 19, got %h", out);
    in = 5'h1A; #10; if (out !== 2'h1) $display("FAIL: Expected 1 for input 1A, got %h", out);
    in = 5'h1B; #10; if (out !== 2'h2) $display("FAIL: Expected 2 for input 1B, got %h", out);
    in = 5'h1C; #10; if (out !== 2'h2) $display("FAIL: Expected 2 for input 1C, got %h", out);
    in = 5'h1D; #10; if (out !== 2'h1) $display("FAIL: Expected 1 for input 1D, got %h", out);
    in = 5'h1E; #10; if (out !== 2'h3) $display("FAIL: Expected 3 for input 1E, got %h", out);
    in = 5'h1F; #10; if (out !== 2'h1) $display("FAIL: Expected 1 for input 1F, got %h", out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule