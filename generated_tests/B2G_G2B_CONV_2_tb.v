`timescale 1ns/1ps

module tb_B2G_G2B_CONV;

reg chooser;
reg [3:0] in;
wire [3:0] out;

// Instantiate the module under test
B2G_G2B_CONV uut (
    .chooser(chooser),
    .in(in),
    .out(out)
);

initial begin
    // Test Binary to Gray conversion
    chooser = 1'b1; // Set chooser for B2G
    in = 4'b0000;   // Test input 0
    #10;
    if (out !== 4'b0000) $display("FAIL: B2G Test 1 Failed for input %b", in);

    in = 4'b0001;   // Test input 1
    #10;
    if (out !== 4'b0001) $display("FAIL: B2G Test 2 Failed for input %b", in);

    in = 4'b0010;   // Test input 2
    #10;
    if (out !== 4'b0011) $display("FAIL: B2G Test 3 Failed for input %b", in);

    in = 4'b0011;   // Test input 3
    #10;
    if (out !== 4'b0010) $display("FAIL: B2G Test 4 Failed for input %b", in);

    in = 4'b0100;   // Test input 4
    #10;
    if (out !== 4'b0110) $display("FAIL: B2G Test 5 Failed for input %b", in);

    in = 4'b0101;   // Test input 5
    #10;
    if (out !== 4'b0111) $display("FAIL: B2G Test 6 Failed for input %b", in);

    in = 4'b0110;   // Test input 6
    #10;
    if (out !== 4'b0101) $display("FAIL: B2G Test 7 Failed for input %b", in);

    in = 4'b0111;   // Test input 7
    #10;
    if (out !== 4'b0100) $display("FAIL: B2G Test 8 Failed for input %b", in);

    in = 4'b1000;   // Test input 8
    #10;
    if (out !== 4'b1100) $display("FAIL: B2G Test 9 Failed for input %b", in);

    in = 4'b1001;   // Test input 9
    #10;
    if (out !== 4'b1101) $display("FAIL: B2G Test 10 Failed for input %b", in);

    in = 4'b1010;   // Test input 10
    #10;
    if (out !== 4'b1111) $display("FAIL: B2G Test 11 Failed for input %b", in);

    in = 4'b1011;   // Test input 11
    #10;
    if (out !== 4'b1110) $display("FAIL: B2G Test 12 Failed for input %b", in);

    in = 4'b1100;   // Test input 12
    #10;
    if (out !== 4'b1010) $display("FAIL: B2G Test 13 Failed for input %b", in);

    in = 4'b1101;   // Test input 13
    #10;
    if (out !== 4'b1011) $display("FAIL: B2G Test 14 Failed for input %b", in);

    in = 4'b1110;   // Test input 14
    #10;
    if (out !== 4'b1001) $display("FAIL: B2G Test 15 Failed for input %b", in);

    in = 4'b1111;   // Test input 15
    #10;
    if (out !== 4'b1000) $display("FAIL: B2G Test 16 Failed for input %b", in);

    // Test Gray to Binary conversion
    chooser = 1'b0; // Set chooser for G2B
    in = 4'b0000;   // Test input 0
    #10;
    if (out !== 4'b0000) $display("FAIL: G2B Test 1 Failed for input %b", in);

    in = 4'b0001;   // Test input 1
    #10;
    if (out !== 4'b0001) $display("FAIL: G2B Test 2 Failed for input %b", in);

    in = 4'b0011;   // Test input 2
    #10;
    if (out !== 4'b0010) $display("FAIL: G2B Test 3 Failed for input %b", in);

    in = 4'b0010;   // Test input 3
    #10;
    if (out !== 4'b0011) $display("FAIL: G2B Test 4 Failed for input %b", in);

    in = 4'b0110;   // Test input 4
    #10;
    if (out !== 4'b0100) $display("FAIL: G2B Test 5 Failed for input %b", in);

    in = 4'b0111;   // Test input 5
    #10;
    if (out !== 4'b0101) $display("FAIL: G2B Test 6 Failed for input %b", in);

    in = 4'b1101;   // Test input 6
    #10;
    if (out !== 4'b0111) $display("FAIL: G2B Test 7 Failed for input %b", in);

    in = 4'b1100;   // Test input 7
    #10;
    if (out !== 4'b0110) $display("FAIL: G2B Test 8 Failed for input %b", in);

    in = 4'b1000;   // Test input 8
    #10;
    if (out !== 4'b1000) $display("FAIL: G2B Test 9 Failed for input %b", in);

    in = 4'b1001;   // Test input 9
    #10;
    if (out !== 4'b1001) $display("FAIL: G2B Test 10 Failed for input %b", in);

    in = 4'b1111;   // Test input 10
    #10;
    if (out !== 4'b1011) $display("FAIL: G2B Test 11 Failed for input %b", in);

    in = 4'b1110;   // Test input 11
    #10;
    if (out !== 4'b1010) $display("FAIL: G2B Test 12 Failed for input %b", in);

    in = 4'b1010;   // Test input 12
    #10;
    if (out !== 4'b1100) $display("FAIL: G2B Test 13 Failed for input %b", in);

    in = 4'b1011;   // Test input 13
    #10;
    if (out !== 4'b1101) $display("FAIL: G2B Test 14 Failed for input %b", in);

    in = 4'b0111;   // Test input 14
    #10;
    if (out !== 4'b1111) $display("FAIL: G2B Test 15 Failed for input %b", in);

    in = 4'b0110;   // Test input 15
    #10;
    if (out !== 4'b1110) $display("FAIL: G2B Test 16 Failed for input %b", in);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule