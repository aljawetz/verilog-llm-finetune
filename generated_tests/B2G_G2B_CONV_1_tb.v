`timescale 1ns/1ps

module tb_B2G_G2B_CONV;

reg chooser;
reg [3:0] in;
wire [3:0] out;

// Instantiate the Unit Under Test (UUT)
B2G_G2B_CONV uut (
    .chooser(chooser),
    .in(in),
    .out(out)
);

// Test procedure
initial begin
    // Test Binary to Grey conversion
    chooser = 1'b1; // Select Binary to Grey
    in = 4'b0000; #10;
    if (out !== 4'b0000) $display("FAIL: Binary to Grey conversion failed for input 0000");

    in = 4'b0001; #10;
    if (out !== 4'b0001) $display("FAIL: Binary to Grey conversion failed for input 0001");

    in = 4'b0010; #10;
    if (out !== 4'b0011) $display("FAIL: Binary to Grey conversion failed for input 0010");

    in = 4'b0011; #10;
    if (out !== 4'b0010) $display("FAIL: Binary to Grey conversion failed for input 0011");

    in = 4'b0100; #10;
    if (out !== 4'b0110) $display("FAIL: Binary to Grey conversion failed for input 0100");

    in = 4'b1111; #10;
    if (out !== 4'b1000) $display("FAIL: Binary to Grey conversion failed for input 1111");

    // Test Grey to Binary conversion
    chooser = 1'b0; // Select Grey to Binary
    in = 4'b0000; #10;
    if (out !== 4'b0000) $display("FAIL: Grey to Binary conversion failed for input 0000");

    in = 4'b0001; #10;
    if (out !== 4'b0001) $display("FAIL: Grey to Binary conversion failed for input 0001");

    in = 4'b0011; #10;
    if (out !== 4'b0010) $display("FAIL: Grey to Binary conversion failed for input 0011");

    in = 4'b0010; #10;
    if (out !== 4'b0011) $display("FAIL: Grey to Binary conversion failed for input 0010");

    in = 4'b0110; #10;
    if (out !== 4'b0100) $display("FAIL: Grey to Binary conversion failed for input 0110");

    in = 4'b1000; #10;
    if (out !== 4'b1111) $display("FAIL: Grey to Binary conversion failed for input 1000");

    $display("PASS");
    $finish;
end

endmodule