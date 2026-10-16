`timescale 1ns/1ps

module tb_pri_en;

reg [7:0] d;
reg en;
wire [2:0] y;

// Instantiate the module under test
pri_en uut (
    .d(d),
    .y(y),
    .en(en)
);

initial begin
    // Initialize inputs
    d = 8'b00000000;
    en = 0;

    // Test when not enabled
    #10;
    if (y !== 3'bxxx) begin
        $display("FAIL: Output should be undefined when not enabled");
        $finish;
    end

    // Enable the encoder
    en = 1;

    // Test cases
    // Test case 1: Only the least significant bit is active
    d = 8'b00000001; #10;
    if (y !== 3'b000) begin
        $display("FAIL: Expected y=000 for input 00000001");
        $finish;
    end

    // Test case 2: Second least significant bit is active
    d = 8'b00000010; #10;
    if (y !== 3'b001) begin
        $display("FAIL: Expected y=001 for input 00000010");
        $finish;
    end

    // Test case 3: Third least significant bit is active
    d = 8'b00000100; #10;
    if (y !== 3'b010) begin
        $display("FAIL: Expected y=010 for input 00000100");
        $finish;
    end

    // Test case 4: Fourth least significant bit is active
    d = 8'b00001000; #10;
    if (y !== 3'b011) begin
        $display("FAIL: Expected y=011 for input 00001000");
        $finish;
    end

    // Test case 5: Fifth least significant bit is active
    d = 8'b00010000; #10;
    if (y !== 3'b100) begin
        $display("FAIL: Expected y=100 for input 00010000");
        $finish;
    end

    // Test case 6: Sixth least significant bit is active
    d = 8'b00100000; #10;
    if (y !== 3'b101) begin
        $display("FAIL: Expected y=101 for input 00100000");
        $finish;
    end

    // Test case 7: Seventh least significant bit is active
    d = 8'b01000000; #10;
    if (y !== 3'b110) begin
        $display("FAIL: Expected y=110 for input 01000000");
        $finish;
    end

    // Test case 8: Most significant bit is active
    d = 8'b10000000; #10;
    if (y !== 3'b111) begin
        $display("FAIL: Expected y=111 for input 10000000");
        $finish;
    end

    // Test case 9: Multiple bits active (highest priority should be taken)
    d = 8'b11000000; #10;
    if (y !== 3'b111) begin
        $display("FAIL: Expected y=111 for input 11000000");
        $finish;
    end

    // Test case 10: Disable the encoder
    en = 0; #10;
    if (y !== 3'bxxx) begin
        $display("FAIL: Output should be undefined when not enabled");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule