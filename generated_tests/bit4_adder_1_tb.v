`timescale 1ns/1ps

module tb_bit4_adder;

    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;
    wire carry;

    // Instantiate the Unit Under Test (UUT)
    bit4_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // Test case 1: 0 + 0 = 0
        a = 4'b0000; b = 4'b0000; #10;
        if (sum !== 4'b0000 || carry !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 1 + 1 = 2
        a = 4'b0001; b = 4'b0001; #10;
        if (sum !== 4'b0010 || carry !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 2 + 3 = 5
        a = 4'b0010; b = 4'b0011; #10;
        if (sum !== 4'b0101 || carry !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 7 + 1 = 8
        a = 4'b0111; b = 4'b0001; #10;
        if (sum !== 4'b1000 || carry !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 8 + 1 = 9 (no carry)
        a = 4'b1000; b = 4'b0001; #10;
        if (sum !== 4'b1001 || carry !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 15 + 1 = 0 (with carry)
        a = 4'b1111; b = 4'b0001; #10;
        if (sum !== 4'b0000 || carry !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: 10 + 5 = 15
        a = 4'b1010; b = 4'b0101; #10;
        if (sum !== 4'b1111 || carry !== 1'b0) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: 9 + 7 = 0 (with carry)
        a = 4'b1001; b = 4'b0111; #10;
        if (sum !== 4'b0000 || carry !== 1'b1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule