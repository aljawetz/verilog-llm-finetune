`timescale 1ns/1ps

module tb_comparator_bh;

reg [3:0] a;
reg [3:0] b;
wire [2:0] y;

// Instantiate the module under test (uut)
comparator_bh uut (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    // Test case 1: a > b
    a = 4'b1010; // 10
    b = 4'b0111; // 7
    #10;
    if (y !== 3'b100) $display("FAIL: Test case 1 failed (a > b)");
    
    // Test case 2: a < b
    a = 4'b0011; // 3
    b = 4'b0100; // 4
    #10;
    if (y !== 3'b001) $display("FAIL: Test case 2 failed (a < b)");
    
    // Test case 3: a == b
    a = 4'b1111; // 15
    b = 4'b1111; // 15
    #10;
    if (y !== 3'b010) $display("FAIL: Test case 3 failed (a == b)");
    
    // Test case 4: a < b
    a = 4'b0000; // 0
    b = 4'b0001; // 1
    #10;
    if (y !== 3'b001) $display("FAIL: Test case 4 failed (a < b)");

    // Test case 5: a > b
    a = 4'b0110; // 6
    b = 4'b0010; // 2
    #10;
    if (y !== 3'b100) $display("FAIL: Test case 5 failed (a > b)");

    // Test case 6: a == b
    a = 4'b0101; // 5
    b = 4'b0101; // 5
    #10;
    if (y !== 3'b010) $display("FAIL: Test case 6 failed (a == b)");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule