`timescale 1ns/1ps

module tb_COMP1;

reg a, b;
wire e, g, l;

// Instantiate the module under test
COMP1 uut (
    .e(e),
    .g(g),
    .l(l),
    .a(a),
    .b(b)
);

initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (e !== 1 || g !== 0 || l !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (e !== 0 || g !== 0 || l !== 1) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (e !== 0 || g !== 1 || l !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (e !== 1 || g !== 0 || l !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule