`timescale 1ns/1ps

module tb_non_blocking_assig;

    reg clk;
    reg clear;
    reg s_in;
    wire [3:0] s_out;

    // Instantiate the module under test
    non_blocking_assig uut (
        .clk(clk),
        .clear(clear),
        .s_in(s_in),
        .s_out(s_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        clear = 1;
        s_in = 0;

        // Wait for a clock edge
        #10;

        // Test case 1: Clear the output
        if (s_out !== 4'b0000) begin
            $display("FAIL: Output should be 0000 after clear");
            $finish;
        end

        // Release clear
        clear = 0;

        // Test case 2: Shift in a 1
        s_in = 1; 
        #10; // Wait for clock edge
        if (s_out !== 4'b1000) begin
            $display("FAIL: Output should be 1000 after shifting in 1");
            $finish;
        end

        // Test case 3: Shift in a 0
        s_in = 0; 
        #10; // Wait for clock edge
        if (s_out !== 4'b0100) begin
            $display("FAIL: Output should be 0100 after shifting in 0");
            $finish;
        end

        // Test case 4: Shift in a 1 again
        s_in = 1; 
        #10; // Wait for clock edge
        if (s_out !== 4'b1010) begin
            $display("FAIL: Output should be 1010 after shifting in 1");
            $finish;
        end

        // Test case 5: Clear the output again
        clear = 1; 
        #10; // Wait for clock edge
        if (s_out !== 4'b0000) begin
            $display("FAIL: Output should be 0000 after clear");
            $finish;
        end

        // Test case 6: Shift in a 1 after clear
        clear = 0; 
        s_in = 1; 
        #10; // Wait for clock edge
        if (s_out !== 4'b1000) begin
            $display("FAIL: Output should be 1000 after shifting in 1 after clear");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule