`timescale 1ns/1ps

module tb_decoder_2x4;

reg en;
reg [1:0] i;
wire [3:0] y;

decoder_2x4 uut (
    .y(y),
    .en(en),
    .i(i)
);

initial begin
    // Initialize inputs
    en = 0;
    i = 2'b00;

    // Test case 1: Enable is low, output should be 0000
    #10;
    if (y !== 4'b0000) begin
        $display("FAIL: Test case 1 failed, expected 0000, got %b", y);
        $finish;
    end

    // Test case 2: Enable is high, input is 00, output should be 0001
    en = 1;
    i = 2'b00;
    #10;
    if (y !== 4'b0001) begin
        $display("FAIL: Test case 2 failed, expected 0001, got %b", y);
        $finish;
    end

    // Test case 3: Enable is high, input is 01, output should be 0010
    i = 2'b01;
    #10;
    if (y !== 4'b0010) begin
        $display("FAIL: Test case 3 failed, expected 0010, got %b", y);
        $finish;
    end

    // Test case 4: Enable is high, input is 10, output should be 0100
    i = 2'b10;
    #10;
    if (y !== 4'b0100) begin
        $display("FAIL: Test case 4 failed, expected 0100, got %b", y);
        $finish;
    end

    // Test case 5: Enable is high, input is 11, output should be 1000
    i = 2'b11;
    #10;
    if (y !== 4'b1000) begin
        $display("FAIL: Test case 5 failed, expected 1000, got %b", y);
        $finish;
    end

    // Test case 6: Enable is low again, output should be 0000
    en = 0;
    #10;
    if (y !== 4'b0000) begin
        $display("FAIL: Test case 6 failed, expected 0000, got %b", y);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule