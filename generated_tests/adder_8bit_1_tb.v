`timescale 1ns/1ps

module tb_adder_8bit;
    reg [7:0] a;
    reg [7:0] b;
    reg cin;
    wire [7:0] sum;
    wire cout;

    // Instantiate the adder_8bit module
    adder_8bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0, cout = 0
        a = 8'b00000000; b = 8'b00000000; cin = 0;
        #10;
        if (sum !== 8'b00000000 || cout !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0 = 2, cout = 0
        a = 8'b00000001; b = 8'b00000001; cin = 0;
        #10;
        if (sum !== 8'b00000010 || cout !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: 255 + 1 + 0 = 0, cout = 1 (overflow)
        a = 8'b11111111; b = 8'b00000001; cin = 0;
        #10;
        if (sum !== 8'b00000000 || cout !== 1) $display("FAIL: Test case 3 failed");

        // Test case 4: 15 + 15 + 0 = 30, cout = 0
        a = 8'b00001111; b = 8'b00001111; cin = 0;
        #10;
        if (sum !== 8'b00011110 || cout !== 0) $display("FAIL: Test case 4 failed");

        // Test case 5: 127 + 127 + 1 = 255, cout = 0
        a = 8'b01111111; b = 8'b01111111; cin = 1;
        #10;
        if (sum !== 8'b11111110 || cout !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: 100 + 100 + 1 = 201, cout = 0
        a = 8'b01100100; b = 8'b01100100; cin = 1;
        #10;
        if (sum !== 8'b11001001 || cout !== 0) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule