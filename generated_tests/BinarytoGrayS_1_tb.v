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
    // Test case 1: B = 0000
    B = 4'b0000;
    #10;
    if (G !== 4'b0000) begin
        $display("FAIL: Test case 1 failed, expected G = 0000, got G = %b", G);
        $finish;
    end

    // Test case 2: B = 0001
    B = 4'b0001;
    #10;
    if (G !== 4'b0001) begin
        $display("FAIL: Test case 2 failed, expected G = 0001, got G = %b", G);
        $finish;
    end

    // Test case 3: B = 0010
    B = 4'b0010;
    #10;
    if (G !== 4'b0011) begin
        $display("FAIL: Test case 3 failed, expected G = 0011, got G = %b", G);
        $finish;
    end

    // Test case 4: B = 0011
    B = 4'b0011;
    #10;
    if (G !== 4'b0010) begin
        $display("FAIL: Test case 4 failed, expected G = 0010, got G = %b", G);
        $finish;
    end

    // Test case 5: B = 0100
    B = 4'b0100;
    #10;
    if (G !== 4'b0110) begin
        $display("FAIL: Test case 5 failed, expected G = 0110, got G = %b", G);
        $finish;
    end

    // Test case 6: B = 0101
    B = 4'b0101;
    #10;
    if (G !== 4'b0111) begin
        $display("FAIL: Test case 6 failed, expected G = 0111, got G = %b", G);
        $finish;
    end

    // Test case 7: B = 0110
    B = 4'b0110;
    #10;
    if (G !== 4'b0101) begin
        $display("FAIL: Test case 7 failed, expected G = 0101, got G = %b", G);
        $finish;
    end

    // Test case 8: B = 0111
    B = 4'b0111;
    #10;
    if (G !== 4'b0100) begin
        $display("FAIL: Test case 8 failed, expected G = 0100, got G = %b", G);
        $finish;
    end

    // Test case 9: B = 1000
    B = 4'b1000;
    #10;
    if (G !== 4'b1100) begin
        $display("FAIL: Test case 9 failed, expected G = 1100, got G = %b", G);
        $finish;
    end

    // Test case 10: B = 1111
    B = 4'b1111;
    #10;
    if (G !== 4'b1000) begin
        $display("FAIL: Test case 10 failed, expected G = 1000, got G = %b", G);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule