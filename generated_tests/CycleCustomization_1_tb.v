`timescale 1ns/1ps

module tb_CycleCustomization;

    reg clk;
    reg reset;
    reg start;
    reg [1:0] cycle_mode;
    wire cycle_ready;
    wire [3:0] wash_duration;
    wire [3:0] rinse_duration;
    wire [3:0] spin_duration;

    // Instantiate the Unit Under Test (UUT)
    CycleCustomization uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .cycle_mode(cycle_mode),
        .cycle_ready(cycle_ready),
        .wash_duration(wash_duration),
        .rinse_duration(rinse_duration),
        .spin_duration(spin_duration)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        start = 0;
        cycle_mode = 2'b00;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test Normal Cycle
        cycle_mode = 2'b00;
        start = 1;
        #10;
        start = 0;
        #10;

        if (wash_duration !== 4'd8) $display("FAIL: Wash duration for Normal cycle is incorrect");
        if (rinse_duration !== 4'd6) $display("FAIL: Rinse duration for Normal cycle is incorrect");
        if (spin_duration !== 4'd4) $display("FAIL: Spin duration for Normal cycle is incorrect");
        if (cycle_ready !== 1) $display("FAIL: Cycle not ready for Normal cycle");

        // Reset and check
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Test Quick Cycle
        cycle_mode = 2'b01;
        start = 1;
        #10;
        start = 0;
        #10;

        if (wash_duration !== 4'd4) $display("FAIL: Wash duration for Quick cycle is incorrect");
        if (rinse_duration !== 4'd3) $display("FAIL: Rinse duration for Quick cycle is incorrect");
        if (spin_duration !== 4'd2) $display("FAIL: Spin duration for Quick cycle is incorrect");
        if (cycle_ready !== 1) $display("FAIL: Cycle not ready for Quick cycle");

        // Reset and check
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Test Heavy Cycle
        cycle_mode = 2'b10;
        start = 1;
        #10;
        start = 0;
        #10;

        if (wash_duration !== 4'd12) $display("FAIL: Wash duration for Heavy cycle is incorrect");
        if (rinse_duration !== 4'd8) $display("FAIL: Rinse duration for Heavy cycle is incorrect");
        if (spin_duration !== 4'd6) $display("FAIL: Spin duration for Heavy cycle is incorrect");
        if (cycle_ready !== 1) $display("FAIL: Cycle not ready for Heavy cycle");

        // Reset and check
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Test invalid cycle mode (default case)
        cycle_mode = 2'b11; // Invalid mode
        start = 1;
        #10;
        start = 0;
        #10;

        if (wash_duration !== 4'd8) $display("FAIL: Wash duration for default cycle is incorrect");
        if (rinse_duration !== 4'd6) $display("FAIL: Rinse duration for default cycle is incorrect");
        if (spin_duration !== 4'd4) $display("FAIL: Spin duration for default cycle is incorrect");
        if (cycle_ready !== 1) $display("FAIL: Cycle not ready for default cycle");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule