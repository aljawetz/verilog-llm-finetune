`timescale 1ns/1ps

module tb_CLA_adder;

    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    // Instantiate the CLA_adder module
    CLA_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0
        A = 4'b0000; B = 4'b0000; Cin = 1'b0;
        #10;
        if (Sum !== 4'b0000 || Cout !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 1 + 1 + 0 = 2
        A = 4'b0001; B = 4'b0001; Cin = 1'b0;
        #10;
        if (Sum !== 4'b0010 || Cout !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 3 + 3 + 0 = 6
        A = 4'b0011; B = 4'b0011; Cin = 1'b0;
        #10;
        if (Sum !== 4'b0110 || Cout !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 7 + 1 + 0 = 8
        A = 4'b0111; B = 4'b0001; Cin = 1'b0;
        #10;
        if (Sum !== 4'b1000 || Cout !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 8 + 1 + 0 = 9
        A = 4'b1000; B = 4'b0001; Cin = 1'b0;
        #10;
        if (Sum !== 4'b1001 || Cout !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 15 + 1 + 0 = 0 (overflow)
        A = 4'b1111; B = 4'b0001; Cin = 1'b0;
        #10;
        if (Sum !== 4'b0000 || Cout !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: 1 + 1 + 1 = 3
        A = 4'b0001; B = 4'b0001; Cin = 1'b1;
        #10;
        if (Sum !== 4'b0011 || Cout !== 1'b0) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: 2 + 2 + 1 = 5
        A = 4'b0010; B = 4'b0010; Cin = 1'b1;
        #10;
        if (Sum !== 4'b0101 || Cout !== 1'b0) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9: 3 + 3 + 1 = 7
        A = 4'b0011; B = 4'b0011; Cin = 1'b1;
        #10;
        if (Sum !== 4'b0111 || Cout !== 1'b0) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        // Test case 10: 15 + 1 + 1 = 1 (overflow)
        A = 4'b1111; B = 4'b0001; Cin = 1'b1;
        #10;
        if (Sum !== 4'b0001 || Cout !== 1'b1) begin
            $display("FAIL: Test case 10 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule