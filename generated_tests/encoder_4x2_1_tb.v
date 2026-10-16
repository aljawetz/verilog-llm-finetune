`timescale 1ns/1ps

module tb_encoder_4x2;

reg [3:0] w;
reg en;
wire [1:0] y;

// Instantiate the encoder_4x2 module
encoder_4x2 uut (
    .w(w),
    .en(en),
    .y(y)
);

initial begin
    // Initialize inputs
    w = 4'b0000;
    en = 0;

    // Test case 1: Enable with input 0001
    en = 1;
    w = 4'b0001;
    #10;
    if (y !== 2'b00) begin
        $display("FAIL: Expected y = 00 for w = 0001 when en = 1, got y = %b", y);
        $finish;
    end

    // Test case 2: Enable with input 0010
    w = 4'b0010;
    #10;
    if (y !== 2'b01) begin
        $display("FAIL: Expected y = 01 for w = 0010 when en = 1, got y = %b", y);
        $finish;
    end

    // Test case 3: Enable with input 0100
    w = 4'b0100;
    #10;
    if (y !== 2'b10) begin
        $display("FAIL: Expected y = 10 for w = 0100 when en = 1, got y = %b", y);
        $finish;
    end

    // Test case 4: Enable with input 1000
    w = 4'b1000;
    #10;
    if (y !== 2'b11) begin
        $display("FAIL: Expected y = 11 for w = 1000 when en = 1, got y = %b", y);
        $finish;
    end

    // Test case 5: Enable with no valid input
    w = 4'b0000; // No valid one-hot input
    #10;
    if (y !== 2'bxx) begin
        $display("FAIL: Expected y = xx for w = 0000 when en = 1, got y = %b", y);
        $finish;
    end

    // Test case 6: Disable the encoder
    en = 0;
    w = 4'b0010; // Input should not matter
    #10;
    if (y !== 2'bxx) begin
        $display("FAIL: Expected y = xx when en = 0, got y = %b", y);
        $finish;
    end

    // Test case 7: Check for unknown output when no input is active and enabled
    en = 1;
    w = 4'b1111; // Invalid one-hot input
    #10;
    if (y !== 2'bxx) begin
        $display("FAIL: Expected y = xx for invalid input when en = 1, got y = %b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule