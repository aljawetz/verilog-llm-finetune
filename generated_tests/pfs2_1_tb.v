`timescale 1ns/1ps

module tb_pfs2;

    reg clk;
    reg a;
    wire b;

    // Instantiate the unit under test (UUT)
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

        // Test case 1: Check output when a = 0
        if (b !== 0) begin
            $display("FAIL: Expected b = 0 when a = 0, got b = %b", b);
            $finish;
        end

        // Change input a
        a = 1;
        #10; // Wait for one clock cycle

        // Test case 2: Check output when a = 1
        if (b !== 1) begin
            $display("FAIL: Expected b = 1 when a = 1, got b = %b", b);
            $finish;
        end

        // Change input a back to 0
        a = 0;
        #10; // Wait for one clock cycle

        // Test case 3: Check output when a = 0 again
        if (b !== 0) begin
            $display("FAIL: Expected b = 0 when a = 0, got b = %b", b);
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule