`timescale 1ns/1ps

module tb_sequence_counter;

    reg clk;
    reg reset;
    wire [3:0] counter;

    // Instantiate the module under test
    sequence_counter uut (
        .clk(clk),
        .reset(reset),
        .counter(counter)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        reset = 1; // Assert reset
        #10; // Wait for 10ns
        reset = 0; // Deassert reset

        // Check the sequence
        #10; if (counter !== 4'b0000) $display("FAIL: Expected 0, got %b", counter);
        #10; if (counter !== 4'b0010) $display("FAIL: Expected 2, got %b", counter);
        #10; if (counter !== 4'b0101) $display("FAIL: Expected 5, got %b", counter);
        #10; if (counter !== 4'b1000) $display("FAIL: Expected 8, got %b", counter);
        #10; if (counter !== 4'b1011) $display("FAIL: Expected 11, got %b", counter);
        #10; if (counter !== 4'b1110) $display("FAIL: Expected 14, got %b", counter);
        #10; if (counter !== 4'b0000) $display("FAIL: Expected 0, got %b", counter);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule