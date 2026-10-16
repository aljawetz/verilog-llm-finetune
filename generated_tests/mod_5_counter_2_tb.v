`timescale 1ns/1ps

module tb_mod_5_counter;

    reg clk;
    reg reset;
    wire [4:0] count;

    // Instantiate the module under test (uut)
    mod_5_counter uut (
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

        // Test counting from 0 to 4
        #10; // Wait for 10ns
        if (count !== 1) begin
            $display("FAIL: Expected count to be 1, got %d", count);
            $finish;
        end

        #10; // Wait for 10ns
        if (count !== 2) begin
            $display("FAIL: Expected count to be 2, got %d", count);
            $finish;
        end

        #10; // Wait for 10ns
        if (count !== 3) begin
            $display("FAIL: Expected count to be 3, got %d", count);
            $finish;
        end

        #10; // Wait for 10ns
        if (count !== 4) begin
            $display("FAIL: Expected count to be 4, got %d", count);
            $finish;
        end

        // Check reset functionality
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        #10; // Wait for 10ns
        if (count !== 1) begin
            $display("FAIL: Expected count to be 1 after reset, got %d", count);
            $finish;
        end

        #10; // Wait for 10ns
        if (count !== 2) begin
            $display("FAIL: Expected count to be 2, got %d", count);
            $finish;
        end

        #10; // Wait for 10ns
        if (count !== 3) begin
            $display("FAIL: Expected count to be 3, got %d", count);
            $finish;
        end

        #10; // Wait for 10ns
        if (count !== 4) begin
            $display("FAIL: Expected count to be 4, got %d", count);
            $finish;
        end

        #10; // Wait for 10ns
        if (count !== 0) begin
            $display("FAIL: Expected count to be 0 after reaching 4, got %d", count);
            $finish;
        end

        // Final check after reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        #10; // Wait for 10ns
        if (count !== 1) begin
            $display("FAIL: Expected count to be 1 after reset, got %d", count);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule