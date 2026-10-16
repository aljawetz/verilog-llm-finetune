`timescale 1ns/1ps

module tb_comp;

reg [3:0] a;
reg [3:0] b;
wire [2:0] y;

// Instantiate the module under test (uut)
comp uut (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    // Test case 1: a = 4'b0000, b = 4'b0000 (Equal)
    a = 4'b0000; b = 4'b0000;
    #10;
    if (y !== 3'b100) $display("FAIL: Test case 1 failed, expected 100, got %b", y);

    // Test case 2: a = 4'b0010, b = 4'b0001 (Greater)
    a = 4'b0010; b = 4'b0001;
    #10;
    if (y !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", y);

    // Test case 3: a = 4'b0001, b = 4'b0010 (Less)
    a = 4'b0001; b = 4'b0010;
    #10;
    if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", y);

    // Test case 4: a = 4'b1111, b = 4'b1111 (Equal)
    a = 4'b1111; b = 4'b1111;
    #10;
    if (y !== 3'b100) $display("FAIL: Test case 4 failed, expected 100, got %b", y);

    // Test case 5: a = 4'b1000, b = 4'b0111 (Greater)
    a = 4'b1000; b = 4'b0111;
    #10;
    if (y !== 3'b001) $display("FAIL: Test case 5 failed, expected 001, got %b", y);

    // Test case 6: a = 4'b0111, b = 4'b1000 (Less)
    a = 4'b0111; b = 4'b1000;
    #10;
    if (y !== 3'b010) $display("FAIL: Test case 6 failed, expected 010, got %b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule