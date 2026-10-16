`timescale 1ns/1ps

module tb_adder_bcd;
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    // Instantiate the adder_bcd module
    adder_bcd uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Test case 1: 4 + 5 + 0 = 9
        A = 4'b0100; // 4
        B = 4'b0101; // 5
        Cin = 1'b0;
        #10;
        if (Sum !== 4'b1001 || Cout !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 7 + 3 + 0 = 10 (should produce 0 with Cout = 1)
        A = 4'b0111; // 7
        B = 4'b0011; // 3
        Cin = 1'b0;
        #10;
        if (Sum !== 4'b0000 || Cout !== 1'b1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 9 + 1 + 0 = 10 (should produce 0 with Cout = 1)
        A = 4'b1001; // 9
        B = 4'b0001; // 1
        Cin = 1'b0;
        #10;
        if (Sum !== 4'b0000 || Cout !== 1'b1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 5 + 6 + 0 = 11 (should produce 1 with Cout = 1)
        A = 4'b0101; // 5
        B = 4'b0110; // 6
        Cin = 1'b0;
        #10;
        if (Sum !== 4'b0001 || Cout !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: 2 + 3 + 1 = 6
        A = 4'b0010; // 2
        B = 4'b0011; // 3
        Cin = 1'b1;
        #10;
        if (Sum !== 4'b0110 || Cout !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: 8 + 8 + 1 = 17 (should produce 7 with Cout = 1)
        A = 4'b1000; // 8
        B = 4'b1000; // 8
        Cin = 1'b1;
        #10;
        if (Sum !== 4'b0111 || Cout !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule