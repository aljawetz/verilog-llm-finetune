`timescale 1ns/1ps

module tb_comparator1bit;

reg A, B;
wire AeB, AgB, AlB;

// Instantiate the module under test (uut)
comparator1bit uut (
    .A(A),
    .B(B),
    .AeB(AeB),
    .AgB(AgB),
    .AlB(AlB)
);

initial begin
    // Test case 1: A = 0, B = 0
    A = 0; B = 0;
    #10;
    if (AeB !== 1'b1 || AgB !== 1'b0 || AlB !== 1'b0) begin
        $display("FAIL: Test case 1 failed (A=0, B=0)");
        $finish;
    end

    // Test case 2: A = 0, B = 1
    A = 0; B = 1;
    #10;
    if (AeB !== 1'b0 || AgB !== 1'b0 || AlB !== 1'b1) begin
        $display("FAIL: Test case 2 failed (A=0, B=1)");
        $finish;
    end

    // Test case 3: A = 1, B = 0
    A = 1; B = 0;
    #10;
    if (AeB !== 1'b0 || AgB !== 1'b1 || AlB !== 1'b0) begin
        $display("FAIL: Test case 3 failed (A=1, B=0)");
        $finish;
    end

    // Test case 4: A = 1, B = 1
    A = 1; B = 1;
    #10;
    if (AeB !== 1'b1 || AgB !== 1'b0 || AlB !== 1'b0) begin
        $display("FAIL: Test case 4 failed (A=1, B=1)");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule