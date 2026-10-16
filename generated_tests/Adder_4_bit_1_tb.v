`timescale 1ns/1ps

module tb_Adder_4_bit;

    reg [3:0] X;
    reg [3:0] Y;
    reg Cin;
    wire [3:0] Z;
    wire Cout;

    // Instantiate the module under test (uut)
    Adder_4_bit uut (
        .X(X),
        .Y(Y),
        .Z(Z),
        .Cout(Cout),
        .Cin(Cin)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0
        X = 4'b0000; Y = 4'b0000; Cin = 1'b0;
        #10;
        if (Z !== 4'b0000 || Cout !== 1'b0) $display("FAIL: Test case 1 failed");

        // Test case 2: 1 + 1 + 0 = 2
        X = 4'b0001; Y = 4'b0001; Cin = 1'b0;
        #10;
        if (Z !== 4'b0010 || Cout !== 1'b0) $display("FAIL: Test case 2 failed");

        // Test case 3: 3 + 3 + 0 = 6
        X = 4'b0011; Y = 4'b0011; Cin = 1'b0;
        #10;
        if (Z !== 4'b0110 || Cout !== 1'b0) $display("FAIL: Test case 3 failed");

        // Test case 4: 7 + 8 + 0 = 15
        X = 4'b0111; Y = 4'b1000; Cin = 1'b0;
        #10;
        if (Z !== 4'b1111 || Cout !== 1'b0) $display("FAIL: Test case 4 failed");

        // Test case 5: 15 + 1 + 0 = 0 (overflow)
        X = 4'b1111; Y = 4'b0001; Cin = 1'b0;
        #10;
        if (Z !== 4'b0000 || Cout !== 1'b1) $display("FAIL: Test case 5 failed");

        // Test case 6: 1 + 1 + 1 = 3
        X = 4'b0001; Y = 4'b0001; Cin = 1'b1;
        #10;
        if (Z !== 4'b0011 || Cout !== 1'b0) $display("FAIL: Test case 6 failed");

        // Test case 7: 2 + 2 + 1 = 5
        X = 4'b0010; Y = 4'b0010; Cin = 1'b1;
        #10;
        if (Z !== 4'b0101 || Cout !== 1'b0) $display("FAIL: Test case 7 failed");

        // Test case 8: 15 + 1 + 1 = 1 (overflow)
        X = 4'b1111; Y = 4'b0001; Cin = 1'b1;
        #10;
        if (Z !== 4'b0001 || Cout !== 1'b1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule