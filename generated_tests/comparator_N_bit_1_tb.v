`timescale 1ns/1ps

module tb_comparator_N_bit;

reg [3:0] num_A;
reg [3:0] num_B;
wire greater;
wire lesser;
wire equal;

// Instantiate the module under test
comparator_N_bit uut (
    .num_A(num_A),
    .num_B(num_B),
    .greater(greater),
    .lesser(lesser),
    .equal(equal)
);

initial begin
    // Test case 1: num_A > num_B
    num_A = 4'b1010; // 10
    num_B = 4'b0111; // 7
    #10;
    if (greater !== 1'b1 || lesser !== 1'b0 || equal !== 1'b0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: num_A < num_B
    num_A = 4'b0011; // 3
    num_B = 4'b0100; // 4
    #10;
    if (greater !== 1'b0 || lesser !== 1'b1 || equal !== 1'b0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: num_A == num_B
    num_A = 4'b1100; // 12
    num_B = 4'b1100; // 12
    #10;
    if (greater !== 1'b0 || lesser !== 1'b0 || equal !== 1'b1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: num_A > num_B (different values)
    num_A = 4'b1111; // 15
    num_B = 4'b0000; // 0
    #10;
    if (greater !== 1'b1 || lesser !== 1'b0 || equal !== 1'b0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: num_A < num_B (different values)
    num_A = 4'b0001; // 1
    num_B = 4'b1000; // 8
    #10;
    if (greater !== 1'b0 || lesser !== 1'b1 || equal !== 1'b0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule