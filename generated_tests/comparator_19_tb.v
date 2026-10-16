`timescale 1ns/1ps

module tb_comparator;

reg [3:0] A, B;
wire equal, less, greater;

// Instantiate the module under test
comparator uut (
    .A(A),
    .B(B),
    .equal(equal),
    .less(less),
    .greater(greater)
);

initial begin
    // Test case 1: A = 4'b0000, B = 4'b0000 (Equal)
    A = 4'b0000; B = 4'b0000;
    #10;
    if (!(equal == 1'b1 && less == 1'b0 && greater == 1'b0)) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: A = 4'b0001, B = 4'b0000 (A > B)
    A = 4'b0001; B = 4'b0000;
    #10;
    if (!(equal == 1'b0 && less == 1'b0 && greater == 1'b1)) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: A = 4'b0000, B = 4'b0001 (A < B)
    A = 4'b0000; B = 4'b0001;
    #10;
    if (!(equal == 1'b0 && less == 1'b1 && greater == 1'b0)) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: A = 4'b1111, B = 4'b1111 (Equal)
    A = 4'b1111; B = 4'b1111;
    #10;
    if (!(equal == 1'b1 && less == 1'b0 && greater == 1'b0)) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: A = 4'b1000, B = 4'b0111 (A > B)
    A = 4'b1000; B = 4'b0111;
    #10;
    if (!(equal == 1'b0 && less == 1'b0 && greater == 1'b1)) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: A = 4'b0111, B = 4'b1000 (A < B)
    A = 4'b0111; B = 4'b1000;
    #10;
    if (!(equal == 1'b0 && less == 1'b1 && greater == 1'b0)) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule