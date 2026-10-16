`timescale 1ns/1ps

module tb_binary2bcd;

    reg [7:0] data;
    wire [3:0] bit0, bit1, bit2;
    wire [11:0] BCD;

    // Instantiate the module under test (uut)
    binary2bcd uut (
        .data(data),
        .bit0(bit0),
        .bit1(bit1),
        .bit2(bit2),
        .BCD(BCD)
    );

    initial begin
        // Test case 1: Convert 0 (0000 0000)
        data = 8'b00000000; 
        #10;
        if (BCD !== 12'b0000_0000_0000) $display("FAIL: Test case 1 failed for input 0");
        
        // Test case 2: Convert 1 (0000 0001)
        data = 8'b00000001; 
        #10;
        if (BCD !== 12'b0000_0000_0001) $display("FAIL: Test case 2 failed for input 1");
        
        // Test case 3: Convert 10 (0000 1010)
        data = 8'b00001010; 
        #10;
        if (BCD !== 12'b0000_0000_1010) $display("FAIL: Test case 3 failed for input 10");
        
        // Test case 4: Convert 99 (0110 0011)
        data = 8'b01100011; 
        #10;
        if (BCD !== 12'b0000_0000_1001) $display("FAIL: Test case 4 failed for input 99");
        
        // Test case 5: Convert 255 (1111 1111)
        data = 8'b11111111; 
        #10;
        if (BCD !== 12'b0001_0000_0000) $display("FAIL: Test case 5 failed for input 255");

        // Test case 6: Convert 128 (1000 0000)
        data = 8'b10000000; 
        #10;
        if (BCD !== 12'b0000_0000_1000) $display("FAIL: Test case 6 failed for input 128");

        // Test case 7: Convert 50 (0011 0010)
        data = 8'b00110010; 
        #10;
        if (BCD !== 12'b0000_0000_0101) $display("FAIL: Test case 7 failed for input 50");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule