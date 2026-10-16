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
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: Output should be 1 after reset is released");
            $finish;
        end

        // Check output on clock edges
        #10; // Wait for next clock edge
        if (q !== 1'b1) begin
            $display("FAIL: Output should be 1 at clock edge");
            $finish;
        end

        #10; // Wait for next clock edge
        if (q !== 1'b1) begin
            $display("FAIL: Output should be 1 at clock edge");
            $finish;
        end

        // Assert reset functionality
        reset = 1; // Assert reset
        #10; // Wait for reset to take effect
        if (q !== 1'b0) begin
            $display("FAIL: Output should be 0 when reset is asserted");
            $finish;
        end

        reset = 0; // Release reset
        #10; // Wait for next clock edge
        if (q !== 1'b1) begin
            $display("FAIL: Output should be 1 after reset is released");
            $finish;
        end

        // Final check
        #10; // Wait for next clock edge
        if (q !== 1'b1) begin
            $display("FAIL: Output should be 1 at clock edge");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule