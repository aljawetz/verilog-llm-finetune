`timescale 1ns/1ps

module tb_encoder_8x3_wo_priority;

reg [7:0] i;
reg en;
wire [2:0] b_out;

// Instantiate the module under test (uut)
encoder_8x3_wo_priority uut (
    .b_out(b_out),
    .i(i),
    .en(en)
);

initial begin
    // Test case 1: Enable with one-hot input 00000001
    en = 1;
    i = 8'b00000001;
    #10;
    if (b_out !== 3'b000) begin
        $display("FAIL: Test case 1 failed, expected 000, got %b", b_out);
        $finish;
    end

    // Test case 2: Enable with one-hot input 00000010
    i = 8'b00000010;
    #10;
    if (b_out !== 3'b001) begin
        $display("FAIL: Test case 2 failed, expected 001, got %b", b_out);
        $finish;
    end

    // Test case 3: Enable with one-hot input 00000100
    i = 8'b00000100;
    #10;
    if (b_out !== 3'b010) begin
        $display("FAIL: Test case 3 failed, expected 010, got %b", b_out);
        $finish;
    end

    // Test case 4: Enable with one-hot input 00001000
    i = 8'b00001000;
    #10;
    if (b_out !== 3'b011) begin
        $display("FAIL: Test case 4 failed, expected 011, got %b", b_out);
        $finish;
    end

    // Test case 5: Enable with one-hot input 00010000
    i = 8'b00010000;
    #10;
    if (b_out !== 3'b100) begin
        $display("FAIL: Test case 5 failed, expected 100, got %b", b_out);
        $finish;
    end

    // Test case 6: Enable with one-hot input 00100000
    i = 8'b00100000;
    #10;
    if (b_out !== 3'b101) begin
        $display("FAIL: Test case 6 failed, expected 101, got %b", b_out);
        $finish;
    end

    // Test case 7: Enable with one-hot input 01000000
    i = 8'b01000000;
    #10;
    if (b_out !== 3'b110) begin
        $display("FAIL: Test case 7 failed, expected 110, got %b", b_out);
        $finish;
    end

    // Test case 8: Enable with one-hot input 10000000
    i = 8'b10000000;
    #10;
    if (b_out !== 3'b111) begin
        $display("FAIL: Test case 8 failed, expected 111, got %b", b_out);
        $finish;
    end

    // Test case 9: Disable the encoder
    en = 0;
    i = 8'b00000001; // Input doesn't matter when disabled
    #10;
    if (b_out !== 3'b000) begin
        $display("FAIL: Test case 9 failed, expected 000, got %b", b_out);
        $finish;
    end

    // Test case 10: Disable the encoder with different input
    i = 8'b00000100; // Input doesn't matter when disabled
    #10;
    if (b_out !== 3'b000) begin
        $display("FAIL: Test case 10 failed, expected 000, got %b", b_out);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule