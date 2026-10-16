`timescale 1ns/1ps

module tb_LUT;
    reg [3:0] addr;
    reg clk;
    wire [15:0] w;

    // Instantiate the module under test (uut)
    LUT uut (
        .addr(addr),
        .clk(clk),
        .w(w)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize addr
        addr = 4'b0000;

        // Wait for a clock cycle
        #10;

        // Test all address values
        if (w !== 16'hFFFF) $display("FAIL: Expected w = 16'hFFFF for addr = 0");
        #10 addr = 4'b0001; #10;
        if (w !== 16'h8000) $display("FAIL: Expected w = 16'h8000 for addr = 1");
        #10 addr = 4'b0010; #10;
        if (w !== 16'h5555) $display("FAIL: Expected w = 16'h5555 for addr = 2");
        #10 addr = 4'b0011; #10;
        if (w !== 16'h4000) $display("FAIL: Expected w = 16'h4000 for addr = 3");
        #10 addr = 4'b0100; #10;
        if (w !== 16'h3333) $display("FAIL: Expected w = 16'h3333 for addr = 4");
        #10 addr = 4'b0101; #10;
        if (w !== 16'h2AAA) $display("FAIL: Expected w = 16'h2AAA for addr = 5");
        #10 addr = 4'b0110; #10;
        if (w !== 16'h2492) $display("FAIL: Expected w = 16'h2492 for addr = 6");
        #10 addr = 4'b0111; #10;
        if (w !== 16'h2000) $display("FAIL: Expected w = 16'h2000 for addr = 7");
        #10 addr = 4'b1000; #10;
        if (w !== 16'h1C71) $display("FAIL: Expected w = 16'h1C71 for addr = 8");
        #10 addr = 4'b1001; #10;
        if (w !== 16'h1999) $display("FAIL: Expected w = 16'h1999 for addr = 9");
        #10 addr = 4'b1010; #10;
        if (w !== 16'h1745) $display("FAIL: Expected w = 16'h1745 for addr = 10");
        #10 addr = 4'b1011; #10;
        if (w !== 16'h1555) $display("FAIL: Expected w = 16'h1555 for addr = 11");
        #10 addr = 4'b1100; #10;
        if (w !== 16'h13B1) $display("FAIL: Expected w = 16'h13B1 for addr = 12");
        #10 addr = 4'b1101; #10;
        if (w !== 16'h1249) $display("FAIL: Expected w = 16'h1249 for addr = 13");
        #10 addr = 4'b1110; #10;
        if (w !== 16'h1111) $display("FAIL: Expected w = 16'h1111 for addr = 14");
        #10 addr = 4'b1111; #10;
        if (w !== 16'h1000) $display("FAIL: Expected w = 16'h1000 for addr = 15");

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule