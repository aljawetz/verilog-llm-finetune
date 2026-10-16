`timescale 1ns/1ps

module tb_n_bit_comparator;

reg [15:0] a;
reg [15:0] b;
wire lt;
wire gt;
wire eq;

// Instantiate the module under test (uut)
n_bit_comparator uut (
    .a(a),
    .b(b),
    .lt(lt),
    .gt(gt),
    .eq(eq)
);

initial begin
    // Test case 1: a > b
    a = 16'h0002; // 2
    b = 16'h0001; // 1
    #10;
    if (gt !== 1 || lt !== 0 || eq !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a < b
    a = 16'h0001; // 1
    b = 16'h0002; // 2
    #10;
    if (gt !== 0 || lt !== 1 || eq !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a == b
    a = 16'h0001; // 1
    b = 16'h0001; // 1
    #10;
    if (gt !== 0 || lt !== 0 || eq !== 1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a > b (different values)
    a = 16'h00FF; // 255
    b = 16'h00AA; // 170
    #10;
    if (gt !== 1 || lt !== 0 || eq !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: a < b (different values)
    a = 16'h00AA; // 170
    b = 16'h00FF; // 255
    #10;
    if (gt !== 0 || lt !== 1 || eq !== 0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: a == b (different values)
    a = 16'h00AA; // 170
    b = 16'h00AA; // 170
    #10;
    if (gt !== 0 || lt !== 0 || eq !== 1) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule