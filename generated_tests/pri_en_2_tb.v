`timescale 1ns/1ps

module tb_pri_en;

reg [7:0] d;
reg en;
wire [2:0] y;

// Instantiate the module under test (uut)
pri_en uut (
    .d(d),
    .y(y),
    .en(en)
);

initial begin
    // Initialize inputs
    d = 8'b00000000;
    en = 0;

    // Test case 1: Check output when disabled
    #10;
    if (y !== 3'bxxx) begin
        $display("FAIL: Expected y to be indeterminate when en is 0");
        $finish;
    end

    // Enable the encoder
    en = 1;

    // Test case 2: Check output for the first bit set
    d = 8'b00000001; #10;
    if (y !== 3'b000) begin
        $display("FAIL: Expected y to be 000 for input 00000001");
        $finish;
    end

    // Test case 3: Check output for the second bit set
    d = 8'b00000010; #10;
    if (y !== 3'b001) begin
        $display("FAIL: Expected y to be 001 for input 00000010");
        $finish;
    end

    // Test case 4: Check output for the third bit set
    d = 8'b00000100; #10;
    if (y !== 3'b010) begin
        $display("FAIL: Expected y to be 010 for input 00000100");
        $finish;
    end

    // Test case 5: Check output for the fourth bit set
    d = 8'b00001000; #10;
    if (y !== 3'b011) begin
        $display("FAIL: Expected y to be 011 for input 00001000");
        $finish;
    end

    // Test case 6: Check output for the fifth bit set
    d = 8'b00010000; #10;
    if (y !== 3'b100) begin
        $display("FAIL: Expected y to be 100 for input 00010000");
        $finish;
    end

    // Test case 7: Check output for the sixth bit set
    d = 8'b00100000; #10;
    if (y !== 3'b101) begin
        $display("FAIL: Expected y to be 101 for input 00100000");
        $finish;
    end

    // Test case 8: Check output for the seventh bit set
    d = 8'b01000000; #10;
    if (y !== 3'b110) begin
        $display("FAIL: Expected y to be 110 for input 01000000");
        $finish;
    end

    // Test case 9: Check output for the eighth bit set
    d = 8'b10000000; #10;
    if (y !== 3'b111) begin
        $display("FAIL: Expected y to be 111 for input 10000000");
        $finish;
    end

    // Test case 10: Check output when disabled again
    en = 0; #10;
    if (y !== 3'bxxx) begin
        $display("FAIL: Expected y to be indeterminate when en is 0");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule