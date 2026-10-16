`timescale 1ns/1ps

module tb_seg7;

    reg [3:0] din;
    wire [6:0] dout;

    // Instantiate the module under test (uut)
    seg7 uut (
        .din(din),
        .dout(dout)
    );

    initial begin
        // Test all hexadecimal inputs from 0 to F
        din = 4'h0; #10;
        if (dout !== 7'b000_0001) $display("FAIL: din=0, dout=%b", dout);
        
        din = 4'h1; #10;
        if (dout !== 7'b100_1111) $display("FAIL: din=1, dout=%b", dout);
        
        din = 4'h2; #10;
        if (dout !== 7'b001_0010) $display("FAIL: din=2, dout=%b", dout);
        
        din = 4'h3; #10;
        if (dout !== 7'b000_0110) $display("FAIL: din=3, dout=%b", dout);
        
        din = 4'h4; #10;
        if (dout !== 7'b100_1100) $display("FAIL: din=4, dout=%b", dout);
        
        din = 4'h5; #10;
        if (dout !== 7'b010_0100) $display("FAIL: din=5, dout=%b", dout);
        
        din = 4'h6; #10;
        if (dout !== 7'b010_0000) $display("FAIL: din=6, dout=%b", dout);
        
        din = 4'h7; #10;
        if (dout !== 7'b000_1111) $display("FAIL: din=7, dout=%b", dout);
        
        din = 4'h8; #10;
        if (dout !== 7'b000_0000) $display("FAIL: din=8, dout=%b", dout);
        
        din = 4'h9; #10;
        if (dout !== 7'b000_0100) $display("FAIL: din=9, dout=%b", dout);
        
        din = 4'hA; #10;
        if (dout !== 7'b000_1000) $display("FAIL: din=A, dout=%b", dout);
        
        din = 4'hB; #10;
        if (dout !== 7'b110_0000) $display("FAIL: din=B, dout=%b", dout);
        
        din = 4'hC; #10;
        if (dout !== 7'b011_0001) $display("FAIL: din=C, dout=%b", dout);
        
        din = 4'hD; #10;
        if (dout !== 7'b100_0010) $display("FAIL: din=D, dout=%b", dout);
        
        din = 4'hE; #10;
        if (dout !== 7'b011_0000) $display("FAIL: din=E, dout=%b", dout);
        
        din = 4'hF; #10;
        if (dout !== 7'b011_1000) $display("FAIL: din=F, dout=%b", dout);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule