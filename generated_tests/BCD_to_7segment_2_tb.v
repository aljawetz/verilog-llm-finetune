`timescale 1ns/1ps

module tb_BCD_to_7segment;

    reg [3:0] BCD;
    wire [6:0] segment7;

    // Instantiate the module under test (uut)
    BCD_to_7segment uut (
        .BCD(BCD),
        .segment7(segment7)
    );

    initial begin
        // Test all BCD values from 0 to 9
        BCD = 4'b0000; #10;
        if (segment7 !== 7'b0111111) $display("FAIL: BCD=0, segment7=%b", segment7);
        
        BCD = 4'b0001; #10;
        if (segment7 !== 7'b0000110) $display("FAIL: BCD=1, segment7=%b", segment7);
        
        BCD = 4'b0010; #10;
        if (segment7 !== 7'b1011011) $display("FAIL: BCD=2, segment7=%b", segment7);
        
        BCD = 4'b0011; #10;
        if (segment7 !== 7'b1001111) $display("FAIL: BCD=3, segment7=%b", segment7);
        
        BCD = 4'b0100; #10;
        if (segment7 !== 7'b1100110) $display("FAIL: BCD=4, segment7=%b", segment7);
        
        BCD = 4'b0101; #10;
        if (segment7 !== 7'b1101101) $display("FAIL: BCD=5, segment7=%b", segment7);
        
        BCD = 4'b0110; #10;
        if (segment7 !== 7'b1111101) $display("FAIL: BCD=6, segment7=%b", segment7);
        
        BCD = 4'b0111; #10;
        if (segment7 !== 7'b0000111) $display("FAIL: BCD=7, segment7=%b", segment7);
        
        BCD = 4'b1000; #10;
        if (segment7 !== 7'b1111111) $display("FAIL: BCD=8, segment7=%b", segment7);
        
        BCD = 4'b1001; #10;
        if (segment7 !== 7'b1101111) $display("FAIL: BCD=9, segment7=%b", segment7);
        
        $display("PASS");
        $finish;
    end

endmodule