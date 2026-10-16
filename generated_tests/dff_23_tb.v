`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the D flip-flop
    dff uut (
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
        rst = 0;

        // Test 1: Reset the flip-flop
        rst = 1; #10; // Assert reset
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Check D input when not reset
        rst = 0; #10; // Release reset
        d = 1; #10; // Set D to 1
        if (q !== 1) begin
            $display("FAIL: q did not update to D when clk rose");
            $finish;
        end

        // Test 3: Change D input
        d = 0; #10; // Change D to 0
        if (q !== 0) begin
            $display("FAIL: q did not update to D when clk rose");
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1; #10; // Assert reset
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 5: Check D input after reset
        rst = 0; #10; // Release reset
        d = 1; #10; // Set D to 1
        if (q !== 1) begin
            $display("FAIL: q did not update to D when clk rose");
            $finish;
        end

        // Test 6: Final state check
        d = 0; #10; // Change D to 0
        if (q !== 0) begin
            $display("FAIL: q did not update to D when clk rose");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule