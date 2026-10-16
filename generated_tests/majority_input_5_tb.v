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
    // Test case 1: All zeros
    in = 8'b00000000; #10;
    if (out !== 1'b0) $display("FAIL: Test case 1 failed, expected 0, got %b", out);

    // Test case 2: One high bit
    in = 8'b00000001; #10;
    if (out !== 1'b0) $display("FAIL: Test case 2 failed, expected 0, got %b", out);

    // Test case 3: Two high bits in first group
    in = 8'b00000111; #10;
    if (out !== 1'b1) $display("FAIL: Test case 3 failed, expected 1, got %b", out);

    // Test case 4: Two high bits in second group
    in = 8'b11100000; #10;
    if (out !== 1'b1) $display("FAIL: Test case 4 failed, expected 1, got %b", out);

    // Test case 5: Majority from both groups and seventh bit low
    in = 8'b11101100; #10;
    if (out !== 1'b1) $display("FAIL: Test case 5 failed, expected 1, got %b", out);

    // Test case 6: Majority from both groups and seventh bit high
    in = 8'b11111100; #10;
    if (out !== 1'b1) $display("FAIL: Test case 6 failed, expected 1, got %b", out);

    // Test case 7: No majority
    in = 8'b10101010; #10;
    if (out !== 1'b0) $display("FAIL: Test case 7 failed, expected 0, got %b", out);

    // Test case 8: All ones
    in = 8'b11111111; #10;
    if (out !== 1'b1) $display("FAIL: Test case 8 failed, expected 1, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule