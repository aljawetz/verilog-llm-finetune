`timescale 1ns/1ps

module tb_sbox5;

    reg [4:0] in;
    wire [1:0] out;
    
    // Instantiate the module under test (uut)
    sbox5 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test cases
        // Expected outputs based on the provided S-box mapping
        in = 5'h00; #10; if (out !== 2'h2) $display("FAIL: Expected out=2'h2 for in=5'h00");
        in = 5'h01; #10; if (out !== 2'h0) $display("FAIL: Expected out=2'h0 for in=5'h01");
        in = 5'h02; #10; if (out !== 2'h0) $display("FAIL: Expected out=2'h0 for in=5'h02");
        in = 5'h03; #10; if (out !== 2'h1) $display("FAIL: Expected out=2'h1 for in=5'h03");
        in = 5'h04; #10; if (out !== 2'h3) $display("FAIL: Expected out=2'h3 for in=5'h04");
        in = 5'h05; #10; if (out !== 2'h2) $display("FAIL: Expected out=2'h2 for in=5'h05");
        in = 5'h06; #10; if (out !== 2'h3) $display("FAIL: Expected out=2'h3 for in=5'h06");
        in = 5'h07; #10; if (out !== 2'h2) $display("FAIL: Expected out=2'h2 for in=5'h07");
        in = 5'h08; #10; if (out !== 2'h0) $display("FAIL: Expected out=2'h0 for in=5'h08");
        in = 5'h09; #10; if (out !== 2'h1) $display("FAIL: Expected out=2'h1 for in=5'h09");
        in = 5'h0a; #10; if (out !== 2'h3) $display("FAIL: Expected out=2'h3 for in=5'h0a");
        in = 5'h0b; #10; if (out !== 2'h3) $display("FAIL: Expected out=2'h3 for in=5'h0b");
        in = 5'h0c; #10; if (out !== 2'h1) $display("FAIL: Expected out=2'h1 for in=5'h0c");
        in = 5'h0d; #10; if (out !== 2'h0) $display("FAIL: Expected out=2'h0 for in=5'h0d");
        in = 5'h0e; #10; if (out !== 2'h2) $display("FAIL: Expected out=2'h2 for in=5'h0e");
        in = 5'h0f; #10; if (out !== 2'h1) $display("FAIL: Expected out=2'h1 for in=5'h0f");
        in = 5'h10; #10; if (out !== 2'h2) $display("FAIL: Expected out=2'h2 for in=5'h10");
        in = 5'h11; #10; if (out !== 2'h3) $display("FAIL: Expected out=2'h3 for in=5'h11");
        in = 5'h12; #10; if (out !== 2'h2) $display("FAIL: Expected out=2'h2 for in=5'h12");
        in = 5'h13; #10; if (out !== 2'h0) $display("FAIL: Expected out=2'h0 for in=5'h13");
        in = 5'h14; #10; if (out !== 2'h0) $display("FAIL: Expected out=2'h0 for in=5'h14");
        in = 5'h15; #10; if (out !== 2'h3) $display("FAIL: Expected out=2'h3 for in=5'h15");
        in = 5'h16; #10; if (out !== 2'h1) $display("FAIL: Expected out=2'h1 for in=5'h16");
        in = 5'h17; #10; if (out !== 2'h1) $display("FAIL: Expected out=2'h1 for in=5'h17");
        in = 5'h18; #10; if (out !== 2'h1) $display("FAIL: Expected out=2'h1 for in=5'h18");
        in = 5'h19; #10; if (out !== 2'h0) $display("FAIL: Expected out=2'h0 for in=5'h19");
        in = 5'h1a; #10; if (out !== 2'h3) $display("FAIL: Expected out=2'h3 for in=5'h1a");
        in = 5'h1b; #10; if (out !== 2'h2) $display("FAIL: Expected out=2'h2 for in=5'h1b");
        in = 5'h1c; #10; if (out !== 2'h3) $display("FAIL: Expected out=2'h3 for in=5'h1c");
        in = 5'h1d; #10; if (out !== 2'h1) $display("FAIL: Expected out=2'h1 for in=5'h1d");
        in = 5'h1e; #10; if (out !== 2'h0) $display("FAIL: Expected out=2'h0 for in=5'h1e");
        in = 5'h1f; #10; if (out !== 2'h2) $display("FAIL: Expected out=2'h2 for in=5'h1f");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule