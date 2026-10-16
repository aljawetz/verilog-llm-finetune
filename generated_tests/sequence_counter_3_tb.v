`timescale 1ns/1ps

module tb_sequence_counter;

    // Parameters
    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the module under test (uut)
    sequence_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Expected sequence: 1, 3, 4, 6, 8, 10, 12, 14
        #10; if (count !== 4'b0001) $display("FAIL: Expected count 1, got %b", count);
        #10; if (count !== 4'b0011) $display("FAIL: Expected count 3, got %b", count);
        #10; if (count !== 4'b0100) $display("FAIL: Expected count 4, got %b", count);
        #10; if (count !== 4'b0110) $display("FAIL: Expected count 6, got %b", count);
        #10; if (count !== 4'b1000) $display("FAIL: Expected count 8, got %b", count);
        #10; if (count !== 4'b1010) $display("FAIL: Expected count 10, got %b", count);
        #10; if (count !== 4'b1100) $display("FAIL: Expected count 12, got %b", count);
        #10; if (count !== 4'b1110) $display("FAIL: Expected count 14, got %b", count);
        #10; if (count !== 4'b0001) $display("FAIL: Expected count 1 after wrap, got %b", count);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule