`timescale 1ns/1ps

module tb_encoder8to3;

reg en;
reg [7:0] in;
wire v;
wire [2:0] y;

// Instantiate the module under test
encoder8to3 uut (
    .en(en),
    .in(in),
    .y(y),
    .v(v)
);

// Test procedure
initial begin
    // Initialize signals
    en = 0;
    in = 8'b00000000;

    // Test case 1: Disabled encoder
    #10;
    if (v !== 1'b0 || y !== 3'bxxx) begin
        $display("FAIL: Test case 1 failed (disabled encoder)");
        $finish;
    end

    // Test case 2: Enable encoder with one-hot input
    en = 1;

    // Test case 3: Input 00000001
    in = 8'b00000001; #10;
    if (v !== 1'b1 || y !== 3'b000) begin
        $display("FAIL: Test case 3 failed (input 00000001)");
        $finish;
    end

    // Test case 4: Input 00000010
    in = 8'b00000010; #10;
    if (v !== 1'b1 || y !== 3'b001) begin
        $display("FAIL: Test case 4 failed (input 00000010)");
        $finish;
    end

    // Test case 5: Input 00000100
    in = 8'b00000100; #10;
    if (v !== 1'b1 || y !== 3'b010) begin
        $display("FAIL: Test case 5 failed (input 00000100)");
        $finish;
    end

    // Test case 6: Input 00001000
    in = 8'b00001000; #10;
    if (v !== 1'b1 || y !== 3'b011) begin
        $display("FAIL: Test case 6 failed (input 00001000)");
        $finish;
    end

    // Test case 7: Input 00010000
    in = 8'b00010000; #10;
    if (v !== 1'b1 || y !== 3'b100) begin
        $display("FAIL: Test case 7 failed (input 00010000)");
        $finish;
    end

    // Test case 8: Input 00100000
    in = 8'b00100000; #10;
    if (v !== 1'b1 || y !== 3'b101) begin
        $display("FAIL: Test case 8 failed (input 00100000)");
        $finish;
    end

    // Test case 9: Input 01000000
    in = 8'b01000000; #10;
    if (v !== 1'b1 || y !== 3'b110) begin
        $display("FAIL: Test case 9 failed (input 01000000)");
        $finish;
    end

    // Test case 10: Input 10000000
    in = 8'b10000000; #10;
    if (v !== 1'b1 || y !== 3'b111) begin
        $display("FAIL: Test case 10 failed (input 10000000)");
        $finish;
    end

    // Test case 11: Invalid input
    in = 8'b00000000; #10;
    if (v !== 1'b1 || y !== 3'bzzz) begin
        $display("FAIL: Test case 11 failed (invalid input)");
        $finish;
    end

    // Test case 12: Disabled encoder again
    en = 0; #10;
    if (v !== 1'b0 || y !== 3'bxxx) begin
        $display("FAIL: Test case 12 failed (disabled encoder)");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule