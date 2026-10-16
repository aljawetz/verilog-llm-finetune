`timescale 1ns/1ps

module tb_dff_async;

    reg d;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the D flip-flop
    dff_async uut (
        .d(d),
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        d = 0;
        rst = 1;

        // Test 1: Check reset functionality
        rst = 0; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Release reset
        rst = 1;
        #10;

        // Test 2: Check data capture on clock edge
        d = 1; // Set data to 1
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q did not capture d on clock edge");
            $finish;
        end

        // Test 3: Change data and check capture
        d = 0; // Change data to 0
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: q did not capture new d on clock edge");
            $finish;
        end

        // Test 4: Check reset functionality again
        rst = 0; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule