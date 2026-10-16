`timescale 1ns/1ps

module tb_dff63_0;

    reg [63:0] d;
    reg clk;
    wire [63:0] q;

    // Instantiate the module under test (uut)
    dff63_0 uut (
        .d(d),
        .clk(clk),
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
        d = 64'h0;

        // Wait for the first clock edge
        #10;

        // Test case 1: Check initial state
        if (q !== 64'h0) begin
            $display("FAIL: Initial output q is not 0");
            $finish;
        end

        // Test case 2: Load a value
        d = 64'hA5A5A5A5A5A5A5A5; // Arbitrary test value
        #10; // Wait for clock edge
        if (q !== 64'hA5A5A5A5A5A5A5A5) begin
            $display("FAIL: Output q did not match input d after clock edge");
            $finish;
        end

        // Test case 3: Load another value
        d = 64'h5A5A5A5A5A5A5A5A; // Another arbitrary test value
        #10; // Wait for clock edge
        if (q !== 64'h5A5A5A5A5A5A5A5A) begin
            $display("FAIL: Output q did not match input d after clock edge");
            $finish;
        end

        // Test case 4: Check that output holds value until next clock edge
        #10; // Wait for another clock edge
        if (q !== 64'h5A5A5A5A5A5A5A5A) begin
            $display("FAIL: Output q changed before next clock edge");
            $finish;
        end

        // Test case 5: Check reset condition (if applicable, here we just check behavior)
        d = 64'h0; // Reset value
        #10; // Wait for clock edge
        if (q !== 64'h0) begin
            $display("FAIL: Output q did not reset to 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule