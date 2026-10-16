`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the D Flip-Flop
    dff uut (
        .q(q),
        .d(d),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        d = 0;
        rst = 0;

        // Test 1: Check reset functionality
        rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end
        
        rst = 0; // Deassert reset
        #10; // Wait for a clock cycle

        // Test 2: Check data input functionality
        d = 1; // Set data to 1
        #10; // Wait for a clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: q did not follow d when d was 1");
            $finish;
        end

        // Test 3: Change data input
        d = 0; // Set data to 0
        #10; // Wait for a clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: q did not follow d when d was 0");
            $finish;
        end

        // Test 4: Check reset again
        rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Finalize the simulation
        $display("PASS");
        $finish;
    end

endmodule