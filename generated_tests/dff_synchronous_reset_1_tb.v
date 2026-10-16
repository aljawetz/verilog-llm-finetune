`timescale 1ns/1ps

module tb_dff_synchronous_reset;

    reg clk;
    reg resetn;
    reg d_in;
    wire q;
    wire qbar;

    // Instantiate the module under test (uut)
    dff_synchronous_reset uut (
        .clk(clk),
        .resetn(resetn),
        .d_in(d_in),
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
        // Initialize inputs
        resetn = 0;
        d_in = 0;

        // Apply reset
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Release reset and check behavior
        resetn = 1;
        #10;

        // Test D flip-flop behavior
        d_in = 1; // Set D input to 1
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: After setting d_in to 1, q should be 1 and qbar should be 0");
            $finish;
        end

        d_in = 0; // Set D input to 0
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: After setting d_in to 0, q should be 0 and qbar should be 1");
            $finish;
        end

        // Test reset functionality again
        resetn = 0; // Assert reset
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1 again");
            $finish;
        end

        // Release reset and check again
        resetn = 1;
        #10;

        // Final test with multiple clock cycles
        d_in = 1;
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Final check failed, q should be 1 and qbar should be 0");
            $finish;
        end

        d_in = 0;
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Final check failed, q should be 0 and qbar should be 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule