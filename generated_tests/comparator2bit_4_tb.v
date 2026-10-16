`timescale 1ns/1ps

module tb_comparator2bit;

reg [1:0] A;
reg [1:0] B;
wire AeB;
wire AgB;
wire AlB;

comparator2bit uut (
    .A(A),
    .B(B),
    .AeB(AeB),
    .AgB(AgB),
    .AlB(AlB)
);

initial begin
    // Test case 1: A = 00, B = 00 (Equal)
    A = 2'b00; B = 2'b00;
    #10;
    if (AeB !== 1'b1 || AgB !== 1'b0 || AlB !== 1'b0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: A = 01, B = 00 (A > B)
    A = 2'b01; B = 2'b00;
    #10;
    if (AeB !== 1'b0 || AgB !== 1'b1 || AlB !== 1'b0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: A = 00, B = 01 (A < B)
    A = 2'b00; B = 2'b01;
    #10;
    if (AeB !== 1'b0 || AgB !== 1'b0 || AlB !== 1'b1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: A = 10, B = 01 (A > B)
    A = 2'b10; B = 2'b01;
    #10;
    if (AeB !== 1'b0 || AgB !== 1'b1 || AlB !== 1'b0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: A = 01, B = 10 (A < B)
    A = 2'b01; B = 2'b10;
    #10;
    if (AeB !== 1'b0 || AgB !== 1'b0 || AlB !== 1'b1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: A = 11, B = 11 (Equal)
    A = 2'b11; B = 2'b11;
    #10;
    if (AeB !== 1'b1 || AgB !== 1'b0 || AlB !== 1'b0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // Test case 7: A = 10, B = 10 (Equal)
    A = 2'b10; B = 2'b10;
    #10;
    if (AeB !== 1'b1 || AgB !== 1'b0 || AlB !== 1'b0) begin
        $display("FAIL: Test case 7 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule