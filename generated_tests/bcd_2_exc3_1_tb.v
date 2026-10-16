`timescale 1ns/1ps

module tb_bcd_2_exc3;

    reg [3:0] b;
    wire [3:0] e;

    // Instantiate the module under test
    bcd_2_exc3 uut (
        .b(b),
        .e(e)
    );

    initial begin
        // Test valid BCD inputs
        b = 4'b0000; #10; // BCD 0
        if (e !== 4'b0011) $display("FAIL: Expected 0011 for BCD 0, got %b", e);
        
        b = 4'b0001; #10; // BCD 1
        if (e !== 4'b0100) $display("FAIL: Expected 0100 for BCD 1, got %b", e);
        
        b = 4'b0010; #10; // BCD 2
        if (e !== 4'b0101) $display("FAIL: Expected 0101 for BCD 2, got %b", e);
        
        b = 4'b0011; #10; // BCD 3
        if (e !== 4'b0110) $display("FAIL: Expected 0110 for BCD 3, got %b", e);
        
        b = 4'b0100; #10; // BCD 4
        if (e !== 4'b0111) $display("FAIL: Expected 0111 for BCD 4, got %b", e);
        
        b = 4'b0101; #10; // BCD 5
        if (e !== 4'b1000) $display("FAIL: Expected 1000 for BCD 5, got %b", e);
        
        b = 4'b0110; #10; // BCD 6
        if (e !== 4'b1001) $display("FAIL: Expected 1001 for BCD 6, got %b", e);
        
        b = 4'b0111; #10; // BCD 7
        if (e !== 4'b1010) $display("FAIL: Expected 1010 for BCD 7, got %b", e);
        
        b = 4'b1000; #10; // BCD 8
        if (e !== 4'b1011) $display("FAIL: Expected 1011 for BCD 8, got %b", e);
        
        b = 4'b1001; #10; // BCD 9
        if (e !== 4'b1100) $display("FAIL: Expected 1100 for BCD 9, got %b", e);
        
        // Test invalid BCD inputs
        b = 4'b1010; #10; // Invalid BCD
        if (e !== 4'bxxxx) $display("FAIL: Expected xxxx for invalid BCD 10, got %b", e);
        
        b = 4'b1111; #10; // Invalid BCD
        if (e !== 4'bxxxx) $display("FAIL: Expected xxxx for invalid BCD 15, got %b", e);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule