`timescale 1ns/1ps

module tb_comp;

reg a, b;
wire [2:0] y;

// Instantiate the module under test (uut)
comp uut (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    // Test case 1: a = 0, b = 0 (Equal)
    a = 0; b = 0;
    #10;
    if (y !== 3'b100) begin
        $display("FAIL: Test case 1 failed, expected 100, got %b", y);
        $finish;
    end

    // Test case 2: a = 0, b = 1 (a < b)
    a = 0; b = 1;
    #10;
    if (y !== 3'b010) begin
        $display("FAIL: Test case 2 failed, expected 010, got %b", y);
        $finish;
    end

    // Test case 3: a = 1, b = 0 (a > b)
    a = 1; b = 0;
    #10;
    if (y !== 3'b001) begin
        $display("FAIL: Test case 3 failed, expected 001, got %b", y);
        $finish;
    end

    // Test case 4: a = 1, b = 1 (Equal)
    a = 1; b = 1;
    #10;
    if (y !== 3'b100) begin
        $display("FAIL: Test case 4 failed, expected 100, got %b", y);
        $finish;
    end

    // Test case 5: a = 0, b = 0 (Equal)
    a = 0; b = 0;
    #10;
    if (y !== 3'b100) begin
        $display("FAIL: Test case 5 failed, expected 100, got %b", y);
        $finish;
    end

    // Test case 6: a = 1, b = 1 (Equal)
    a = 1; b = 1;
    #10;
    if (y !== 3'b100) begin
        $display("FAIL: Test case 6 failed, expected 100, got %b", y);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule