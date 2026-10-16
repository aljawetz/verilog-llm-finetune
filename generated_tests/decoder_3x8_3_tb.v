`timescale 1ns/1ps

module tb_decoder_3x8;

reg en;
reg [2:0] i;
wire [7:0] y;

decoder_3x8 uut (
    .y(y),
    .en(en),
    .i(i)
);

initial begin
    // Test case 1: Enable decoder and check output for input 000
    en = 1;
    i = 3'b000;
    #10;
    if (y !== 8'b0000_0001) begin
        $display("FAIL: Expected y=0000_0001 for i=000 when en=1");
        $finish;
    end

    // Test case 2: Enable decoder and check output for input 001
    i = 3'b001;
    #10;
    if (y !== 8'b0000_0010) begin
        $display("FAIL: Expected y=0000_0010 for i=001 when en=1");
        $finish;
    end

    // Test case 3: Enable decoder and check output for input 010
    i = 3'b010;
    #10;
    if (y !== 8'b0000_0100) begin
        $display("FAIL: Expected y=0000_0100 for i=010 when en=1");
        $finish;
    end

    // Test case 4: Enable decoder and check output for input 011
    i = 3'b011;
    #10;
    if (y !== 8'b0000_1000) begin
        $display("FAIL: Expected y=0000_1000 for i=011 when en=1");
        $finish;
    end

    // Test case 5: Enable decoder and check output for input 100
    i = 3'b100;
    #10;
    if (y !== 8'b0001_0000) begin
        $display("FAIL: Expected y=0001_0000 for i=100 when en=1");
        $finish;
    end

    // Test case 6: Enable decoder and check output for input 101
    i = 3'b101;
    #10;
    if (y !== 8'b0010_0000) begin
        $display("FAIL: Expected y=0010_0000 for i=101 when en=1");
        $finish;
    end

    // Test case 7: Enable decoder and check output for input 110
    i = 3'b110;
    #10;
    if (y !== 8'b0100_0000) begin
        $display("FAIL: Expected y=0100_0000 for i=110 when en=1");
        $finish;
    end

    // Test case 8: Enable decoder and check output for input 111
    i = 3'b111;
    #10;
    if (y !== 8'b1000_0000) begin
        $display("FAIL: Expected y=1000_0000 for i=111 when en=1");
        $finish;
    end

    // Test case 9: Disable decoder and check output
    en = 0;
    i = 3'b101; // Input value doesn't matter when en=0
    #10;
    if (y !== 8'bxxxx_xxxx) begin
        $display("FAIL: Expected y=xxxx_xxxx when en=0");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule