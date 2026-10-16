`timescale 1ns/1ps

module tb_even_counter;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the module under test (uut)
    even_counter uut (
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
        reset = 0; // Release reset

        // Test case 1: Count should start from 0
        if (count !== 4'b0000) begin
            $display("FAIL: Initial count is not 0");
            $finish;
        end

        // Test case 2: Increment when LSB is 1
        // Set count to 1 (LSB = 1)
        uut.count = 4'b0001;
        #10; // Wait for 10ns
        if (count !== 4'b0010) begin
            $display("FAIL: Count did not increment correctly from 1 to 2");
            $finish;
        end

        // Test case 3: Increment when LSB is 1
        uut.count = 4'b0011; // Set count to 3 (LSB = 1)
        #10; // Wait for 10ns
        if (count !== 4'b0100) begin
            $display("FAIL: Count did not increment correctly from 3 to 4");
            $finish;
        end

        // Test case 4: Count should reset to 0 after reaching 14
        uut.count = 4'b1110; // Set count to 14
        #10; // Wait for 10ns
        if (count !== 4'b0000) begin
            $display("FAIL: Count did not reset correctly from 14 to 0");
            $finish;
        end

        // Test case 5: Ensure count increments correctly after reset
        uut.count = 4'b0001; // Set count to 1 (LSB = 1)
        #10; // Wait for 10ns
        if (count !== 4'b0010) begin
            $display("FAIL: Count did not increment correctly from 1 to 2 after reset");
            $finish;
        end

        // Test case 6: Ensure count does not increment when LSB is 0
        uut.count = 4'b0010; // Set count to 2 (LSB = 0)
        #10; // Wait for 10ns
        if (count !== 4'b0010) begin
            $display("FAIL: Count should not increment when LSB is 0");
            $finish;
        end

        // Test case 7: Ensure count increments correctly from 2 to 4
        uut.count = 4'b0011; // Set count to 3 (LSB = 1)
        #10; // Wait for 10ns
        if (count !== 4'b0100) begin
            $display("FAIL: Count did not increment correctly from 3 to 4");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule