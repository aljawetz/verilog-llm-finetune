`timescale 1ns/1ps

module tb_dff_const1;

    reg clk;
    reg reset;
    wire q;

    // Instantiate the module under test (uut)
    dff_const1 uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Check output after reset
        #10; // Wait for one clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: Output q should be 1 after reset is released");
            $finish;
        end

        // Check output after another clock cycle
        #10; // Wait for another clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: Output q should remain 1");
            $finish;
        end

        // Assert reset again
        reset = 1;
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Check output after reset
        #10; // Wait for one clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: Output q should be 1 after reset is released again");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule