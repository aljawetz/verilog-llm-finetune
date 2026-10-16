`timescale 1ns/1ps

module tb_edge_detect;

    // Testbench signals
    reg clk;
    reg rst_n;
    reg a;
    wire rise;
    wire down;

    // Instantiate the edge_detect module
    edge_detect uut (
        .clk(clk),
        .rst_n(rst_n),
        .a(a),
        .rise(rise),
        .down(down)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        a = 0;

        // Apply reset
        #10;
        rst_n = 1; // Release reset
        #10;

        // Test rising edge detection
        a = 1; // a goes from 0 to 1
        #10;
        if (rise !== 1 || down !== 0) begin
            $display("FAIL: Rising edge not detected correctly");
            $finish;
        end

        // Clear rise for next test
        #10;
        if (rise !== 0 || down !== 0) begin
            $display("FAIL: Rise signal not cleared after detection");
            $finish;
        end

        // Test falling edge detection
        a = 0; // a goes from 1 to 0
        #10;
        if (rise !== 0 || down !== 1) begin
            $display("FAIL: Falling edge not detected correctly");
            $finish;
        end

        // Clear down for next test
        #10;
        if (rise !== 0 || down !== 0) begin
            $display("FAIL: Down signal not cleared after detection");
            $finish;
        end

        // Test no edge condition
        a = 0; // No change
        #10;
        if (rise !== 0 || down !== 0) begin
            $display("FAIL: No edge condition not detected correctly");
            $finish;
        end

        // Test reset functionality
        rst_n = 0; // Assert reset
        #10;
        if (rise !== 0 || down !== 0) begin
            $display("FAIL: Signals not cleared on reset");
            $finish;
        end

        // Release reset and check signals
        rst_n = 1;
        #10;
        if (rise !== 0 || down !== 0) begin
            $display("FAIL: Signals not cleared after reset release");
            $finish;
        end

        // Final check for no edge
        a = 1; // a goes to 1
        #10;
        a = 1; // No change
        #10;
        if (rise !== 0 || down !== 0) begin
            $display("FAIL: No edge condition not detected correctly after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule