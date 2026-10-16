`timescale 1ns/1ps

module tb_sbox4;

    reg [5:0] addr;
    wire [3:0] dout;
    reg [3:0] expected_dout;

    sbox4 uut (
        .addr(addr),
        .dout(dout)
    );

    initial begin
        // Test vector initialization
        addr = 6'b000000; // addr = 0
        expected_dout = 4'b0111; // dout = 7
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b000001; // addr = 1
        expected_dout = 4'b1101; // dout = 13
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b000010; // addr = 2
        expected_dout = 4'b1110; // dout = 14
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b000011; // addr = 3
        expected_dout = 4'b0011; // dout = 3
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b000100; // addr = 4
        expected_dout = 4'b0000; // dout = 0
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b000101; // addr = 5
        expected_dout = 4'b0110; // dout = 6
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b000110; // addr = 6
        expected_dout = 4'b1001; // dout = 9
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b000111; // addr = 7
        expected_dout = 4'b1010; // dout = 10
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b001000; // addr = 8
        expected_dout = 4'b0001; // dout = 1
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b001001; // addr = 9
        expected_dout = 4'b0010; // dout = 2
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b001010; // addr = 10
        expected_dout = 4'b1000; // dout = 8
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b001011; // addr = 11
        expected_dout = 4'b0101; // dout = 5
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b001100; // addr = 12
        expected_dout = 4'b1011; // dout = 11
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b001101; // addr = 13
        expected_dout = 4'b1100; // dout = 12
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b001110; // addr = 14
        expected_dout = 4'b0100; // dout = 4
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b001111; // addr = 15
        expected_dout = 4'b1111; // dout = 15
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        // Additional tests for higher addr values
        addr = 6'b010000; // addr = 16
        expected_dout = 4'b1101; // dout = 13
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b010001; // addr = 17
        expected_dout = 4'b1000; // dout = 8
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b010010; // addr = 18
        expected_dout = 4'b1011; // dout = 11
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b010011; // addr = 19
        expected_dout = 4'b0101; // dout = 5
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b010100; // addr = 20
        expected_dout = 4'b0110; // dout = 6
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b010101; // addr = 21
        expected_dout = 4'b1111; // dout = 15
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b010110; // addr = 22
        expected_dout = 4'b0000; // dout = 0
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b010111; // addr = 23
        expected_dout = 4'b0011; // dout = 3
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b011000; // addr = 24
        expected_dout = 4'b0100; // dout = 4
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b011001; // addr = 25
        expected_dout = 4'b0111; // dout = 7
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b011010; // addr = 26
        expected_dout = 4'b0010; // dout = 2
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b011011; // addr = 27
        expected_dout = 4'b1100; // dout = 12
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b011100; // addr = 28
        expected_dout = 4'b0001; // dout = 1
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b011101; // addr = 29
        expected_dout = 4'b1010; // dout = 10
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b011110; // addr = 30
        expected_dout = 4'b1110; // dout = 14
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        addr = 6'b011111; // addr = 31
        expected_dout = 4'b1001; // dout = 9
        #10; 
        if (dout !== expected_dout) $display("FAIL: Expected %b but got %b for addr %b", expected_dout, dout, addr);

        // Final check
        $display("PASS");
        $finish;
    end

endmodule