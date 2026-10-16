`timescale 1ns/1ps

module tb_binary_to_grey_bh;

reg [3:0] bin;
wire [3:0] grey;

// Instantiate the module under test
binary_to_grey_bh uut (
    .bin(bin),
    .grey(grey)
);

initial begin
    // Test all binary inputs from 0 to 15
    bin = 4'b0000; #10; if (grey !== 4'b0000) $display("FAIL: Expected 0000 for input 0000");
    bin = 4'b0001; #10; if (grey !== 4'b0001) $display("FAIL: Expected 0001 for input 0001");
    bin = 4'b0010; #10; if (grey !== 4'b0011) $display("FAIL: Expected 0011 for input 0010");
    bin = 4'b0011; #10; if (grey !== 4'b0010) $display("FAIL: Expected 0010 for input 0011");
    bin = 4'b0100; #10; if (grey !== 4'b0110) $display("FAIL: Expected 0110 for input 0100");
    bin = 4'b0101; #10; if (grey !== 4'b0111) $display("FAIL: Expected 0111 for input 0101");
    bin = 4'b0110; #10; if (grey !== 4'b0101) $display("FAIL: Expected 0101 for input 0110");
    bin = 4'b0111; #10; if (grey !== 4'b0100) $display("FAIL: Expected 0100 for input 0111");
    bin = 4'b1000; #10; if (grey !== 4'b1100) $display("FAIL: Expected 1100 for input 1000");
    bin = 4'b1001; #10; if (grey !== 4'b1101) $display("FAIL: Expected 1101 for input 1001");
    bin = 4'b1010; #10; if (grey !== 4'b1111) $display("FAIL: Expected 1111 for input 1010");
    bin = 4'b1011; #10; if (grey !== 4'b1110) $display("FAIL: Expected 1110 for input 1011");
    bin = 4'b1100; #10; if (grey !== 4'b1010) $display("FAIL: Expected 1010 for input 1100");
    bin = 4'b1101; #10; if (grey !== 4'b1011) $display("FAIL: Expected 1011 for input 1101");
    bin = 4'b1110; #10; if (grey !== 4'b1001) $display("FAIL: Expected 1001 for input 1110");
    bin = 4'b1111; #10; if (grey !== 4'b1000) $display("FAIL: Expected 1000 for input 1111");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule