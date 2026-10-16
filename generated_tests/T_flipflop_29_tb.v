`timescale 1ns/1ps

module tb_T_flipflop;

    // Inputs
    reg t;
    reg clk;
    reg rst;

    // Outputs
    wire qn;
    wire qn_bar;

    // Instantiate the Unit Under Test (UUT)
    T_flipflop uut (
        .t(t),
        .clk(clk),
        .rst(rst),
        .qn(qn),
        .qn_bar(qn_bar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 0; t = 0;
        #10; // Wait for 10ns
        
        // Test reset functionality
        rst = 1; // Release reset
        #10;
        if (qn !== 0 || qn_bar !== 1) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Test toggling behavior
        t = 1; // Set T high to toggle
        #10; // Wait for one clock cycle
        if (qn !== 1 || qn_bar !== 0) begin
            $display("FAIL: Toggled state is incorrect after first toggle");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (qn !== 0 || qn_bar !== 1) begin
            $display("FAIL: Toggled state is incorrect after second toggle");
            $finish;
        end

        // Test with T low
        t = 0; // Set T low to hold state
        #10; // Wait for one clock cycle
        if (qn !== 0 || qn_bar !== 1) begin
            $display("FAIL: State should remain the same when T is low");
            $finish;
        end

        // Test reset functionality again
        rst = 0; // Assert reset
        #10; // Wait for reset to take effect
        if (qn !== 0 || qn_bar !== 1) begin
            $display("FAIL: State after reset is incorrect");
            $finish;
        end

        // Release reset and toggle again
        rst = 1; 
        t = 1; // Set T high to toggle
        #10; // Wait for one clock cycle
        if (qn !== 1 || qn_bar !== 0) begin
            $display("FAIL: Toggled state is incorrect after reset release");
            $finish;
        end

        // Final check
        #10; // Wait for another clock cycle
        if (qn !== 0 || qn_bar !== 1) begin
            $display("FAIL: Final toggled state is incorrect");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule