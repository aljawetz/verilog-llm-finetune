`timescale 1ns/1ps

module tb_prio_encoder8x3;

reg en;
reg [7:0] d;
wire [2:0] y;

// Instantiate the module under test
prio_encoder8x3 uut (
    .en(en),
    .d(d),
    .y(y)
);

// Clock generation (not needed for this module but included for completeness)
reg clk;
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
end

// Test sequence
initial begin
    // Test case 1: Enable with highest bit set
    en = 1;
    d = 8'b10000000; // Input: 128
    #10;
    if (y !== 3'b111) begin
        $display("FAIL: Expected y=3'b111 for input 8'b10000000, got y=%b", y);
        $finish;
    end

    // Test case 2: Enable with second highest bit set
    d = 8'b01000000; // Input: 64
    #10;
    if (y !== 3'b110) begin
        $display("FAIL: Expected y=3'b110 for input 8'b01000000, got y=%b", y);
        $finish;
    end

    // Test case 3: Enable with middle bit set
    d = 8'b00100000; // Input: 32
    #10;
    if (y !== 3'b101) begin
        $display("FAIL: Expected y=3'b101 for input 8'b00100000, got y=%b", y);
        $finish;
    end

    // Test case 4: Enable with lower bit set
    d = 8'b00000010; // Input: 2
    #10;
    if (y !== 3'b001) begin
        $display("FAIL: Expected y=3'b001 for input 8'b00000010, got y=%b", y);
        $finish;
    end

    // Test case 5: Enable with no bits set
    d = 8'b00000000; // Input: 0
    #10;
    if (y !== 3'b000) begin
        $display("FAIL: Expected y=3'b000 for input 8'b00000000, got y=%b", y);
        $finish;
    end

    // Test case 6: Disable the encoder
    en = 0;
    #10;
    if (y !== 3'bzzz) begin
        $display("FAIL: Expected y=3'bzzz when en=0, got y=%b", y);
        $finish;
    end

    // Test case 7: Re-enable and set a different bit
    en = 1;
    d = 8'b00001000; // Input: 8
    #10;
    if (y !== 3'b011) begin
        $display("FAIL: Expected y=3'b011 for input 8'b00001000, got y=%b", y);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule