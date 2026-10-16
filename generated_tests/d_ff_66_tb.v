`timescale 1ns/1ps

module tb_d_ff;

    // Testbench signals
    reg in;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the D Flip-Flop
    d_ff uut (
        .in(in),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1; // Assert reset
        in = 0;
        #10; // Wait for 10ns

        // Deassert reset
        rst = 0;
        #10; // Wait for 10ns

        // Test case 1: Check reset functionality
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Check D Flip-Flop behavior
        in = 1; // Set input to 1
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: q did not follow input in after clock edge");
            $finish;
        end

        // Test case 3: Change input and check output
        in = 0; // Change input to 0
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: q did not follow input in after clock edge");
            $finish;
        end

        // Test case 4: Check reset functionality again
        rst = 1; // Assert reset
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 5: Check qbar output
        rst = 0; // Deassert reset
        in = 1; // Set input to 1
        #10; // Wait for 10ns
        if (qbar !== 0) begin
            $display("FAIL: qbar did not reflect the correct value of q");
            $finish;
        end

        // Final check
        in = 0; // Change input to 0
        #10; // Wait for 10ns
        if (qbar !== 1) begin
            $display("FAIL: qbar did not reflect the correct value of q");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule