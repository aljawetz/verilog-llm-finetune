`timescale 1ns/1ps

module tb_comp;

reg a;
reg b;
wire [2:0] y;

// Instantiate the module under test (uut)
comp uut (
    .a(a),
    .b(b),
    .y(y)
);

// Test sequence
initial begin
    // Test case 1: a == b
    a = 1'b0; b = 1'b0; #10;
    if (y !== 3'b100) begin
        $display("FAIL: Test case 1 failed (a == b)");
        $finish;
    end

    // Test case 2: a < b
    a = 1'b0; b = 1'b1; #10;
    if (y !== 3'b010) begin
        $display("FAIL: Test case 2 failed (a < b)");
        $finish;
    end

    // Test case 3: a > b
    a = 1'b1; b = 1'b0; #10;
    if (y !== 3'b001) begin
        $display("FAIL: Test case 3 failed (a > b)");
        $finish;
    end

    // Test case 4: a == b (both 1)
    a = 1'b1; b = 1'b1; #10;
    if (y !== 3'b100) begin
        $display("FAIL: Test case 4 failed (a == b)");
        $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
end

endmodule