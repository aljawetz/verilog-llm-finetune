`timescale 1ns/1ps

module tb_timer;
    parameter DELAY = 16;
    reg clk;
    reg rstn;
    wire done;

    // Instantiate the timer module
    timer #(DELAY) uut (
        .clk(clk),
        .rstn(rstn),
        .done(done)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        rstn = 0;
        #10; // Wait for 10ns
        rstn = 1; // Release reset

        // Wait for the timer to count up to DELAY - 1
        wait(done);
        #1; // Wait for a small time to ensure done is stable

        // Check if done is high after DELAY cycles
        if (done !== 1'b1) begin
            $display("FAIL: done should be high after %0d cycles", DELAY);
            $finish;
        end

        // Wait for one more clock cycle to see if it resets
        #10;

        // Check if done is low after reset
        if (done !== 1'b0) begin
            $display("FAIL: done should be low after reset");
            $finish;
        end

        // Test reset functionality
        rstn = 0; // Assert reset
        #10; // Wait for reset to take effect
        rstn = 1; // Release reset

        // Wait for the timer to count up to DELAY - 1 again
        wait(done);
        #1; // Wait for a small time to ensure done is stable

        // Check if done is high after DELAY cycles again
        if (done !== 1'b1) begin
            $display("FAIL: done should be high after %0d cycles", DELAY);
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end
endmodule