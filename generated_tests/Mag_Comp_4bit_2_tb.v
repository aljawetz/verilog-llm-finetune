`timescale 1ns/1ps

module tb_Mag_Comp_4bit;

    reg [3:0] A;
    reg [3:0] B;
    wire Y1, Y2, Y3;

    // Instantiate the module under test
    Mag_Comp_4bit uut (
        .A(A),
        .B(B),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3)
    );

    initial begin
        // Test case 1: A < B
        A = 4'b0010; // 2
        B = 4'b0100; // 4
        #10;
        if (Y1 !== 1'b1 || Y2 !== 1'b0 || Y3 !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: A > B
        A = 4'b0110; // 6
        B = 4'b0011; // 3
        #10;
        if (Y1 !== 1'b0 || Y2 !== 1'b0 || Y3 !== 1'b1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: A == B
        A = 4'b0101; // 5
        B = 4'b0101; // 5
        #10;
        if (Y1 !== 1'b0 || Y2 !== 1'b1 || Y3 !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: A < B (edge case)
        A = 4'b0000; // 0
        B = 4'b0001; // 1
        #10;
        if (Y1 !== 1'b1 || Y2 !== 1'b0 || Y3 !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: A > B (edge case)
        A = 4'b1111; // 15
        B = 4'b0000; // 0
        #10;
        if (Y1 !== 1'b0 || Y2 !== 1'b0 || Y3 !== 1'b1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: A == B (edge case)
        A = 4'b0000; // 0
        B = 4'b0000; // 0
        #10;
        if (Y1 !== 1'b0 || Y2 !== 1'b1 || Y3 !== 1'b0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule