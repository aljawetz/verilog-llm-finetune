`timescale 1ns/1ps

module tb_decoder_2x4;

reg a;
reg b;
wire [3:0] D;

// Instantiate the module under test
decoder_2x4 uut (
    .a(a),
    .b(b),
    .D(D)
);

initial begin
    // Test case 1: a=0, b=0 -> D should be 0001
    a = 0; b = 0; #10;
    if (D !== 4'b0001) $display("FAIL: Test case 1 failed, expected 0001, got %b", D);

    // Test case 2: a=0, b=1 -> D should be 0010
    a = 0; b = 1; #10;
    if (D !== 4'b0010) $display("FAIL: Test case 2 failed, expected 0010, got %b", D);

    // Test case 3: a=1, b=0 -> D should be 0100
    a = 1; b = 0; #10;
    if (D !== 4'b0100) $display("FAIL: Test case 3 failed, expected 0100, got %b", D);

    // Test case 4: a=1, b=1 -> D should be 1000
    a = 1; b = 1; #10;
    if (D !== 4'b1000) $display("FAIL: Test case 4 failed, expected 1000, got %b", D);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule