`timescale 1ns/1ps

module tb_digi_cmp;

reg [3:0] a;
reg [3:0] b;
wire l_g;
wire e;

// Instantiate the module under test (uut)
digi_cmp uut (
    .a(a),
    .b(b),
    .l_g(l_g),
    .e(e)
);

// Test procedure
initial begin
    // Test case 1: a < b
    a = 4'b0010; // 2
    b = 4'b0100; // 4
    #10;
    if (e !== 0 || l_g !== 1) begin
        $display("FAIL: Test case 1 failed (a < b)");
        $finish;
    end

    // Test case 2: a > b
    a = 4'b0100; // 4
    b = 4'b0010; // 2
    #10;
    if (e !== 0 || l_g !== 0) begin
        $display("FAIL: Test case 2 failed (a > b)");
        $finish;
    end

    // Test case 3: a == b
    a = 4'b0011; // 3
    b = 4'b0011; // 3
    #10;
    if (e !== 1 || l_g !== 1'bX) begin
        $display("FAIL: Test case 3 failed (a == b)");
        $finish;
    end

    // Test case 4: a < b (different values)
    a = 4'b0001; // 1
    b = 4'b0010; // 2
    #10;
    if (e !== 0 || l_g !== 1) begin
        $display("FAIL: Test case 4 failed (a < b)");
        $finish;
    end

    // Test case 5: a > b (different values)
    a = 4'b1000; // 8
    b = 4'b0111; // 7
    #10;
    if (e !== 0 || l_g !== 0) begin
        $display("FAIL: Test case 5 failed (a > b)");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule