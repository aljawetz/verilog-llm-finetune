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
        if (w !== 16'hFFFF) $display("FAIL: Expected 0xFFFF for addr 0, got %h", w);
        addr = 4'b0001; #10;
        if (w !== 16'h8000) $display("FAIL: Expected 0x8000 for addr 1, got %h", w);
        addr = 4'b0010; #10;
        if (w !== 16'h5555) $display("FAIL: Expected 0x5555 for addr 2, got %h", w);
        addr = 4'b0011; #10;
        if (w !== 16'h4000) $display("FAIL: Expected 0x4000 for addr 3, got %h", w);
        addr = 4'b0100; #10;
        if (w !== 16'h3333) $display("FAIL: Expected 0x3333 for addr 4, got %h", w);
        addr = 4'b0101; #10;
        if (w !== 16'h2AAA) $display("FAIL: Expected 0x2AAA for addr 5, got %h", w);
        addr = 4'b0110; #10;
        if (w !== 16'h2492) $display("FAIL: Expected 0x2492 for addr 6, got %h", w);
        addr = 4'b0111; #10;
        if (w !== 16'h2000) $display("FAIL: Expected 0x2000 for addr 7, got %h", w);
        addr = 4'b1000; #10;
        if (w !== 16'h1C71) $display("FAIL: Expected 0x1C71 for addr 8, got %h", w);
        addr = 4'b1001; #10;
        if (w !== 16'h1999) $display("FAIL: Expected 0x1999 for addr 9, got %h", w);
        addr = 4'b1010; #10;
        if (w !== 16'h1745) $display("FAIL: Expected 0x1745 for addr 10, got %h", w);
        addr = 4'b1011; #10;
        if (w !== 16'h1555) $display("FAIL: Expected 0x1555 for addr 11, got %h", w);
        addr = 4'b1100; #10;
        if (w !== 16'h13B1) $display("FAIL: Expected 0x13B1 for addr 12, got %h", w);
        addr = 4'b1101; #10;
        if (w !== 16'h1249) $display("FAIL: Expected 0x1249 for addr 13, got %h", w);
        addr = 4'b1110; #10;
        if (w !== 16'h1111) $display("FAIL: Expected 0x1111 for addr 14, got %h", w);
        addr = 4'b1111; #10;
        if (w !== 16'h1000) $display("FAIL: Expected 0x1000 for addr 15, got %h", w);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule