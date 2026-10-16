`timescale 1ns/1ps

module tb_Bin_to_Gray;

    reg [3:0] B;
    wire [3:0] G;

    // Instantiate the module under test (uut)
    Bin_to_Gray uut (
        .B(B),
        .G(G)
    );

    initial begin
        // Test cases
        // Test case 0: B = 0000
        B = 4'b0000; #10;
        if (G !== 4'b0000) $display("FAIL: Test case B=0000 failed, G=%b", G);

        // Test case 1: B = 0001
        B = 4'b0001; #10;
        if (G !== 4'b0001) $display("FAIL: Test case B=0001 failed, G=%b", G);

        // Test case 2: B = 0010
        B = 4'b0010; #10;
        if (G !== 4'b0011) $display("FAIL: Test case B=0010 failed, G=%b", G);

        // Test case 3: B = 0011
        B = 4'b0011; #10;
        if (G !== 4'b0010) $display("FAIL: Test case B=0011 failed, G=%b", G);

        // Test case 4: B = 0100
        B = 4'b0100; #10;
        if (G !== 4'b0110) $display("FAIL: Test case B=0100 failed, G=%b", G);

        // Test case 5: B = 0101
        B = 4'b0101; #10;
        if (G !== 4'b0111) $display("FAIL: Test case B=0101 failed, G=%b", G);

        // Test case 6: B = 0110
        B = 4'b0110; #10;
        if (G !== 4'b0101) $display("FAIL: Test case B=0110 failed, G=%b", G);

        // Test case 7: B = 0111
        B = 4'b0111; #10;
        if (G !== 4'b0100) $display("FAIL: Test case B=0111 failed, G=%b", G);

        // Test case 8: B = 1000
        B = 4'b1000; #10;
        if (G !== 4'b1100) $display("FAIL: Test case B=1000 failed, G=%b", G);

        // Test case 9: B = 1001
        B = 4'b1001; #10;
        if (G !== 4'b1101) $display("FAIL: Test case B=1001 failed, G=%b", G);

        // Test case 10: B = 1010
        B = 4'b1010; #10;
        if (G !== 4'b1111) $display("FAIL: Test case B=1010 failed, G=%b", G);

        // Test case 11: B = 1011
        B = 4'b1011; #10;
        if (G !== 4'b1110) $display("FAIL: Test case B=1011 failed, G=%b", G);

        // Test case 12: B = 1100
        B = 4'b1100; #10;
        if (G !== 4'b1010) $display("FAIL: Test case B=1100 failed, G=%b", G);

        // Test case 13: B = 1101
        B = 4'b1101; #10;
        if (G !== 4'b1011) $display("FAIL: Test case B=1101 failed, G=%b", G);

        // Test case 14: B = 1110
        B = 4'b1110; #10;
        if (G !== 4'b1001) $display("FAIL: Test case B=1110 failed, G=%b", G);

        // Test case 15: B = 1111
        B = 4'b1111; #10;
        if (G !== 4'b1000) $display("FAIL: Test case B=1111 failed, G=%b", G);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule