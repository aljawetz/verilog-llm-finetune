`timescale 1ns/1ps

module tb_low_power_fsm;

    reg clk;
    reg rst;
    reg enable;
    wire [1:0] state;

    // Instantiate the module under test (uut)
    low_power_fsm uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .state(state)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        enable = 0;
        #10; // Wait for 10ns
        
        // Release reset
        rst = 0;
        #10;

        // Check initial state
        if (state !== 2'b00) begin
            $display("FAIL: Initial state is not S0");
            $finish;
        end

        // Enable state transitions
        enable = 1;

        // Transition through states
        #10; // Wait for one clock cycle
        if (state !== 2'b01) begin
            $display("FAIL: State did not transition to S1");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (state !== 2'b11) begin
            $display("FAIL: State did not transition to S2");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (state !== 2'b10) begin
            $display("FAIL: State did not transition to S3");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (state !== 2'b00) begin
            $display("FAIL: State did not transition back to S0");
            $finish;
        end

        // Disable the FSM and check state remains the same
        enable = 0;
        #10; // Wait for one clock cycle
        if (state !== 2'b00) begin
            $display("FAIL: State changed when enable is low");
            $finish;
        end

        // Re-enable and check state transitions again
        enable = 1;
        #10; // Wait for one clock cycle
        if (state !== 2'b01) begin
            $display("FAIL: State did not transition to S1 after re-enable");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (state !== 2'b11) begin
            $display("FAIL: State did not transition to S2 after re-enable");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (state !== 2'b10) begin
            $display("FAIL: State did not transition to S3 after re-enable");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (state !== 2'b00) begin
            $display("FAIL: State did not transition back to S0 after re-enable");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule