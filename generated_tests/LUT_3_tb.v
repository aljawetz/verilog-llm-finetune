`timescale 1ns/1ps

module tb_LUT;
    reg [3:0] addr;
    reg clk;
    wire [15:0] w;

    // Instantiate the LUT module
    LUT uut (
        .addr(addr),
        .clk(clk),
        .w(w)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize addr
        addr = 4'b0000;

        // Wait for a clock cycle
        #10;

        // Test all addresses
        if (w !== 16'hFFFF) $display("FAIL: Address 0 expected 0xFFFF, got 0x%h", w);
        addr = 4'b0001; #10;
        if (w !== 16'h8000) $display("FAIL: Address 1 expected 0x8000, got 0x%h", w);
        addr = 4'b0010; #10;
        if (w !== 16'h5555) $display("FAIL: Address 2 expected 0x5555, got 0x%h", w);
        addr = 4'b0011; #10;
        if (w !== 16'h4000) $display("FAIL: Address 3 expected 0x4000, got 0x%h", w);
        addr = 4'b0100; #10;
        if (w !== 16'h3333) $display("FAIL: Address 4 expected 0x3333, got 0x%h", w);
        addr = 4'b0101; #10;
        if (w !== 16'h2AAA) $display("FAIL: Address 5 expected 0x2AAA, got 0x%h", w);
        addr = 4'b0110; #10;
        if (w !== 16'h2492) $display("FAIL: Address 6 expected 0x2492, got 0x%h", w);
        addr = 4'b0111; #10;
        if (w !== 16'h2000) $display("FAIL: Address 7 expected 0x2000, got 0x%h", w);
        addr = 4'b1000; #10;
        if (w !== 16'h1C71) $display("FAIL: Address 8 expected 0x1C71, got 0x%h", w);
        addr = 4'b1001; #10;
        if (w !== 16'h1999) $display("FAIL: Address 9 expected 0x1999, got 0x%h", w);
        addr = 4'b1010; #10;
        if (w !== 16'h1745) $display("FAIL: Address 10 expected 0x1745, got 0x%h", w);
        addr = 4'b1011; #10;
        if (w !== 16'h1555) $display("FAIL: Address 11 expected 0x1555, got 0x%h", w);
        addr = 4'b1100; #10;
        if (w !== 16'h13B1) $display("FAIL: Address 12 expected 0x13B1, got 0x%h", w);
        addr = 4'b1101; #10;
        if (w !== 16'h1249) $display("FAIL: Address 13 expected 0x1249, got 0x%h", w);
        addr = 4'b1110; #10;
        if (w !== 16'h1111) $display("FAIL: Address 14 expected 0x1111, got 0x%h", w);
        addr = 4'b1111; #10;
        if (w !== 16'h1000) $display("FAIL: Address 15 expected 0x1000, got 0x%h", w);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule