`timescale 1ns/1ps

module tb_siso_behav;
    reg clk;
    reg rst;
    reg s_in;
    wire s_out;

    // Instantiate the module under test (uut)
    siso_behav uut (
        .clk(clk),
        .rst(rst),
        .s_in(s_in),
        .s_out(s_out)
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
        s_in = 0;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Shift in 1
        s_in = 1;
        #10; // Wait for 10ns
        if (s_out !== 0) $display("FAIL: Expected s_out = 0, got %b", s_out);

        #10; // Wait for 10ns
        if (s_out !== 1) $display("FAIL: Expected s_out = 1, got %b", s_out);

        #10; // Wait for 10ns
        if (s_out !== 1) $display("FAIL: Expected s_out = 1, got %b", s_out);

        // Test case 2: Shift in 0
        s_in = 0;
        #10; // Wait for 10ns
        if (s_out !== 1) $display("FAIL: Expected s_out = 1, got %b", s_out);

        #10; // Wait for 10ns
        if (s_out !== 0) $display("FAIL: Expected s_out = 0, got %b", s_out);

        #10; // Wait for 10ns
        if (s_out !== 0) $display("FAIL: Expected s_out = 0, got %b", s_out);

        // Test case 3: Reset functionality
        rst = 1;
        #10; // Wait for 10ns
        if (s_out !== 0) $display("FAIL: Expected s_out = 0 after reset, got %b", s_out);

        // End simulation
        $display("PASS");
        $finish;
    end
endmodule