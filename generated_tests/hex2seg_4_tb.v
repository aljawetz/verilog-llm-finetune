`timescale 1ns/1ps

module tb_hex2seg;

    reg [3:0] hex;
    wire [7:0] seg;

    // Instantiate the module under test (uut)
    hex2seg uut (
        .hex(hex),
        .seg(seg)
    );

    initial begin
        // Test all hexadecimal values from 0 to F
        hex = 4'h0; #10; if (seg !== 8'b11000000) $display("FAIL: hex=0, seg=%b", seg);
        hex = 4'h1; #10; if (seg !== 8'b11111001) $display("FAIL: hex=1, seg=%b", seg);
        hex = 4'h2; #10; if (seg !== 8'b00100101) $display("FAIL: hex=2, seg=%b", seg);
        hex = 4'h3; #10; if (seg !== 8'b00111001) $display("FAIL: hex=3, seg=%b", seg);
        hex = 4'h4; #10; if (seg !== 8'b01001001) $display("FAIL: hex=4, seg=%b", seg);
        hex = 4'h5; #10; if (seg !== 8'b01000101) $display("FAIL: hex=5, seg=%b", seg);
        hex = 4'h6; #10; if (seg !== 8'b01000001) $display("FAIL: hex=6, seg=%b", seg);
        hex = 4'h7; #10; if (seg !== 8'b11111000) $display("FAIL: hex=7, seg=%b", seg);
        hex = 4'h8; #10; if (seg !== 8'b00000000) $display("FAIL: hex=8, seg=%b", seg);
        hex = 4'h9; #10; if (seg !== 8'b01000000) $display("FAIL: hex=9, seg=%b", seg);
        hex = 4'hA; #10; if (seg !== 8'b00100000) $display("FAIL: hex=A, seg=%b", seg);
        hex = 4'hB; #10; if (seg !== 8'b00000101) $display("FAIL: hex=B, seg=%b", seg);
        hex = 4'hC; #10; if (seg !== 8'b01111001) $display("FAIL: hex=C, seg=%b", seg);
        hex = 4'hD; #10; if (seg !== 8'b00110001) $display("FAIL: hex=D, seg=%b", seg);
        hex = 4'hE; #10; if (seg !== 8'b00011001) $display("FAIL: hex=E, seg=%b", seg);
        hex = 4'hF; #10; if (seg !== 8'b00010001) $display("FAIL: hex=F, seg=%b", seg);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule