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

        // Wait for the timer to complete
        wait(done);
        
        // Check if done is asserted after DELAY cycles
        if (uut.Q_reg !== (DELAY - 1)) begin
            $display("FAIL: Timer did not reach the expected count.");
            $finish;
        end

        // Wait for one more clock cycle to ensure done is asserted
        #10;
        if (done !== 1) begin
            $display("FAIL: Done signal not asserted after reaching delay.");
            $finish;
        end

        // Wait for the timer to reset
        #10;
        if (uut.Q_reg !== 0) begin
            $display("FAIL: Timer did not reset after done.");
            $finish;
        end

        // Wait for the timer to complete again
        wait(done);
        if (uut.Q_reg !== (DELAY - 1)) begin
            $display("FAIL: Timer did not reach the expected count on second run.");
            $finish;
        end

        // Final check for done signal
        #10;
        if (done !== 1) begin
            $display("FAIL: Done signal not asserted after second delay.");
            $finish;
        end

        // Final reset check
        #10;
        if (uut.Q_reg !== 0) begin
            $display("FAIL: Timer did not reset after second done.");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule