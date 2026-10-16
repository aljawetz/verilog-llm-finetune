`timescale 1ns/1ps

module tb_two_bit_comparator;

reg [1:0] a;
reg [1:0] b;
wire greater;
wire equal;
wire lesser;

// Instantiate the module under test (uut)
two_bit_comparator uut (
    .a(a),
    .b(b),
    .greater(greater),
    .equal(equal),
    .lesser(lesser)
);

initial begin
    // Test case 1: a = 00, b = 00 (equal)
    a = 2'b00; b = 2'b00;
    #10;
    if (greater !== 0 || equal !== 1 || lesser !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a = 01, b = 00 (greater)
    a = 2'b01; b = 2'b00;
    #10;
    if (greater !== 1 || equal !== 0 || lesser !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a = 00, b = 01 (lesser)
    a = 2'b00; b = 2'b01;
    #10;
    if (greater !== 0 || equal !== 0 || lesser !== 1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a = 10, b = 01 (greater)
    a = 2'b10; b = 2'b01;
    #10;
    if (greater !== 1 || equal !== 0 || lesser !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: a = 01, b = 10 (lesser)
    a = 2'b01; b = 2'b10;
    #10;
    if (greater !== 0 || equal !== 0 || lesser !== 1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: a = 11, b = 11 (equal)
    a = 2'b11; b = 2'b11;
    #10;
    if (greater !== 0 || equal !== 1 || lesser !== 0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // Test case 7: a = 10, b = 10 (equal)
    a = 2'b10; b = 2'b10;
    #10;
    if (greater !== 0 || equal !== 1 || lesser !== 0) begin
        $display("FAIL: Test case 7 failed");
        $finish;
    end

    // Test case 8: a = 11, b = 10 (greater)
    a = 2'b11; b = 2'b10;
    #10;
    if (greater !== 1 || equal !== 0 || lesser !== 0) begin
        $display("FAIL: Test case 8 failed");
        $finish;
    end

    // Test case 9: a = 10, b = 11 (lesser)
    a = 2'b10; b = 2'b11;
    #10;
    if (greater !== 0 || equal !== 0 || lesser !== 1) begin
        $display("FAIL: Test case 9 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule