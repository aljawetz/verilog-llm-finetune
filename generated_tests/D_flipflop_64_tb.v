`timescale 1ns/1ps

module tb_D_flipflop;

    // Inputs
    reg data_in;
    reg clk;
    reg reset_n;

    // Outputs
    wire q_out;

    // Instantiate the Unit Under Test (UUT)
    D_flipflop uut (
        .data_in(data_in), 
        .clk(clk), 
        .reset_n(reset_n), 
        .q_out(q_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        data_in = 0;
        reset_n = 0;

        // Wait for a clock edge
        #10;
        
        // Test 1: Reset functionality
        reset_n = 0; // Assert reset
        #10;
        if (q_out !== 1'b0) begin
            $display("FAIL: Reset did not set q_out to 0");
            $finish;
        end
        
        // Release reset
        reset_n = 1;
        #10;

        // Test 2: Check D flip-flop behavior
        data_in = 1; // Set data_in to 1
        #10; // Wait for clock edge
        if (q_out !== 1'b1) begin
            $display("FAIL: q_out did not match data_in after clock edge");
            $finish;
        end

        // Test 3: Change data_in
        data_in = 0; // Change data_in to 0
        #10; // Wait for clock edge
        if (q_out !== 1'b0) begin
            $display("FAIL: q_out did not match data_in after clock edge");
            $finish;
        end

        // Test 4: Check reset during operation
        data_in = 1; // Set data_in to 1
        #10; // Wait for clock edge
        reset_n = 0; // Assert reset
        #10;
        if (q_out !== 1'b0) begin
            $display("FAIL: Reset did not set q_out to 0 during operation");
            $finish;
        end

        // Test 5: Ensure q_out can be set again after reset
        reset_n = 1; // Release reset
        #10;
        data_in = 1; // Set data_in to 1
        #10; // Wait for clock edge
        if (q_out !== 1'b1) begin
            $display("FAIL: q_out did not match data_in after clock edge post-reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule