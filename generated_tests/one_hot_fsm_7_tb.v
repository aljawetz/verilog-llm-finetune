`timescale 1ns/1ps

module tb_one_hot_fsm;
    reg clk;
    reg rst;
    wire [3:0] state;
    wire [1:0] out;

    // Instantiate the module under test (uut)
    one_hot_fsm uut (
        .clk(clk),
        .rst(rst),
        .state(state),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Reset the FSM
        rst = 1;
        #10; // Wait for 10ns
        rst = 0;

        // Check initial state
        if (state !== 4'b0001) begin
            $display("FAIL: Initial state is not IDLE");
            $finish;
        end

        // State transitions
        #10; // Wait for one clock cycle
        if (state !== 4'b0010 || out !== 2'b00) begin
            $display("FAIL: After IDLE, state is not STATE1 or output is incorrect");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (state !== 4'b0100 || out !== 2'b01) begin
            $display("FAIL: After STATE1, state is not STATE2 or output is incorrect");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (state !== 4'b1000 || out !== 2'b10) begin
            $display("FAIL: After STATE2, state is not STATE3 or output is incorrect");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (state !== 4'b0001 || out !== 2'b11) begin
            $display("FAIL: After STATE3, state is not IDLE or output is incorrect");
            $finish;
        end

        // Finish the simulation
        $display("PASS");
        $finish;
    end
endmodule