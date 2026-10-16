`timescale 1ns/1ps

module tb_ksa_1;
    reg [7:0] a;
    reg [7:0] b;
    reg cin;
    wire [7:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
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
        if (sum !== 8'b00000000 || cout !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 1 + 1 + 0 = 2
        a = 8'b00000001; b = 8'b00000001; cin = 1'b0;
        #10;
        if (sum !== 8'b00000010 || cout !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 255 + 1 + 0 = 0 (overflow)
        a = 8'b11111111; b = 8'b00000001; cin = 1'b0;
        #10;
        if (sum !== 8'b00000000 || cout !== 1'b1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 15 + 15 + 1 = 31
        a = 8'b00001111; b = 8'b00001111; cin = 1'b1;
        #10;
        if (sum !== 8'b00011111 || cout !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 100 + 50 + 1 = 151
        a = 8'b01100100; b = 8'b00110010; cin = 1'b1;
        #10;
        if (sum !== 8'b10010111 || cout !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 128 + 128 + 1 = 257 (overflow)
        a = 8'b10000000; b = 8'b10000000; cin = 1'b1;
        #10;
        if (sum !== 8'b00000001 || cout !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: 34 + 22 + 0 = 56
        a = 8'b00100010; b = 8'b00010110; cin = 1'b0;
        #10;
        if (sum !== 8'b00111000 || cout !== 1'b0) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule