`timescale 1ns/1ps

module tb_comparator;
    reg [2:0] A;
    reg [2:0] B;
    wire GT, EQ, LT;

    // Instantiate the comparator module
    comparator uut (
        .A(A),
        .B(B),
        .GT(GT),
        .EQ(EQ),
        .LT(LT)
    );

    initial begin
        // Test case 1: A > B
        A = 3'b101; B = 3'b011; #10;
        if (GT !== 1 || EQ !== 0 || LT !== 0) begin
            $display("FAIL: Test case 1 failed (A > B)");
            $finish;
        end

        // Test case 2: A < B
        A = 3'b011; B = 3'b101; #10;
        if (GT !== 0 || EQ !== 0 || LT !== 1) begin
            $display("FAIL: Test case 2 failed (A < B)");
            $finish;
        end

        // Test case 3: A == B
        A = 3'b110; B = 3'b110; #10;
        if (GT !== 0 || EQ !== 1 || LT !== 0) begin
            $display("FAIL: Test case 3 failed (A == B)");
            $finish;
        end

        // Test case 4: A > B (different values)
        A = 3'b111; B = 3'b100; #10;
        if (GT !== 1 || EQ !== 0 || LT !== 0) begin
            $display("FAIL: Test case 4 failed (A > B)");
            $finish;
        end

        // Test case 5: A < B (different values)
        A = 3'b001; B = 3'b010; #10;
        if (GT !== 0 || EQ !== 0 || LT !== 1) begin
            $display("FAIL: Test case 5 failed (A < B)");
            $finish;
        end

        // Test case 6: A == B (different values)
        A = 3'b000; B = 3'b000; #10;
        if (GT !== 0 || EQ !== 1 || LT !== 0) begin
            $display("FAIL: Test case 6 failed (A == B)");
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule