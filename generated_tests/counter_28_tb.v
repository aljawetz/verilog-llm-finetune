`timescale 1ns/1ps

module tb_counter;

    reg clk;
    reg rst;
    reg ce;
    wire [3:0] count;

    // Instantiate the counter module
    counter uut (
        .clk(clk),
        .rst(rst),
        .ce(ce),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        ce = 0;

        // Wait for a clock edge
        #10;

        // Release reset
        rst = 0;

        // Test counting when ce is high
        ce = 1;

        // Check counts
        #10; if (count !== 4'b0001) $display("FAIL: Expected count 1, got %b", count);
        #10; if (count !== 4'b0010) $display("FAIL: Expected count 2, got %b", count);
        #10; if (count !== 4'b0011) $display("FAIL: Expected count 3, got %b", count);
        #10; if (count !== 4'b0100) $display("FAIL: Expected count 4, got %b", count);
        #10; if (count !== 4'b0101) $display("FAIL: Expected count 5, got %b", count);
        #10; if (count !== 4'b0110) $display("FAIL: Expected count 6, got %b", count);
        #10; if (count !== 4'b0111) $display("FAIL: Expected count 7, got %b", count);
        #10; if (count !== 4'b1000) $display("FAIL: Expected count 8, got %b", count);
        #10; if (count !== 4'b1001) $display("FAIL: Expected count 9, got %b", count);
        #10; if (count !== 4'b1010) $display("FAIL: Expected count 10, got %b", count);
        #10; if (count !== 4'b1011) $display("FAIL: Expected count 11, got %b", count);
        #10; if (count !== 4'b1100) $display("FAIL: Expected count 12, got %b", count);
        #10; if (count !== 4'b1101) $display("FAIL: Expected count 13, got %b", count);
        #10; if (count !== 4'b1110) $display("FAIL: Expected count 14, got %b", count);
        #10; if (count !== 4'b1111) $display("FAIL: Expected count 15, got %b", count);

        // Test reset functionality
        rst = 1; #10; rst = 0; // Assert and deassert reset
        #10; if (count !== 4'b0000) $display("FAIL: Expected count 0 after reset, got %b", count);

        // Test counting when ce is low
        ce = 0;
        #10; if (count !== 4'b0000) $display("FAIL: Expected count 0 when ce is low, got %b", count);
        #10; if (count !== 4'b0000) $display("FAIL: Expected count 0 when ce is low, got %b", count);

        // Finish the simulation
        $display("PASS");
        $finish;
    end

endmodule