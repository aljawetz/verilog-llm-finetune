`timescale 1ns/1ps

module tb_KOGGE_STONE_ADDER;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [4:0] sum_out;

    // Instantiate the KOGGE_STONE_ADDER module
    KOGGE_STONE_ADDER uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum_out(sum_out)
    );

    initial begin
        // Test case 1: 0 + 0 + 0
        a = 4'b0000; b = 4'b0000; cin = 1'b0;
        #10;
        if (sum_out !== 5'b00000) $display("FAIL: Test case 1 failed, expected 00000, got %b", sum_out);

        // Test case 2: 1 + 1 + 0
        a = 4'b0001; b = 4'b0001; cin = 1'b0;
        #10;
        if (sum_out !== 5'b00010) $display("FAIL: Test case 2 failed, expected 00010, got %b", sum_out);

        // Test case 3: 3 + 2 + 0
        a = 4'b0011; b = 4'b0010; cin = 1'b0;
        #10;
        if (sum_out !== 5'b000101) $display("FAIL: Test case 3 failed, expected 000101, got %b", sum_out);

        // Test case 4: 7 + 8 + 0
        a = 4'b0111; b = 4'b1000; cin = 1'b0;
        #10;
        if (sum_out !== 5'b01111) $display("FAIL: Test case 4 failed, expected 01111, got %b", sum_out);

        // Test case 5: 15 + 1 + 0 (overflow case)
        a = 4'b1111; b = 4'b0001; cin = 1'b0;
        #10;
        if (sum_out !== 5'b10000) $display("FAIL: Test case 5 failed, expected 10000, got %b", sum_out);

        // Test case 6: 5 + 5 + 1 (carry in)
        a = 4'b0101; b = 4'b0101; cin = 1'b1;
        #10;
        if (sum_out !== 5'b10100) $display("FAIL: Test case 6 failed, expected 10100, got %b", sum_out);

        // Test case 7: 9 + 6 + 0
        a = 4'b1001; b = 4'b0110; cin = 1'b0;
        #10;
        if (sum_out !== 5'b1111) $display("FAIL: Test case 7 failed, expected 01111, got %b", sum_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule