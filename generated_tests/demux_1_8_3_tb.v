`timescale 1ns/1ps

module tb_demux_1_8;

    reg din;
    reg [2:0] sel;
    wire [7:0] y;

    // Instantiate the module under test (uut)
    demux_1_8 uut (
        .din(din),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test sequence
        din = 1'b0; sel = 3'b000; #10;
        if (y !== 8'b00000000) $display("FAIL: Test 1 failed for sel=000, expected 00000000, got %b", y);

        din = 1'b1; sel = 3'b000; #10;
        if (y !== 8'b00000001) $display("FAIL: Test 2 failed for sel=000, expected 00000001, got %b", y);

        din = 1'b0; sel = 3'b001; #10;
        if (y !== 8'b00000000) $display("FAIL: Test 3 failed for sel=001, expected 00000000, got %b", y);

        din = 1'b1; sel = 3'b001; #10;
        if (y !== 8'b00000010) $display("FAIL: Test 4 failed for sel=001, expected 00000010, got %b", y);

        din = 1'b0; sel = 3'b010; #10;
        if (y !== 8'b00000000) $display("FAIL: Test 5 failed for sel=010, expected 00000000, got %b", y);

        din = 1'b1; sel = 3'b010; #10;
        if (y !== 8'b00000100) $display("FAIL: Test 6 failed for sel=010, expected 00000100, got %b", y);

        din = 1'b0; sel = 3'b011; #10;
        if (y !== 8'b00000000) $display("FAIL: Test 7 failed for sel=011, expected 00000000, got %b", y);

        din = 1'b1; sel = 3'b011; #10;
        if (y !== 8'b00001000) $display("FAIL: Test 8 failed for sel=011, expected 00001000, got %b", y);

        din = 1'b0; sel = 3'b100; #10;
        if (y !== 8'b00000000) $display("FAIL: Test 9 failed for sel=100, expected 00000000, got %b", y);

        din = 1'b1; sel = 3'b100; #10;
        if (y !== 8'b00010000) $display("FAIL: Test 10 failed for sel=100, expected 00010000, got %b", y);

        din = 1'b0; sel = 3'b101; #10;
        if (y !== 8'b00000000) $display("FAIL: Test 11 failed for sel=101, expected 00000000, got %b", y);

        din = 1'b1; sel = 3'b101; #10;
        if (y !== 8'b00100000) $display("FAIL: Test 12 failed for sel=101, expected 00100000, got %b", y);

        din = 1'b0; sel = 3'b110; #10;
        if (y !== 8'b00000000) $display("FAIL: Test 13 failed for sel=110, expected 00000000, got %b", y);

        din = 1'b1; sel = 3'b110; #10;
        if (y !== 8'b01000000) $display("FAIL: Test 14 failed for sel=110, expected 01000000, got %b", y);

        din = 1'b0; sel = 3'b111; #10;
        if (y !== 8'b00000000) $display("FAIL: Test 15 failed for sel=111, expected 00000000, got %b", y);

        din = 1'b1; sel = 3'b111; #10;
        if (y !== 8'b10000000) $display("FAIL: Test 16 failed for sel=111, expected 10000000, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule