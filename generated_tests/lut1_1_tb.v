`timescale 1ns/1ps

module tb_lut1;

reg [3:0] in;
wire [2:0] out;

// Instantiate the module under test
lut1 uut (
    .in(in),
    .out(out)
);

initial begin
    // Test cases
    in = 4'b0000; #10; 
    if (out !== 3'b000) $display("FAIL: Expected 000 for input 0000, got %b", out);

    in = 4'b0001; #10; 
    if (out !== 3'b001) $display("FAIL: Expected 001 for input 0001, got %b", out);

    in = 4'b0010; #10; 
    if (out !== 3'b001) $display("FAIL: Expected 001 for input 0010, got %b", out);

    in = 4'b0011; #10; 
    if (out !== 3'b010) $display("FAIL: Expected 010 for input 0011, got %b", out);

    in = 4'b0100; #10; 
    if (out !== 3'b001) $display("FAIL: Expected 001 for input 0100, got %b", out);

    in = 4'b0101; #10; 
    if (out !== 3'b010) $display("FAIL: Expected 010 for input 0101, got %b", out);

    in = 4'b0110; #10; 
    if (out !== 3'b010) $display("FAIL: Expected 010 for input 0110, got %b", out);

    in = 4'b0111; #10; 
    if (out !== 3'b011) $display("FAIL: Expected 011 for input 0111, got %b", out);

    in = 4'b1000; #10; 
    if (out !== 3'b001) $display("FAIL: Expected 001 for input 1000, got %b", out);

    in = 4'b1001; #10; 
    if (out !== 3'b010) $display("FAIL: Expected 010 for input 1001, got %b", out);

    in = 4'b1010; #10; 
    if (out !== 3'b010) $display("FAIL: Expected 010 for input 1010, got %b", out);

    in = 4'b1100; #10; 
    if (out !== 3'b010) $display("FAIL: Expected 010 for input 1100, got %b", out);

    in = 4'b1101; #10; 
    if (out !== 3'b011) $display("FAIL: Expected 011 for input 1101, got %b", out);

    in = 4'b1110; #10; 
    if (out !== 3'b011) $display("FAIL: Expected 011 for input 1110, got %b", out);

    in = 4'b1111; #10; 
    if (out !== 3'b100) $display("FAIL: Expected 100 for input 1111, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule