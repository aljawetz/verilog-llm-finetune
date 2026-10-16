`timescale 1ns/1ps

module tb_BMU;

reg [1:0] currentState;
reg inputBit;
reg [1:0] rec_code;
wire [2:0] hamming_dist;

BMU uut (
    .currentState(currentState),
    .inputBit(inputBit),
    .rec_code(rec_code),
    .hamming_dist(hamming_dist)
);

initial begin
    // Test case 1: currentState = 0, inputBit = 0, rec_code = 00
    currentState = 2'd0; inputBit = 0; rec_code = 2'b00; #10;
    if (hamming_dist !== 3'd0) $display("FAIL: Test case 1 failed, expected 0, got %d", hamming_dist);

    // Test case 2: currentState = 0, inputBit = 1, rec_code = 11
    currentState = 2'd0; inputBit = 1; rec_code = 2'b11; #10;
    if (hamming_dist !== 3'd0) $display("FAIL: Test case 2 failed, expected 0, got %d", hamming_dist);

    // Test case 3: currentState = 1, inputBit = 0, rec_code = 11
    currentState = 2'd1; inputBit = 0; rec_code = 2'b11; #10;
    if (hamming_dist !== 3'd0) $display("FAIL: Test case 3 failed, expected 0, got %d", hamming_dist);

    // Test case 4: currentState = 1, inputBit = 1, rec_code = 00
    currentState = 2'd1; inputBit = 1; rec_code = 2'b00; #10;
    if (hamming_dist !== 3'd0) $display("FAIL: Test case 4 failed, expected 0, got %d", hamming_dist);

    // Test case 5: currentState = 2, inputBit = 0, rec_code = 01
    currentState = 2'd2; inputBit = 0; rec_code = 2'b01; #10;
    if (hamming_dist !== 3'd1) $display("FAIL: Test case 5 failed, expected 1, got %d", hamming_dist);

    // Test case 6: currentState = 2, inputBit = 1, rec_code = 10
    currentState = 2'd2; inputBit = 1; rec_code = 2'b10; #10;
    if (hamming_dist !== 3'd1) $display("FAIL: Test case 6 failed, expected 1, got %d", hamming_dist);

    // Test case 7: currentState = 3, inputBit = 0, rec_code = 10
    currentState = 2'd3; inputBit = 0; rec_code = 2'b10; #10;
    if (hamming_dist !== 3'd1) $display("FAIL: Test case 7 failed, expected 1, got %d", hamming_dist);

    // Test case 8: currentState = 3, inputBit = 1, rec_code = 01
    currentState = 2'd3; inputBit = 1; rec_code = 2'b01; #10;
    if (hamming_dist !== 3'd1) $display("FAIL: Test case 8 failed, expected 1, got %d", hamming_dist);

    // Test case 9: currentState = 0, inputBit = 0, rec_code = 10
    currentState = 2'd0; inputBit = 0; rec_code = 2'b10; #10;
    if (hamming_dist !== 3'd2) $display("FAIL: Test case 9 failed, expected 2, got %d", hamming_dist);

    // Test case 10: currentState = 1, inputBit = 1, rec_code = 11
    currentState = 2'd1; inputBit = 1; rec_code = 2'b11; #10;
    if (hamming_dist !== 3'd0) $display("FAIL: Test case 10 failed, expected 0, got %d", hamming_dist);

    $display("PASS");
    $finish;
end

endmodule