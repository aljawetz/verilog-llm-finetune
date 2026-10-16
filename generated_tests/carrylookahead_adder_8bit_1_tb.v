`timescale 1ns/1ps

module tb_carrylookahead_adder_8bit;

    reg [7:0] a;
    reg [7:0] b;
    reg cin;
    wire [7:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    carrylookahead_adder_8bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Test case 1: 0 + 0 + 0
        a = 8'b00000000; b = 8'b00000000; cin = 1'b0;
        #10;
        if (sum !== 8'b00000000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0
        a = 8'b00000001; b = 8'b00000001; cin = 1'b0;
        #10;
        if (sum !== 8'b00000010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 255 + 1 + 0
        a = 8'b11111111; b = 8'b00000001; cin = 1'b0;
        #10;
        if (sum !== 8'b00000000 || cout !== 1'b1) $display("FAIL: Test case 3 failed");

        // Test case 4: 15 + 15 + 1
        a = 8'b00001111; b = 8'b00001111; cin = 1'b1;
        #10;
        if (sum !== 8'b00011110 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 100 + 55 + 0
        a = 8'b01100100; b = 8'b00110111; cin = 1'b0;
        #10;
        if (sum !== 8'b10011011 || cout !== 1'b0) $display("FAIL: Test case 5 failed");

        // Test case 6: 127 + 128 + 0
        a = 8'b01111111; b = 8'b10000000; cin = 1'b0;
        #10;
        if (sum !== 8'b11111111 || cout !== 1'b1) $display("FAIL: Test case 6 failed");

        // Test case 7: 0 + 0 + 1
        a = 8'b00000000; b = 8'b00000000; cin = 1'b1;
        #10;
        if (sum !== 8'b00000001 || cout !== 1'b0) $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule