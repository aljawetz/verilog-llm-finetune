`timescale 1ns/1ps

module tb_Mux16to1;

    reg [15:0] in;
    reg [3:0] sel;
    wire out;

    // Instantiate the Mux16to1 module
    Mux16to1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: Select input 0
        in = 16'b0000000000000001; // Input 0 is 1
        sel = 4'b0000; // Select input 0
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);

        // Test case 2: Select input 1
        in = 16'b0000000000000010; // Input 1 is 1
        sel = 4'b0001; // Select input 1
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);

        // Test case 3: Select input 2
        in = 16'b0000000000000100; // Input 2 is 1
        sel = 4'b0010; // Select input 2
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);

        // Test case 4: Select input 3
        in = 16'b0000000000001000; // Input 3 is 1
        sel = 4'b0011; // Select input 3
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 4 failed, expected out = 1, got out = %b", out);

        // Test case 5: Select input 4
        in = 16'b0000000000010000; // Input 4 is 1
        sel = 4'b0100; // Select input 4
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 5 failed, expected out = 1, got out = %b", out);

        // Test case 6: Select input 5
        in = 16'b0000000000100000; // Input 5 is 1
        sel = 4'b0101; // Select input 5
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 6 failed, expected out = 1, got out = %b", out);

        // Test case 7: Select input 6
        in = 16'b0000000001000000; // Input 6 is 1
        sel = 4'b0110; // Select input 6
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 7 failed, expected out = 1, got out = %b", out);

        // Test case 8: Select input 7
        in = 16'b0000000010000000; // Input 7 is 1
        sel = 4'b0111; // Select input 7
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 8 failed, expected out = 1, got out = %b", out);

        // Test case 9: Select input 8
        in = 16'b0000000100000000; // Input 8 is 1
        sel = 4'b1000; // Select input 8
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 9 failed, expected out = 1, got out = %b", out);

        // Test case 10: Select input 9
        in = 16'b0000001000000000; // Input 9 is 1
        sel = 4'b1001; // Select input 9
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 10 failed, expected out = 1, got out = %b", out);

        // Test case 11: Select input 10
        in = 16'b0000010000000000; // Input 10 is 1
        sel = 4'b1010; // Select input 10
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 11 failed, expected out = 1, got out = %b", out);

        // Test case 12: Select input 11
        in = 16'b0000100000000000; // Input 11 is 1
        sel = 4'b1011; // Select input 11
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 12 failed, expected out = 1, got out = %b", out);

        // Test case 13: Select input 12
        in = 16'b0001000000000000; // Input 12 is 1
        sel = 4'b1100; // Select input 12
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 13 failed, expected out = 1, got out = %b", out);

        // Test case 14: Select input 13
        in = 16'b0010000000000000; // Input 13 is 1
        sel = 4'b1101; // Select input 13
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 14 failed, expected out = 1, got out = %b", out);

        // Test case 15: Select input 14
        in = 16'b0100000000000000; // Input 14 is 1
        sel = 4'b1110; // Select input 14
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 15 failed, expected out = 1, got out = %b", out);

        // Test case 16: Select input 15
        in = 16'b1000000000000000; // Input 15 is 1
        sel = 4'b1111; // Select input 15
        #10;
        if (out !== 1'b1) $display("FAIL: Test case 16 failed, expected out = 1, got out = %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule