`timescale 1ns/1ps

module tb_dmux8to1S;

reg i;
reg [2:0] s;
wire [7:0] y;

// Instantiate the module under test
dmux8to1S uut (
    .y(y),
    .s(s),
    .i(i)
);

initial begin
    // Initialize inputs
    i = 0;
    s = 3'b000;

    // Test case 1: Check output when i=1 and s=0
    i = 1;
    s = 3'b000;
    #10;
    if (y !== 8'b00000001) begin
        $display("FAIL: Test case 1 failed, expected y=00000001, got y=%b", y);
        $finish;
    end

    // Test case 2: Check output when i=1 and s=1
    s = 3'b001;
    #10;
    if (y !== 8'b00000010) begin
        $display("FAIL: Test case 2 failed, expected y=00000010, got y=%b", y);
        $finish;
    end

    // Test case 3: Check output when i=1 and s=2
    s = 3'b010;
    #10;
    if (y !== 8'b00000100) begin
        $display("FAIL: Test case 3 failed, expected y=00000100, got y=%b", y);
        $finish;
    end

    // Test case 4: Check output when i=1 and s=3
    s = 3'b011;
    #10;
    if (y !== 8'b00001000) begin
        $display("FAIL: Test case 4 failed, expected y=00001000, got y=%b", y);
        $finish;
    end

    // Test case 5: Check output when i=1 and s=4
    s = 3'b100;
    #10;
    if (y !== 8'b00010000) begin
        $display("FAIL: Test case 5 failed, expected y=00010000, got y=%b", y);
        $finish;
    end

    // Test case 6: Check output when i=1 and s=5
    s = 3'b101;
    #10;
    if (y !== 8'b00100000) begin
        $display("FAIL: Test case 6 failed, expected y=00100000, got y=%b", y);
        $finish;
    end

    // Test case 7: Check output when i=1 and s=6
    s = 3'b110;
    #10;
    if (y !== 8'b01000000) begin
        $display("FAIL: Test case 7 failed, expected y=01000000, got y=%b", y);
        $finish;
    end

    // Test case 8: Check output when i=1 and s=7
    s = 3'b111;
    #10;
    if (y !== 8'b10000000) begin
        $display("FAIL: Test case 8 failed, expected y=10000000, got y=%b", y);
        $finish;
    end

    // Test case 9: Check output when i=0 (should be all zeros)
    i = 0;
    s = 3'b000;
    #10;
    if (y !== 8'b00000000) begin
        $display("FAIL: Test case 9 failed, expected y=00000000, got y=%b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule