`timescale 1ns/1ps

module tb_D_FlipFlop_16bits;

    reg [15:0] D;
    reg CLK;
    reg rst;
    wire [15:0] Q;

    // Instantiate the D_FlipFlop_16bits module
    D_FlipFlop_16bits uut (
        .D(D),
        .CLK(CLK),
        .rst(rst),
        .Q(Q)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        D = 16'h0000;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Check reset functionality
        if (Q !== 16'h0000) begin
            $display("FAIL: Reset did not clear Q to 0");
            $finish;
        end

        // Test case 2: Check D input on clock edge
        D = 16'hA5A5; // Set D to a known value
        #10; // Wait for a clock edge
        if (Q !== 16'hA5A5) begin
            $display("FAIL: Q did not update to D on clock edge");
            $finish;
        end

        // Test case 3: Check another D input
        D = 16'h5A5A; // Change D to another value
        #10; // Wait for a clock edge
        if (Q !== 16'h5A5A) begin
            $display("FAIL: Q did not update to new D on clock edge");
            $finish;
        end

        // Test case 4: Check reset functionality again
        rst = 1; // Assert reset
        #10; // Wait for reset to take effect
        if (Q !== 16'h0000) begin
            $display("FAIL: Reset did not clear Q to 0 again");
            $finish;
        end

        // Test case 5: Check D input after reset
        rst = 0; // Release reset
        D = 16'hFFFF; // Set D to a known value
        #10; // Wait for a clock edge
        if (Q !== 16'hFFFF) begin
            $display("FAIL: Q did not update to D after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule