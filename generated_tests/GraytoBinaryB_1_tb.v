`timescale 1ns/1ps

module tb_GraytoBinaryB;

reg [3:0] G;
wire [3:0] B;

// Instantiate the module under test (uut)
GraytoBinaryB uut (
    .G(G),
    .B(B)
);

initial begin
    // Test cases
    G = 4'b0000; #10;
    if (B !== 4'b0000) $display("FAIL: Expected B=0000 for G=0000, got B=%b", B);

    G = 4'b0001; #10;
    if (B !== 4'b0001) $display("FAIL: Expected B=0001 for G=0001, got B=%b", B);

    G = 4'b0010; #10;
    if (B !== 4'b0011) $display("FAIL: Expected B=0011 for G=0010, got B=%b", B);

    G = 4'b0011; #10;
    if (B !== 4'b0010) $display("FAIL: Expected B=0010 for G=0011, got B=%b", B);

    G = 4'b0100; #10;
    if (B !== 4'b0111) $display("FAIL: Expected B=0111 for G=0100, got B=%b", B);

    G = 4'b0101; #10;
    if (B !== 4'b0110) $display("FAIL: Expected B=0110 for G=0101, got B=%b", B);

    G = 4'b0110; #10;
    if (B !== 4'b0100) $display("FAIL: Expected B=0100 for G=0110, got B=%b", B);

    G = 4'b0111; #10;
    if (B !== 4'b0101) $display("FAIL: Expected B=0101 for G=0111, got B=%b", B);

    G = 4'b1000; #10;
    if (B !== 4'b1111) $display("FAIL: Expected B=1111 for G=1000, got B=%b", B);

    G = 4'b1001; #10;
    if (B !== 4'b1110) $display("FAIL: Expected B=1110 for G=1001, got B=%b", B);

    G = 4'b1010; #10;
    if (B !== 4'b1100) $display("FAIL: Expected B=1100 for G=1010, got B=%b", B);

    G = 4'b1011; #10;
    if (B !== 4'b1101) $display("FAIL: Expected B=1101 for G=1011, got B=%b", B);

    G = 4'b1100; #10;
    if (B !== 4'b1000) $display("FAIL: Expected B=1000 for G=1100, got B=%b", B);

    G = 4'b1101; #10;
    if (B !== 4'b1001) $display("FAIL: Expected B=1001 for G=1101, got B=%b", B);

    G = 4'b1110; #10;
    if (B !== 4'b1011) $display("FAIL: Expected B=1011 for G=1110, got B=%b", B);

    G = 4'b1111; #10;
    if (B !== 4'b1010) $display("FAIL: Expected B=1010 for G=1111, got B=%b", B);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule