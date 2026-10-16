`timescale 1ns/1ps

module tb_hex2seg;

    reg Clk;
    reg Rst_n;
    reg [3:0] Data;
    wire [7:0] seg;

    // Instantiate the module under test (uut)
    hex2seg uut (
        .Clk(Clk),
        .Rst_n(Rst_n),
        .Data(Data),
        .seg(seg)
    );

    // Clock generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        Rst_n = 0; // Assert reset
        #10;
        Rst_n = 1; // Deassert reset
        #10;

        // Test all hex values from 0 to F
        Data = 4'd0; #10; if (seg !== 8'b11000000) $display("FAIL: Expected 0 for Data=0, got %b", seg);
        Data = 4'd1; #10; if (seg !== 8'b11111001) $display("FAIL: Expected 1 for Data=1, got %b", seg);
        Data = 4'd2; #10; if (seg !== 8'b10100100) $display("FAIL: Expected 2 for Data=2, got %b", seg);
        Data = 4'd3; #10; if (seg !== 8'b10110000) $display("FAIL: Expected 3 for Data=3, got %b", seg);
        Data = 4'd4; #10; if (seg !== 8'b10011001) $display("FAIL: Expected 4 for Data=4, got %b", seg);
        Data = 4'd5; #10; if (seg !== 8'b10010010) $display("FAIL: Expected 5 for Data=5, got %b", seg);
        Data = 4'd6; #10; if (seg !== 8'b10000010) $display("FAIL: Expected 6 for Data=6, got %b", seg);
        Data = 4'd7; #10; if (seg !== 8'b11111000) $display("FAIL: Expected 7 for Data=7, got %b", seg);
        Data = 4'd8; #10; if (seg !== 8'b00000000) $display("FAIL: Expected 8 for Data=8, got %b", seg);
        Data = 4'd9; #10; if (seg !== 8'b10011000) $display("FAIL: Expected 9 for Data=9, got %b", seg);
        Data = 4'hA; #10; if (seg !== 8'b10001110) $display("FAIL: Expected A for Data=A, got %b", seg);
        Data = 4'hB; #10; if (seg !== 8'b10000011) $display("FAIL: Expected B for Data=B, got %b", seg);
        Data = 4'hC; #10; if (seg !== 8'b11000111) $display("FAIL: Expected C for Data=C, got %b", seg);
        Data = 4'hD; #10; if (seg !== 8'b10100001) $display("FAIL: Expected D for Data=D, got %b", seg);
        Data = 4'hE; #10; if (seg !== 8'b10000101) $display("FAIL: Expected E for Data=E, got %b", seg);
        Data = 4'hF; #10; if (seg !== 8'b10001101) $display("FAIL: Expected F for Data=F, got %b", seg);

        $display("PASS");
        $finish;
    end

endmodule