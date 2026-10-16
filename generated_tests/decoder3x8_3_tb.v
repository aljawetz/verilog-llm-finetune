`timescale 1ns/1ps

module tb_decoder3x8;

reg [2:0] A;
reg en;
wire [7:0] Y;

// Instantiate the Unit Under Test (UUT)
decoder3x8 uut (
    .A(A),
    .en(en),
    .Y(Y)
);

initial begin
    // Initialize inputs
    A = 3'b000;
    en = 0;

    // Test case 1: Enable is low, output should be 0
    #10;
    if (Y !== 8'b00000000) begin
        $display("FAIL: Test case 1 failed, expected Y = 00000000, got Y = %b", Y);
        $finish;
    end

    // Test case 2: Enable is high, A = 000, output should be 00000001
    en = 1;
    A = 3'b000;
    #10;
    if (Y !== 8'b00000001) begin
        $display("FAIL: Test case 2 failed, expected Y = 00000001, got Y = %b", Y);
        $finish;
    end

    // Test case 3: A = 001, output should be 00000010
    A = 3'b001;
    #10;
    if (Y !== 8'b00000010) begin
        $display("FAIL: Test case 3 failed, expected Y = 00000010, got Y = %b", Y);
        $finish;
    end

    // Test case 4: A = 010, output should be 00000100
    A = 3'b010;
    #10;
    if (Y !== 8'b00000100) begin
        $display("FAIL: Test case 4 failed, expected Y = 00000100, got Y = %b", Y);
        $finish;
    end

    // Test case 5: A = 011, output should be 00001000
    A = 3'b011;
    #10;
    if (Y !== 8'b00001000) begin
        $display("FAIL: Test case 5 failed, expected Y = 00001000, got Y = %b", Y);
        $finish;
    end

    // Test case 6: A = 100, output should be 00010000
    A = 3'b100;
    #10;
    if (Y !== 8'b00010000) begin
        $display("FAIL: Test case 6 failed, expected Y = 00010000, got Y = %b", Y);
        $finish;
    end

    // Test case 7: A = 101, output should be 00100000
    A = 3'b101;
    #10;
    if (Y !== 8'b00100000) begin
        $display("FAIL: Test case 7 failed, expected Y = 00100000, got Y = %b", Y);
        $finish;
    end

    // Test case 8: A = 110, output should be 01000000
    A = 3'b110;
    #10;
    if (Y !== 8'b01000000) begin
        $display("FAIL: Test case 8 failed, expected Y = 01000000, got Y = %b", Y);
        $finish;
    end

    // Test case 9: A = 111, output should be 10000000
    A = 3'b111;
    #10;
    if (Y !== 8'b10000000) begin
        $display("FAIL: Test case 9 failed, expected Y = 10000000, got Y = %b", Y);
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule