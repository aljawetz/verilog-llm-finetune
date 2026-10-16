`timescale 1ns/1ps

module tb_sbox6;

reg [4:0] in;
wire [1:0] out;
sbox6 uut (.in(in), .out(out));

initial begin
    // Test all input values from 0 to 31
    in = 5'b00000; #10;
    if (out !== 2'b00) $display("FAIL: Input 0x00 expected output 0x00, got %b", out);
    
    in = 5'b00001; #10;
    if (out !== 2'b01) $display("FAIL: Input 0x01 expected output 0x01, got %b", out);
    
    in = 5'b00010; #10;
    if (out !== 2'b10) $display("FAIL: Input 0x02 expected output 0x02, got %b", out);
    
    in = 5'b00011; #10;
    if (out !== 2'b11) $display("FAIL: Input 0x03 expected output 0x03, got %b", out);
    
    in = 5'b00100; #10;
    if (out !== 2'b01) $display("FAIL: Input 0x04 expected output 0x01, got %b", out);
    
    in = 5'b00101; #10;
    if (out !== 2'b10) $display("FAIL: Input 0x05 expected output 0x02, got %b", out);
    
    in = 5'b00110; #10;
    if (out !== 2'b10) $display("FAIL: Input 0x06 expected output 0x02, got %b", out);
    
    in = 5'b00111; #10;
    if (out !== 2'b00) $display("FAIL: Input 0x07 expected output 0x00, got %b", out);
    
    in = 5'b01000; #10;
    if (out !== 2'b00) $display("FAIL: Input 0x08 expected output 0x00, got %b", out);
    
    in = 5'b01001; #10;
    if (out !== 2'b01) $display("FAIL: Input 0x09 expected output 0x01, got %b", out);
    
    in = 5'b01010; #10;
    if (out !== 2'b11) $display("FAIL: Input 0x0A expected output 0x03, got %b", out);
    
    in = 5'b01011; #10;
    if (out !== 2'b00) $display("FAIL: Input 0x0B expected output 0x00, got %b", out);
    
    in = 5'b01100; #10;
    if (out !== 2'b10) $display("FAIL: Input 0x0C expected output 0x02, got %b", out);
    
    in = 5'b01101; #10;
    if (out !== 2'b11) $display("FAIL: Input 0x0D expected output 0x03, got %b", out);
    
    in = 5'b01110; #10;
    if (out !== 2'b01) $display("FAIL: Input 0x0E expected output 0x01, got %b", out);
    
    in = 5'b01111; #10;
    if (out !== 2'b11) $display("FAIL: Input 0x0F expected output 0x03, got %b", out);
    
    in = 5'b10000; #10;
    if (out !== 2'b10) $display("FAIL: Input 0x10 expected output 0x02, got %b", out);
    
    in = 5'b10001; #10;
    if (out !== 2'b11) $display("FAIL: Input 0x11 expected output 0x03, got %b", out);
    
    in = 5'b10010; #10;
    if (out !== 2'b00) $display("FAIL: Input 0x12 expected output 0x00, got %b", out);
    
    in = 5'b10011; #10;
    if (out !== 2'b10) $display("FAIL: Input 0x13 expected output 0x02, got %b", out);
    
    in = 5'b10100; #10;
    if (out !== 2'b11) $display("FAIL: Input 0x14 expected output 0x03, got %b", out);
    
    in = 5'b10101; #10;
    if (out !== 2'b00) $display("FAIL: Input 0x15 expected output 0x00, got %b", out);
    
    in = 5'b10110; #10;
    if (out !== 2'b01) $display("FAIL: Input 0x16 expected output 0x01, got %b", out);
    
    in = 5'b10111; #10;
    if (out !== 2'b01) $display("FAIL: Input 0x17 expected output 0x01, got %b", out);
    
    in = 5'b11000; #10;
    if (out !== 2'b10) $display("FAIL: Input 0x18 expected output 0x02, got %b", out);
    
    in = 5'b11001; #10;
    if (out !== 2'b01) $display("FAIL: Input 0x19 expected output 0x01, got %b", out);
    
    in = 5'b11010; #10;
    if (out !== 2'b01) $display("FAIL: Input 0x1A expected output 0x01, got %b", out);
    
    in = 5'b11011; #10;
    if (out !== 2'b10) $display("FAIL: Input 0x1B expected output 0x02, got %b", out);
    
    in = 5'b11100; #10;
    if (out !== 2'b00) $display("FAIL: Input 0x1C expected output 0x00, got %b", out);
    
    in = 5'b11101; #10;
    if (out !== 2'b11) $display("FAIL: Input 0x1D expected output 0x03, got %b", out);
    
    in = 5'b11110; #10;
    if (out !== 2'b11) $display("FAIL: Input 0x1E expected output 0x03, got %b", out);
    
    in = 5'b11111; #10;
    if (out !== 2'b00) $display("FAIL: Input 0x1F expected output 0x00, got %b", out);
    
    $display("PASS");
    $finish;
end

endmodule