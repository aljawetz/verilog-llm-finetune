`timescale 1ns/1ps

module tb_encoder_wop;

reg [7:0] d;
wire [2:0] y;

// Instantiate the module under test
encoder_wop uut (
    .d(d),
    .y(y)
);

initial begin
    // Test case 1: Valid input (only one bit set)
    d = 8'd1; #10;
    if (y !== 3'b000) begin
        $display("FAIL: Expected y=000 for d=00000001, got y=%b", y);
        $finish;
    end

    // Test case 2: Valid input
    d = 8'd2; #10;
    if (y !== 3'b001) begin
        $display("FAIL: Expected y=001 for d=00000010, got y=%b", y);
        $finish;
    end

    // Test case 3: Valid input
    d = 8'd4; #10;
    if (y !== 3'b010) begin
        $display("FAIL: Expected y=010 for d=00000100, got y=%b", y);
        $finish;
    end

    // Test case 4: Valid input
    d = 8'd8; #10;
    if (y !== 3'b011) begin
        $display("FAIL: Expected y=011 for d=00001000, got y=%b", y);
        $finish;
    end

    // Test case 5: Valid input
    d = 8'd16; #10;
    if (y !== 3'b100) begin
        $display("FAIL: Expected y=100 for d=00010000, got y=%b", y);
        $finish;
    end

    // Test case 6: Valid input
    d = 8'd32; #10;
    if (y !== 3'b101) begin
        $display("FAIL: Expected y=101 for d=00100000, got y=%b", y);
        $finish;
    end

    // Test case 7: Valid input
    d = 8'd64; #10;
    if (y !== 3'b110) begin
        $display("FAIL: Expected y=110 for d=01000000, got y=%b", y);
        $finish;
    end

    // Test case 8: Valid input
    d = 8'd128; #10;
    if (y !== 3'b111) begin
        $display("FAIL: Expected y=111 for d=10000000, got y=%b", y);
        $finish;
    end

    // Test case 9: Invalid input (multiple bits set)
    d = 8'd3; #10;
    if (y !== 3'bzzz) begin
        $display("FAIL: Expected y=zzz for d=00000011, got y=%b", y);
        $finish;
    end

    // Test case 10: Invalid input (no bits set)
    d = 8'd0; #10;
    if (y !== 3'bzzz) begin
        $display("FAIL: Expected y=zzz for d=00000000, got y=%b", y);
        $finish;
    end

    // Test case 11: Invalid input (multiple bits set)
    d = 8'd255; #10;
    if (y !== 3'bzzz) begin
        $display("FAIL: Expected y=zzz for d=11111111, got y=%b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule