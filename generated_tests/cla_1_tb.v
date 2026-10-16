`timescale 1ns/1ps

module tb_cla;

    reg [3:0] a;
    reg [3:0] b;
    reg c;
    wire [3:0] sum;
    wire carry;

    // Instantiate the Unit Under Test (UUT)
    cla uut (
        .sum(sum),
        .carry(carry),
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0
        a = 4'b0000; b = 4'b0000; c = 1'b0;
        #10;
        if (sum !== 4'b0000 || carry !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 1 + 1 + 0 = 2
        a = 4'b0001; b = 4'b0001; c = 1'b0;
        #10;
        if (sum !== 4'b0010 || carry !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 3 + 3 + 0 = 6
        a = 4'b0011; b = 4'b0011; c = 1'b0;
        #10;
        if (sum !== 4'b0110 || carry !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 7 + 8 + 0 = 15
        a = 4'b0111; b = 4'b1000; c = 1'b0;
        #10;
        if (sum !== 4'b1111 || carry !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 7 + 8 + 1 = 0 (with carry)
        a = 4'b0111; b = 4'b1000; c = 1'b1;
        #10;
        if (sum !== 4'b0000 || carry !== 1'b1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 15 + 1 + 0 = 0 (with carry)
        a = 4'b1111; b = 4'b0001; c = 1'b0;
        #10;
        if (sum !== 4'b0000 || carry !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: 15 + 0 + 1 = 0 (with carry)
        a = 4'b1111; b = 4'b0000; c = 1'b1;
        #10;
        if (sum !== 4'b0000 || carry !== 1'b1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule