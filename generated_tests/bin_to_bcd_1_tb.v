`timescale 1ns/1ps

module tb_bin_to_bcd;

    reg [7:0] bin;
    wire [11:0] bcd;

    // Instantiate the module under test
    bin_to_bcd uut (
        .bin(bin),
        .bcd(bcd)
    );

    initial begin
        // Test cases
        bin = 8'd0; #10;
        if (bcd !== 12'd0) $display("FAIL: Expected BCD 0000 for binary 0, got %b", bcd);
        
        bin = 8'd1; #10;
        if (bcd !== 12'd1) $display("FAIL: Expected BCD 0001 for binary 1, got %b", bcd);
        
        bin = 8'd9; #10;
        if (bcd !== 12'd9) $display("FAIL: Expected BCD 0009 for binary 9, got %b", bcd);
        
        bin = 8'd10; #10;
        if (bcd !== 12'd10) $display("FAIL: Expected BCD 000A for binary 10, got %b", bcd);
        
        bin = 8'd99; #10;
        if (bcd !== 12'd99) $display("FAIL: Expected BCD 0099 for binary 99, got %b", bcd);
        
        bin = 8'd100; #10;
        if (bcd !== 12'd100) $display("FAIL: Expected BCD 0100 for binary 100, got %b", bcd);
        
        bin = 8'd255; #10;
        if (bcd !== 12'd255) $display("FAIL: Expected BCD 0255 for binary 255, got %b", bcd);
        
        $display("PASS");
        $finish;
    end

endmodule