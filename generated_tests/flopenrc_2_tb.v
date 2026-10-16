`timescale 1ns/1ps

module tb_flopenrc;

    reg clk;
    reg rst;
    reg en;
    reg clear;
    reg [7:0] d;
    wire [7:0] q;

    // Instantiate the module under test (uut)
    flopenrc #(8) uut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .clear(clear),
        .d(d),
        .q(q)
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
        en = 0;
        clear = 0;
        d = 8'h00;

        // Release reset
        #10 rst = 0;

        // Test 1: Check reset functionality
        #10;
        if (q !== 8'h00) begin
            $display("FAIL: Reset did not set output to zero");
            $finish;
        end

        // Test 2: Check clear functionality
        en = 1;
        d = 8'hA5; // Arbitrary data
        #10; // Capture data
        if (q !== 8'hA5) begin
            $display("FAIL: Output did not capture input data");
            $finish;
        end

        clear = 1; // Activate clear
        #10; // Wait for clear to take effect
        if (q !== 8'h00) begin
            $display("FAIL: Clear did not set output to zero");
            $finish;
        end

        // Test 3: Check enable functionality
        clear = 0; // Deactivate clear
        d = 8'hFF; // New data
        #10; // Capture data
        if (q !== 8'hFF) begin
            $display("FAIL: Output did not capture new input data");
            $finish;
        end

        // Test 4: Check reset while enabled
        rst = 1; // Activate reset
        #10; // Wait for reset to take effect
        if (q !== 8'h00) begin
            $display("FAIL: Reset did not set output to zero while enabled");
            $finish;
        end

        // Test 5: Check clear while enabled
        rst = 0; // Deactivate reset
        en = 1;
        d = 8'hAA; // New data
        #10; // Capture data
        if (q !== 8'hAA) begin
            $display("FAIL: Output did not capture new input data");
            $finish;
        end

        clear = 1; // Activate clear
        #10; // Wait for clear to take effect
        if (q !== 8'h00) begin
            $display("FAIL: Clear did not set output to zero while enabled");
            $finish;
        end

        // Finalize test
        $display("PASS");
        $finish;
    end

endmodule