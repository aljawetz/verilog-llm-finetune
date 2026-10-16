`timescale 1ns/1ps

module tb_d_flip_flop;

    // Testbench signals
    reg clk;
    reg d;
    reg rst;
    wire qout;

    // Instantiate the D flip-flop
    d_flip_flop uut (
        .clk(clk),
        .d(d),
        .rst(rst),
        .qout(qout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1; // Start with reset high
        d = 0;

        // Test 1: Check reset functionality
        #10; // Wait for a clock cycle
        rst = 0; // Activate reset
        #10; // Wait for a clock cycle
        if (qout !== 1'b0) begin
            $display("FAIL: Reset did not set output to 0");
            $finish;
        end

        // Test 2: Check normal operation
        rst = 1; // Deactivate reset
        #10; // Wait for a clock cycle
        d = 1; // Set data input
        #10; // Wait for a clock cycle
        if (qout !== 1'b1) begin
            $display("FAIL: Output did not capture data input");
            $finish;
        end

        // Test 3: Check data change on clock edge
        #10; // Wait for a clock cycle
        d = 0; // Change data input
        #10; // Wait for a clock cycle
        if (qout !== 1'b0) begin
            $display("FAIL: Output did not update on clock edge");
            $finish;
        end

        // Test 4: Check reset functionality again
        #10; // Wait for a clock cycle
        rst = 0; // Activate reset
        #10; // Wait for a clock cycle
        if (qout !== 1'b0) begin
            $display("FAIL: Reset did not set output to 0 again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule