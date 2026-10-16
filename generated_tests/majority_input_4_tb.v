`timescale 1ns/1ps

module tb_majority_input;

reg [7:0] in;
wire out;

// Instantiate the module under test
majority_input uut (
    .in(in),
    .out(out)
);

initial begin
    // Test case 1: All inputs are 0
    in = 8'b00000000; #10;
    if (out !== 1'b0) $display("FAIL: Test case 1 failed, expected 0, got %b", out);

    // Test case 2: One input is 1
    in = 8'b00000001; #10;
    if (out !== 1'b0) $display("FAIL: Test case 2 failed, expected 0, got %b", out);

    // Test case 3: Two inputs are 1 (first majority)
    in = 8'b00000111; #10;
    if (out !== 1'b1) $display("FAIL: Test case 3 failed, expected 1, got %b", out);

    // Test case 4: Two inputs are 1 (second majority)
    in = 8'b11100000; #10;
    if (out !== 1'b1) $display("FAIL: Test case 4 failed, expected 1, got %b", out);

    // Test case 5: Three inputs are 1 (first majority)
    in = 8'b11111100; #10;
    if (out !== 1'b1) $display("FAIL: Test case 5 failed, expected 1, got %b", out);

    // Test case 6: Majority from the seventh bit
    in = 8'b00000010; #10;
    if (out !== 1'b0) $display("FAIL: Test case 6 failed, expected 0, got %b", out);

    // Test case 7: Majority from the seventh bit with two others
    in = 8'b11000010; #10;
    if (out !== 1'b1) $display("FAIL: Test case 7 failed, expected 1, got %b", out);

    // Test case 8: All inputs are 1
    in = 8'b11111111; #10;
    if (out !== 1'b1) $display("FAIL: Test case 8 failed, expected 1, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule