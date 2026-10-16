`timescale 1ns/1ps

module tb_encoder8x3;

reg [7:0] d;
wire [2:0] y;

// Instantiate the module under test
encoder8x3 uut (
    .d(d),
    .y(y)
);

initial begin
    // Test case 1: Input 00000001
    d = 8'b00000001; #10;
    if (y !== 3'b000) begin
        $display("FAIL: Expected y=000 for d=00000001, got y=%b", y);
        $finish;
    end

    // Test case 2: Input 00000010
    d = 8'b00000010; #10;
    if (y !== 3'b001) begin
        $display("FAIL: Expected y=001 for d=00000010, got y=%b", y);
        $finish;
    end

    // Test case 3: Input 00000100
    d = 8'b00000100; #10;
    if (y !== 3'b010) begin
        $display("FAIL: Expected y=010 for d=00000100, got y=%b", y);
        $finish;
    end

    // Test case 4: Input 00001000
    d = 8'b00001000; #10;
    if (y !== 3'b011) begin
        $display("FAIL: Expected y=011 for d=00001000, got y=%b", y);
        $finish;
    end

    // Test case 5: Input 00010000
    d = 8'b00010000; #10;
    if (y !== 3'b100) begin
        $display("FAIL: Expected y=100 for d=00010000, got y=%b", y);
        $finish;
    end

    // Test case 6: Input 00100000
    d = 8'b00100000; #10;
    if (y !== 3'b101) begin
        $display("FAIL: Expected y=101 for d=00100000, got y=%b", y);
        $finish;
    end

    // Test case 7: Input 01000000
    d = 8'b01000000; #10;
    if (y !== 3'b110) begin
        $display("FAIL: Expected y=110 for d=01000000, got y=%b", y);
        $finish;
    end

    // Test case 8: Input 10000000
    d = 8'b10000000; #10;
    if (y !== 3'b111) begin
        $display("FAIL: Expected y=111 for d=10000000, got y=%b", y);
        $finish;
    end

    // Test case 9: Input 00000000 (default case)
    d = 8'b00000000; #10;
    if (y !== 3'b000) begin
        $display("FAIL: Expected y=000 for d=00000000, got y=%b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule