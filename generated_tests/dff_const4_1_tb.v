`timescale 1ns/1ps

module tb_dff_const4;

    reg clk;
    reg reset;
    wire q;

    // Instantiate the module under test (uut)
    dff_const4 uut (
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
        #10; // Wait for 10ns

        // Check output after reset
        if (q !== 1'b1) begin
            $display("FAIL: Output q should be 1 after reset");
            $finish;
        end

        // Allow some clock cycles to pass
        #20; // Wait for 20ns

        // Check output after some clock cycles
        if (q !== 1'b1) begin
            $display("FAIL: Output q should remain 1");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule