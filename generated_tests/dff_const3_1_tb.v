`timescale 1ns/1ps

module tb_dff_const3;

    reg clk;
    reg reset;
    wire q;

    // Instantiate the module under test
    dff_const3 uut (
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
        reset = 0;
        
        // Check initial state after reset
        if (q !== 1'b1) begin
            $display("FAIL: Initial state of q is not 1 after reset");
            $finish;
        end

        // Wait for one clock cycle
        #10;

        // Check state after first clock edge
        if (q !== 1'b0) begin
            $display("FAIL: State of q is not 0 after first clock edge");
            $finish;
        end

        // Next clock cycle
        #10;

        // Check state after second clock edge
        if (q !== 1'b1) begin
            $display("FAIL: State of q is not 1 after second clock edge");
            $finish;
        end

        // Next clock cycle
        #10;

        // Check state after third clock edge
        if (q !== 1'b1) begin
            $display("FAIL: State of q is not 1 after third clock edge");
            $finish;
        end

        // Assert reset again
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Check state after reset again
        if (q !== 1'b1) begin
            $display("FAIL: State of q is not 1 after second reset");
            $finish;
        end

        // Final clock cycle
        #10;

        // Check state after final clock edge
        if (q !== 1'b0) begin
            $display("FAIL: State of q is not 0 after final clock edge");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule