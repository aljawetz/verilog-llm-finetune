`timescale 1ns/1ps

module tb_comp;

reg [3:0] a;
reg [3:0] b;
wire less;
wire greater;
wire equal;

// Instantiate the module under test
comp uut (
    .a(a),
    .b(b),
    .less(less),
    .greater(greater),
    .equal(equal)
);

initial begin
    // Test case 1: a < b
    a = 4'b0010; b = 4'b0100; // 2 < 4
    #10;
    if (less !== 1 || greater !== 0 || equal !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a > b
    a = 4'b0110; b = 4'b0011; // 6 > 3
    #10;
    if (less !== 0 || greater !== 1 || equal !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a == b
    a = 4'b0101; b = 4'b0101; // 5 == 5
    #10;
    if (less !== 0 || greater !== 0 || equal !== 1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a < b (different bits)
    a = 4'b0001; b = 4'b0010; // 1 < 2
    #10;
    if (less !== 1 || greater !== 0 || equal !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: a > b (different bits)
    a = 4'b1000; b = 4'b0111; // 8 > 7
    #10;
    if (less !== 0 || greater !== 1 || equal !== 0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: a = 0, b = 0
    a = 4'b0000; b = 4'b0000; // 0 == 0
    #10;
    if (less !== 0 || greater !== 0 || equal !== 1) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // Test case 7: a = 15, b = 0
    a = 4'b1111; b = 4'b0000; // 15 > 0
    #10;
    if (less !== 0 || greater !== 1 || equal !== 0) begin
        $display("FAIL: Test case 7 failed");
        $finish;
    end

    // Test case 8: a = 0, b = 15
    a = 4'b0000; b = 4'b1111; // 0 < 15
    #10;
    if (less !== 1 || greater !== 0 || equal !== 0) begin
        $display("FAIL: Test case 8 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule