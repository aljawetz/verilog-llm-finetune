`timescale 1ns/1ps

module tb_encoder_8x3_wo_priority;

reg [7:0] i;
reg en;
wire [2:0] b_out;

// Instantiate the module under test (uut)
encoder_8x3_wo_priority uut (
    .b_out(b_out),
    .i(i),
    .en(en)
);

initial begin
    // Test case 1: Enable is low, output should be 000
    en = 0; i = 8'b00000000; #10;
    if (b_out !== 3'b000) begin
        $display("FAIL: Expected b_out = 000 when en = 0");
        $finish;
    end

    // Test case 2: Enable is high, input is 00000001, output should be 000
    en = 1; i = 8'b00000001; #10;
    if (b_out !== 3'b000) begin
        $display("FAIL: Expected b_out = 000 for input 00000001");
        $finish;
    end

    // Test case 3: Input is 00000010, output should be 001
    i = 8'b00000010; #10;
    if (b_out !== 3'b001) begin
        $display("FAIL: Expected b_out = 001 for input 00000010");
        $finish;
    end

    // Test case 4: Input is 00000100, output should be 010
    i = 8'b00000100; #10;
    if (b_out !== 3'b010) begin
        $display("FAIL: Expected b_out = 010 for input 00000100");
        $finish;
    end

    // Test case 5: Input is 00001000, output should be 011
    i = 8'b00001000; #10;
    if (b_out !== 3'b011) begin
        $display("FAIL: Expected b_out = 011 for input 00001000");
        $finish;
    end

    // Test case 6: Input is 00010000, output should be 100
    i = 8'b00010000; #10;
    if (b_out !== 3'b100) begin
        $display("FAIL: Expected b_out = 100 for input 00010000");
        $finish;
    end

    // Test case 7: Input is 00100000, output should be 101
    i = 8'b00100000; #10;
    if (b_out !== 3'b101) begin
        $display("FAIL: Expected b_out = 101 for input 00100000");
        $finish;
    end

    // Test case 8: Input is 01000000, output should be 110
    i = 8'b01000000; #10;
    if (b_out !== 3'b110) begin
        $display("FAIL: Expected b_out = 110 for input 01000000");
        $finish;
    end

    // Test case 9: Input is 10000000, output should be 111
    i = 8'b10000000; #10;
    if (b_out !== 3'b111) begin
        $display("FAIL: Expected b_out = 111 for input 10000000");
        $finish;
    end

    // Test case 10: Enable is low again, output should be 000
    en = 0; #10;
    if (b_out !== 3'b000) begin
        $display("FAIL: Expected b_out = 000 when en = 0");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule