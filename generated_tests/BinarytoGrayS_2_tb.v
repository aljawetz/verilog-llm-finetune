`timescale 1ns/1ps

module tb_BinarytoGrayS;

reg [3:0] B;
wire [3:0] G;

// Instantiate the module under test (uut)
BinarytoGrayS uut (
    .B(B),
    .G(G)
);

initial begin
    // Test cases
    B = 4'b0000; #10;
    if (G !== 4'b0000) begin
        $display("FAIL: Test case B=0000 failed, expected G=0000, got G=%b", G);
        $finish;
    end

    B = 4'b0001; #10;
    if (G !== 4'b0001) begin
        $display("FAIL: Test case B=0001 failed, expected G=0001, got G=%b", G);
        $finish;
    end

    B = 4'b0010; #10;
    if (G !== 4'b0011) begin
        $display("FAIL: Test case B=0010 failed, expected G=0011, got G=%b", G);
        $finish;
    end

    B = 4'b0011; #10;
    if (G !== 4'b0010) begin
        $display("FAIL: Test case B=0011 failed, expected G=0010, got G=%b", G);
        $finish;
    end

    B = 4'b0100; #10;
    if (G !== 4'b0110) begin
        $display("FAIL: Test case B=0100 failed, expected G=0110, got G=%b", G);
        $finish;
    end

    B = 4'b0101; #10;
    if (G !== 4'b0111) begin
        $display("FAIL: Test case B=0101 failed, expected G=0111, got G=%b", G);
        $finish;
    end

    B = 4'b0110; #10;
    if (G !== 4'b0101) begin
        $display("FAIL: Test case B=0110 failed, expected G=0101, got G=%b", G);
        $finish;
    end

    B = 4'b0111; #10;
    if (G !== 4'b0100) begin
        $display("FAIL: Test case B=0111 failed, expected G=0100, got G=%b", G);
        $finish;
    end

    B = 4'b1000; #10;
    if (G !== 4'b1100) begin
        $display("FAIL: Test case B=1000 failed, expected G=1100, got G=%b", G);
        $finish;
    end

    B = 4'b1001; #10;
    if (G !== 4'b1101) begin
        $display("FAIL: Test case B=1001 failed, expected G=1101, got G=%b", G);
        $finish;
    end

    B = 4'b1010; #10;
    if (G !== 4'b1111) begin
        $display("FAIL: Test case B=1010 failed, expected G=1111, got G=%b", G);
        $finish;
    end

    B = 4'b1011; #10;
    if (G !== 4'b1110) begin
        $display("FAIL: Test case B=1011 failed, expected G=1110, got G=%b", G);
        $finish;
    end

    B = 4'b1100; #10;
    if (G !== 4'b1010) begin
        $display("FAIL: Test case B=1100 failed, expected G=1010, got G=%b", G);
        $finish;
    end

    B = 4'b1101; #10;
    if (G !== 4'b1011) begin
        $display("FAIL: Test case B=1101 failed, expected G=1011, got G=%b", G);
        $finish;
    end

    B = 4'b1110; #10;
    if (G !== 4'b1001) begin
        $display("FAIL: Test case B=1110 failed, expected G=1001, got G=%b", G);
        $finish;
    end

    B = 4'b1111; #10;
    if (G !== 4'b1000) begin
        $display("FAIL: Test case B=1111 failed, expected G=1000, got G=%b", G);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule