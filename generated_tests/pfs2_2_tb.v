`timescale 1ns/1ps

module tb_pfs2;

    reg clk;
    reg a;
    wire b;

    // Instantiate the module under test (uut)
    pfs2 uut (
        .clk(clk),
        .a(a),
        .b(b)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        a = 0;

        // Wait for a few clock cycles
        #10;

        // Test case 1: Check initial value of b
        if (b !== 0) begin
            $display("FAIL: Initial value of b is not 0");
            $finish;
        end

        // Test case 2: Change a to 1
        a = 1;
        #10; // Wait for one clock cycle
        if (b !== 1) begin
            $display("FAIL: b did not update to 1 when a was set to 1");
            $finish;
        end

        // Test case 3: Change a to 0
        a = 0;
        #10; // Wait for one clock cycle
        if (b !== 0) begin
            $display("FAIL: b did not update to 0 when a was set to 0");
            $finish;
        end

        // Test case 4: Toggle a
        a = 1;
        #10; // Wait for one clock cycle
        if (b !== 1) begin
            $display("FAIL: b did not update to 1 when a was toggled to 1");
            $finish;
        end

        a = 0;
        #10; // Wait for one clock cycle
        if (b !== 0) begin
            $display("FAIL: b did not update to 0 when a was toggled to 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule