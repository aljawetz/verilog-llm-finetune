`timescale 1ns/1ps

module tb_CLA_4;
    reg [3:0] in1;
    reg [3:0] in2;
    wire [3:0] sum;
    wire cout;

    // Instantiate the CLA_4 module
    CLA_4 uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: 0 + 0 = 0
        in1 = 4'b0000; in2 = 4'b0000;
        #10;
        if (sum !== 4'b0000 || cout !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 1 + 1 = 2
        in1 = 4'b0001; in2 = 4'b0001;
        #10;
        if (sum !== 4'b0010 || cout !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 3 + 1 = 4
        in1 = 4'b0011; in2 = 4'b0001;
        #10;
        if (sum !== 4'b0100 || cout !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 7 + 1 = 8
        in1 = 4'b0111; in2 = 4'b0001;
        #10;
        if (sum !== 4'b1000 || cout !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 8 + 7 = 15
        in1 = 4'b1000; in2 = 4'b0111;
        #10;
        if (sum !== 4'b1111 || cout !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 15 + 1 = 0 (overflow)
        in1 = 4'b1111; in2 = 4'b0001;
        #10;
        if (sum !== 4'b0000 || cout !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: 5 + 10 = 15
        in1 = 4'b0101; in2 = 4'b1010;
        #10;
        if (sum !== 4'b1111 || cout !== 1'b0) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: 6 + 9 = 15
        in1 = 4'b0110; in2 = 4'b1001;
        #10;
        if (sum !== 4'b1111 || cout !== 1'b0) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule