`timescale 1ns/1ps

module tb_FSM_Mealy_detector;
    reg din;
    reg clk;
    reg rst;
    wire dout;

    // Instantiate the module under test (uut)
    FSM_Mealy_detector uut (
        .din(din),
        .clk(clk),
        .rst(rst),
        .dout(dout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 1; din = 0;
        #10; // Wait for 10ns
        rst = 0;

        // Test sequence to check the FSM behavior
        // Input: 0 -> 0 -> 1 -> 0 -> 1 -> 1 -> 0
        // Expected output: 0 -> 0 -> 0 -> 1
        din = 0; #10; // State S0, dout should be 0
        if (dout !== 1'b0) $display("FAIL: Expected dout = 0 in state S0");

        din = 0; #10; // State S0, dout should be 0
        if (dout !== 1'b0) $display("FAIL: Expected dout = 0 in state S0");

        din = 1; #10; // Transition to S1, dout should be 0
        if (dout !== 1'b0) $display("FAIL: Expected dout = 0 in state S1");

        din = 0; #10; // Transition to S2, dout should be 0
        if (dout !== 1'b0) $display("FAIL: Expected dout = 0 in state S2");

        din = 1; #10; // Transition to S3, dout should be 0
        if (dout !== 1'b0) $display("FAIL: Expected dout = 0 in state S3");

        din = 0; #10; // Transition to S0, dout should be 1
        if (dout !== 1'b1) $display("FAIL: Expected dout = 1 in state S0");

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule