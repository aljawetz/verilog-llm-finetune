`timescale 1ns/1ps

module tb_carry_lookahead_adder;

    reg [7:0] A;
    reg [7:0] B;
    reg Cin;
    wire [7:0] Sum;
    wire Cout;

    // Instantiate the carry lookahead adder
    carry_lookahead_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Test case 1: A = 8'h00, B = 8'h00, Cin = 0
        A = 8'h00; B = 8'h00; Cin = 0;
        #10;
        if (Sum !== 8'h00 || Cout !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: A = 8'hFF, B = 8'h01, Cin = 0
        A = 8'hFF; B = 8'h01; Cin = 0;
        #10;
        if (Sum !== 8'h00 || Cout !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: A = 8'hAA, B = 8'h55, Cin = 0
        A = 8'hAA; B = 8'h55; Cin = 0;
        #10;
        if (Sum !== 8'hFF || Cout !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: A = 8'h01, B = 8'h01, Cin = 1
        A = 8'h01; B = 8'h01; Cin = 1;
        #10;
        if (Sum !== 8'h01 || Cout !== 0) $display("FAIL: Test case 4 failed");

        // Test case 5: A = 8'h7F, B = 8'h01, Cin = 1
        A = 8'h7F; B = 8'h01; Cin = 1;
        #10;
        if (Sum !== 8'h80 || Cout !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: A = 8'hFF, B = 8'hFF, Cin = 1
        A = 8'hFF; B = 8'hFF; Cin = 1;
        #10;
        if (Sum !== 8'hFE || Cout !== 1) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule