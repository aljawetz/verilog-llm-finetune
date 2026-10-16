`timescale 1ns/1ps

module tb_n_bit_comparator;

reg [7:0] a;
reg [7:0] b;
wire lesser;
wire greater;
wire equal;

// Instantiate the module under test (uut)
n_bit_comparator uut (
    .a(a),
    .b(b),
    .lesser(lesser),
    .greater(greater),
    .equal(equal)
);

initial begin
    // Test case 1: a < b
    a = 8'h01; // 1
    b = 8'h02; // 2
    #10;
    if (lesser !== 1'b1 || greater !== 1'b0 || equal !== 1'b0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a > b
    a = 8'h03; // 3
    b = 8'h02; // 2
    #10;
    if (lesser !== 1'b0 || greater !== 1'b1 || equal !== 1'b0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a == b
    a = 8'h04; // 4
    b = 8'h04; // 4
    #10;
    if (lesser !== 1'b0 || greater !== 1'b0 || equal !== 1'b1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a < b (boundary case)
    a = 8'h00; // 0
    b = 8'h01; // 1
    #10;
    if (lesser !== 1'b1 || greater !== 1'b0 || equal !== 1'b0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: a > b (boundary case)
    a = 8'hFF; // 255
    b = 8'hFE; // 254
    #10;
    if (lesser !== 1'b0 || greater !== 1'b1 || equal !== 1'b0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule