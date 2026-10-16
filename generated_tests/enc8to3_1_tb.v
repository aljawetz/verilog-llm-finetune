`timescale 1ns/1ps

module tb_enc8to3;

    reg [7:0] in;
    reg en;
    wire [2:0] y;

    // Instantiate the module under test
    enc8to3 uut (
        .in(in),
        .en(en),
        .y(y)
    );

    initial begin
        // Test case 1: Enable with valid input
        en = 1;
        in = 8'b00000001; #10;
        if (y !== 3'b000) $display("FAIL: Expected 000 for input 00000001");
        
        in = 8'b00000010; #10;
        if (y !== 3'b001) $display("FAIL: Expected 001 for input 00000010");
        
        in = 8'b00000100; #10;
        if (y !== 3'b010) $display("FAIL: Expected 010 for input 00000100");
        
        in = 8'b00001000; #10;
        if (y !== 3'b011) $display("FAIL: Expected 011 for input 00001000");
        
        in = 8'b00010000; #10;
        if (y !== 3'b100) $display("FAIL: Expected 100 for input 00010000");
        
        in = 8'b00100000; #10;
        if (y !== 3'b101) $display("FAIL: Expected 101 for input 00100000");
        
        in = 8'b01000000; #10;
        if (y !== 3'b110) $display("FAIL: Expected 110 for input 01000000");
        
        in = 8'b10000000; #10;
        if (y !== 3'b111) $display("FAIL: Expected 111 for input 10000000");

        // Test case 2: Enable with no active bit
        in = 8'b00000000; #10;
        if (y !== 3'bzzz) $display("FAIL: Expected zzz for input 00000000");

        // Test case 3: Disable the encoder
        en = 0; #10;
        if (y !== 3'bxxx) $display("FAIL: Expected xxx when disabled");

        // Test case 4: Enable with multiple active bits
        en = 1;
        in = 8'b00000011; #10;
        if (y !== 3'bzzz) $display("FAIL: Expected zzz for input 00000011");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule