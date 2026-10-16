`timescale 1ns/1ps

module tb_comparator_2bit;

reg [1:0] a;
reg [1:0] b;
wire equal;
wire greater;
wire less;

comparator_2bit uut (
    .a(a),
    .b(b),
    .equal(equal),
    .greater(greater),
    .less(less)
);

initial begin
    // Test case 1: a = 00, b = 00 (equal)
    a = 2'b00; b = 2'b00;
    #10;
    if (!(equal == 1 && greater == 0 && less == 0)) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a = 01, b = 00 (greater)
    a = 2'b01; b = 2'b00;
    #10;
    if (!(equal == 0 && greater == 1 && less == 0)) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a = 00, b = 01 (less)
    a = 2'b00; b = 2'b01;
    #10;
    if (!(equal == 0 && greater == 0 && less == 1)) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a = 10, b = 01 (greater)
    a = 2'b10; b = 2'b01;
    #10;
    if (!(equal == 0 && greater == 1 && less == 0)) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: a = 01, b = 10 (less)
    a = 2'b01; b = 2'b10;
    #10;
    if (!(equal == 0 && greater == 0 && less == 1)) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: a = 11, b = 11 (equal)
    a = 2'b11; b = 2'b11;
    #10;
    if (!(equal == 1 && greater == 0 && less == 0)) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule