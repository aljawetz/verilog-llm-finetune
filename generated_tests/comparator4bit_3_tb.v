`timescale 1ns/1ps

module tb_comparator4bit;

reg [3:0] A;
reg [3:0] B;
wire AeB;
wire AgB;
wire AlB;

comparator4bit uut (
    .A(A),
    .B(B),
    .AeB(AeB),
    .AgB(AgB),
    .AlB(AlB)
);

initial begin
    // Test case 1: A = 4'b0000, B = 4'b0000 (Equal)
    A = 4'b0000; B = 4'b0000;
    #10;
    if (AeB !== 1'b1 || AgB !== 1'b0 || AlB !== 1'b0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: A = 4'b0010, B = 4'b0001 (A > B)
    A = 4'b0010; B = 4'b0001;
    #10;
    if (AeB !== 1'b0 || AgB !== 1'b1 || AlB !== 1'b0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: A = 4'b0001, B = 4'b0010 (A < B)
    A = 4'b0001; B = 4'b0010;
    #10;
    if (AeB !== 1'b0 || AgB !== 1'b0 || AlB !== 1'b1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: A = 4'b1111, B = 4'b1111 (Equal)
    A = 4'b1111; B = 4'b1111;
    #10;
    if (AeB !== 1'b1 || AgB !== 1'b0 || AlB !== 1'b0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: A = 4'b1010, B = 4'b0101 (A > B)
    A = 4'b1010; B = 4'b0101;
    #10;
    if (AeB !== 1'b0 || AgB !== 1'b1 || AlB !== 1'b0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: A = 4'b0101, B = 4'b1010 (A < B)
    A = 4'b0101; B = 4'b1010;
    #10;
    if (AeB !== 1'b0 || AgB !== 1'b0 || AlB !== 1'b1) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule