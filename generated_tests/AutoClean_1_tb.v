`timescale 1ns/1ps

module tb_AutoClean;

    reg clk;
    reg reset;
    reg clean_trigger;
    wire cleaning_done;

    // Instantiate the AutoClean module
    AutoClean uut (
        .clk(clk),
        .reset(reset),
        .clean_trigger(clean_trigger),
        .cleaning_done(cleaning_done)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        clean_trigger = 0;
        #10; // Wait for a few clock cycles

        // Release reset
        reset = 0;
        #10;

        // Test 1: Trigger clean cycle
        clean_trigger = 1;
        #10; // Wait for 1 clock cycle
        if (uut.clean_cycle_counter !== 1) begin
            $display("FAIL: Expected clean_cycle_counter to be 1 after 1 trigger");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (uut.clean_cycle_counter !== 2) begin
            $display("FAIL: Expected clean_cycle_counter to be 2 after 2 triggers");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (uut.clean_cycle_counter !== 3) begin
            $display("FAIL: Expected clean_cycle_counter to be 3 after 3 triggers");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (uut.clean_cycle_counter !== 4) begin
            $display("FAIL: Expected clean_cycle_counter to be 4 after 4 triggers");
            $finish;
        end

        // Check cleaning_done signal
        #10; // Wait for 1 clock cycle
        if (cleaning_done !== 1) begin
            $display("FAIL: Expected cleaning_done to be asserted after 4 triggers");
            $finish;
        end

        // Test 2: Reset functionality
        reset = 1;
        #10; // Wait for reset to take effect
        reset = 0;
        #10;

        // Ensure cleaning_done is deasserted after reset
        if (cleaning_done !== 0) begin
            $display("FAIL: Expected cleaning_done to be deasserted after reset");
            $finish;
        end

        // Test 3: Non-trigger condition
        clean_trigger = 1;
        #10; // Trigger once
        clean_trigger = 0;
        #10; // Wait for a clock cycle

        // Ensure counter resets on non-trigger
        if (uut.clean_cycle_counter !== 0) begin
            $display("FAIL: Expected clean_cycle_counter to be 0 after non-trigger");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule