`timescale 1ns/1ps

module tb_sbox7;

    reg [1:6] addr;
    wire [1:4] dout;
    reg [1:4] expected_dout;

    sbox7 uut (
        .addr(addr),
        .dout(dout)
    );

    initial begin
        // Test cases
        addr = 6'b000000; // addr = 0
        expected_dout = 4; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b000001; // addr = 1
        expected_dout = 11; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b000010; // addr = 2
        expected_dout = 2; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b000011; // addr = 3
        expected_dout = 14; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b000100; // addr = 4
        expected_dout = 15; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b000101; // addr = 5
        expected_dout = 0; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b000110; // addr = 6
        expected_dout = 8; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b000111; // addr = 7
        expected_dout = 13; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b001000; // addr = 8
        expected_dout = 3; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b001001; // addr = 9
        expected_dout = 12; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b001010; // addr = 10
        expected_dout = 9; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b001011; // addr = 11
        expected_dout = 7; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b001100; // addr = 12
        expected_dout = 5; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b001101; // addr = 13
        expected_dout = 10; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b001110; // addr = 14
        expected_dout = 6; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        addr = 6'b001111; // addr = 15
        expected_dout = 1; #10;
        if (dout !== expected_dout) $display("FAIL: Expected dout = %d, got dout = %d for addr = %b", expected_dout, dout, addr);

        // Additional tests can be added here for other addr values...

        $display("PASS");
        $finish;
    end

endmodule