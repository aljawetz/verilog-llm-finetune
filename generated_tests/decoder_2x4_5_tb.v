`timescale 1ns/1ps

module tb_decoder_2x4;

reg [1:0] a;
reg en;
wire [3:0] d;

// Instantiate the module under test (uut)
decoder_2x4 uut (
    .d(d),
    .a(a),
    .en(en)
);

// Test sequence
initial begin
    // Test case 1: Enable is low
    en = 0; a = 2'b00; #10;
    if (d !== 4'b0000) begin
        $display("FAIL: Test case 1 failed, expected d=0000, got d=%b", d);
        $finish;
    end

    // Test case 2: Enable is high, input 00
    en = 1; a = 2'b00; #10;
    if (d !== 4'b0001) begin
        $display("FAIL: Test case 2 failed, expected d=0001, got d=%b", d);
        $finish;
    end

    // Test case 3: Enable is high, input 01
    a = 2'b01; #10;
    if (d !== 4'b0010) begin
        $display("FAIL: Test case 3 failed, expected d=0010, got d=%b", d);
        $finish;
    end

    // Test case 4: Enable is high, input 10
    a = 2'b10; #10;
    if (d !== 4'b0100) begin
        $display("FAIL: Test case 4 failed, expected d=0100, got d=%b", d);
        $finish;
    end

    // Test case 5: Enable is high, input 11
    a = 2'b11; #10;
    if (d !== 4'b1000) begin
        $display("FAIL: Test case 5 failed, expected d=1000, got d=%b", d);
        $finish;
    end

    // Test case 6: Enable is low again
    en = 0; #10;
    if (d !== 4'b0000) begin
        $display("FAIL: Test case 6 failed, expected d=0000, got d=%b", d);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule