`timescale 1ns/1ps

module tb_ksa_1;
    reg [7:0] a;
    reg [7:0] b;
    reg cin;
    wire [7:0] sum;
    wire cout;

    // Instantiate the module under test (uut)
    ksa_1 uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0
        a = 8'b00000000; b = 8'b00000000; cin = 1'b0;
        #10;
        if (sum !== 8'b00000000 || cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0 = 2
        a = 8'b00000001; b = 8'b00000001; cin = 1'b0;
        #10;
        if (sum !== 8'b00000010 || cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 255 + 1 + 0 = 0 (overflow)
        a = 8'b11111111; b = 8'b00000001; cin = 1'b0;
        #10;
        if (sum !== 8'b00000000 || cout !== 1'b1) $display("FAIL: Test case 3 failed");

        // Test case 4: 15 + 15 + 0 = 30
        a = 8'b00001111; b = 8'b00001111; cin = 1'b0;
        #10;
        if (sum !== 8'b00011110 || cout !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 100 + 100 + 1 = 201
        a = 8'b01100100; b = 8'b01100100; cin = 1'b1;
        #10;
        if (sum !== 8'b11001001 || cout !== 1'b0) $display("FAIL: Test case 5 failed");

        // Test case 6: 50 + 50 + 1 = 101
        a = 8'b00110010; b = 8'b00110010; cin = 1'b1;
        #10;
        if (sum !== 8'b01100101 || cout !== 1'b0) $display("FAIL: Test case 6 failed");

        // Test case 7: 128 + 128 + 0 = 256 (overflow)
        a = 8'b10000000; b = 8'b10000000; cin = 1'b0;
        #10;
        if (sum !== 8'b00000000 || cout !== 1'b1) $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule