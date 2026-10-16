`timescale 1ns/1ps

module tb_encoder_8to3;

reg [7:0] y;
reg en;
wire [2:0] d;

// Instantiate the module under test (uut)
encoder_8to3 uut (
    .y(y),
    .en(en),
    .d(d)
);

initial begin
    // Initialize inputs
    y = 8'b00000000;
    en = 0;

    // Test case 1: Disabled encoder
    #10;
    if (d !== 3'd0) begin
        $display("FAIL: Test case 1 failed, expected d=0 when en=0");
        $finish;
    end

    // Enable the encoder
    en = 1;

    // Test case 2: Valid input
    y = 8'b00000001; // Should output 3'd0
    #10;
    if (d !== 3'd0) begin
        $display("FAIL: Test case 2 failed, expected d=0 for input 00000001");
        $finish;
    end

    // Test case 3: Valid input
    y = 8'b00000010; // Should output 3'd1
    #10;
    if (d !== 3'd1) begin
        $display("FAIL: Test case 3 failed, expected d=1 for input 00000010");
        $finish;
    end

    // Test case 4: Valid input
    y = 8'b00000100; // Should output 3'd2
    #10;
    if (d !== 3'd2) begin
        $display("FAIL: Test case 4 failed, expected d=2 for input 00000100");
        $finish;
    end

    // Test case 5: Valid input
    y = 8'b00001000; // Should output 3'd3
    #10;
    if (d !== 3'd3) begin
        $display("FAIL: Test case 5 failed, expected d=3 for input 00001000");
        $finish;
    end

    // Test case 6: Valid input
    y = 8'b00010000; // Should output 3'd4
    #10;
    if (d !== 3'd4) begin
        $display("FAIL: Test case 6 failed, expected d=4 for input 00010000");
        $finish;
    end

    // Test case 7: Valid input
    y = 8'b00100000; // Should output 3'd5
    #10;
    if (d !== 3'd5) begin
        $display("FAIL: Test case 7 failed, expected d=5 for input 00100000");
        $finish;
    end

    // Test case 8: Valid input
    y = 8'b01000000; // Should output 3'd6
    #10;
    if (d !== 3'd6) begin
        $display("FAIL: Test case 8 failed, expected d=6 for input 01000000");
        $finish;
    end

    // Test case 9: Valid input
    y = 8'b10000000; // Should output 3'd7
    #10;
    if (d !== 3'd7) begin
        $display("FAIL: Test case 9 failed, expected d=7 for input 10000000");
        $finish;
    end

    // Test case 10: Invalid input (multiple bits set)
    y = 8'b00000011; // Invalid input, should output 3'd0
    #10;
    if (d !== 3'd0) begin
        $display("FAIL: Test case 10 failed, expected d=0 for invalid input 00000011");
        $finish;
    end

    // Test case 11: Invalid input (multiple bits set)
    y = 8'b11111111; // Invalid input, should output 3'd0
    #10;
    if (d !== 3'd0) begin
        $display("FAIL: Test case 11 failed, expected d=0 for invalid input 11111111");
        $finish;
    end

    // Final check: Disabled encoder again
    en = 0;
    y = 8'b00000001; // Should output 3'd0
    #10;
    if (d !== 3'd0) begin
        $display("FAIL: Final check failed, expected d=0 when en=0");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule