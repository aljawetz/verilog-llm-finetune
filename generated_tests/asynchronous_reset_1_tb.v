`timescale 1ns/1ps

module tb_asynchronous_reset;

    reg clk;
    reg reset;
    reg din;
    wire dout;

    // Instantiate the module under test (uut)
    asynchronous_reset uut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 0;
        din = 0;

        // Test 1: Check reset functionality
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        if (dout !== 1'b0) begin
            $display("FAIL: Reset did not clear dout to 0");
            $finish;
        end

        // Test 2: Check normal operation
        reset = 0; // Deassert reset
        din = 1;   // Set data input
        #10; // Wait for a clock edge
        if (dout !== 1'b1) begin
            $display("FAIL: dout did not update to din");
            $finish;
        end

        // Test 3: Check reset during operation
        din = 0;   // Change data input
        #5;        // Wait a bit before asserting reset
        reset = 1; // Assert reset
        #10; // Wait for a clock edge
        if (dout !== 1'b0) begin
            $display("FAIL: Reset did not clear dout to 0 during operation");
            $finish;
        end

        // Test 4: Check that dout does not change while reset is asserted
        reset = 0; // Deassert reset
        #10; // Wait for a clock edge
        if (dout !== 1'b0) begin
            $display("FAIL: dout changed while reset was asserted");
            $finish;
        end

        // Test 5: Final check with multiple clock cycles
        din = 1;   // Set data input
        #10; // Wait for a clock edge
        if (dout !== 1'b1) begin
            $display("FAIL: dout did not update to din after reset deasserted");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule