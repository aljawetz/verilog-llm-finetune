`timescale 1ns/1ps

module tb_carry_look_ahead_adder;

    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    carry_look_ahead_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0
        a = 4'b0000; b = 4'b0000; cin = 1'b0;
        #10;
        if (sum !== 4'b0000 || cout !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 1 + 1 + 0 = 10
        a = 4'b0001; b = 4'b0001; cin = 1'b0;
        #10;
        if (sum !== 4'b0010 || cout !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 3 + 2 + 0 = 5
        a = 4'b0011; b = 4'b0010; cin = 1'b0;
        #10;
        if (sum !== 4'b0101 || cout !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 7 + 8 + 0 = 15
        a = 4'b0111; b = 4'b1000; cin = 1'b0;
        #10;
        if (sum !== 4'b1111 || cout !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 15 + 1 + 0 = 0 with carry out
        a = 4'b1111; b = 4'b0001; cin = 1'b0;
        #10;
        if (sum !== 4'b0000 || cout !== 1'b1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 5 + 5 + 1 = 11
        a = 4'b0101; b = 4'b0101; cin = 1'b1;
        #10;
        if (sum !== 4'b1011 || cout !== 1'b0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: 9 + 7 + 1 = 17
        a = 4'b1001; b = 4'b0111; cin = 1'b1;
        #10;
        if (sum !== 4'b0001 || cout !== 1'b1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule