`timescale 1ns/1ps

module tb_n_bit_comparator;

reg [15:0] a, b;
wire lt, gt, eq;

// Instantiate the module under test (uut)
n_bit_comparator uut (
    .a(a),
    .b(b),
    .lt(lt),
    .gt(gt),
    .eq(eq)
);

// Test procedure
initial begin
    // Test case 1: a > b
    a = 16'h0002; 
    b = 16'h0001; 
    #10;
    if (gt !== 1 || lt !== 0 || eq !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a < b
    a = 16'h0001; 
    b = 16'h0002; 
    #10;
    if (gt !== 0 || lt !== 1 || eq !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a == b
    a = 16'h0001; 
    b = 16'h0001; 
    #10;
    if (gt !== 0 || lt !== 0 || eq !== 1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a = 0, b = 0
    a = 16'h0000; 
    b = 16'h0000; 
    #10;
    if (gt !== 0 || lt !== 0 || eq !== 1) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: a = max, b = min
    a = 16'hFFFF; 
    b = 16'h0000; 
    #10;
    if (gt !== 1 || lt !== 0 || eq !== 0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: a = min, b = max
    a = 16'h0000; 
    b = 16'hFFFF; 
    #10;
    if (gt !== 0 || lt !== 1 || eq !== 0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule