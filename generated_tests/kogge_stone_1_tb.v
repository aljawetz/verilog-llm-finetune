`timescale 1ns/1ps

module tb_kogge_stone;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [4:0] sum_out;

    // Instantiate the module under test (uut)
    kogge_stone uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum_out(sum_out)
    );

    initial begin
        // Test case 1: 0 + 0 + 0
        a = 4'b0000; b = 4'b0000; cin = 1'b0;
        #10;
        if (sum_out !== 5'b00000) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0
        a = 4'b0001; b = 4'b0001; cin = 1'b0;
        #10;
        if (sum_out !== 5'b00010) $display("FAIL: Test case 2 failed");

        // Test case 3: 3 + 2 + 0
        a = 4'b0011; b = 4'b0010; cin = 1'b0;
        #10;
        if (sum_out !== 5'b00010) $display("FAIL: Test case 3 failed");

        // Test case 4: 7 + 8 + 0
        a = 4'b0111; b = 4'b1000; cin = 1'b0;
        #10;
        if (sum_out !== 5'b11111) $display("FAIL: Test case 4 failed");

        // Test case 5: 15 + 1 + 0 (overflow)
        a = 4'b1111; b = 4'b0001; cin = 1'b0;
        #10;
        if (sum_out !== 5'b00000) $display("FAIL: Test case 5 failed");

        // Test case 6: 5 + 5 + 1
        a = 4'b0101; b = 4'b0101; cin = 1'b1;
        #10;
        if (sum_out !== 5'b10100) $display("FAIL: Test case 6 failed");

        // Test case 7: 4 + 4 + 1
        a = 4'b0100; b = 4'b0100; cin = 1'b1;
        #10;
        if (sum_out !== 5'b10001) $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule