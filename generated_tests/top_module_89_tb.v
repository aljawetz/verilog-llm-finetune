`timescale 1ns/1ps

module tb_top_module;

    reg in;
    reg clk;
    reg areset;
    wire out;

    // Instantiate the module under test
    top_module uut (
        .in(in),
        .clk(clk),
        .areset(areset),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        areset = 1;
        in = 0;

        // Apply asynchronous reset
        #2 areset = 0; // Assert reset
        #10 areset = 1; // Deassert reset

        // Test sequence
        // State A
        #10;
        if (uut.state !== 0) $display("FAIL: Expected state A after reset");

        // Transition to state B
        in = 1; #10;
        if (uut.state !== 1) $display("FAIL: Expected state B");

        // Transition to state C
        in = 0; #10;
        if (uut.state !== 2) $display("FAIL: Expected state C");

        // Transition to state D
        in = 0; #10;
        if (uut.state !== 3) $display("FAIL: Expected state D");

        // Check output in state D
        if (out !== 1) $display("FAIL: Expected output high in state D");

        // Transition back to state B
        in = 1; #10;
        if (uut.state !== 1) $display("FAIL: Expected state B");

        // Transition to state C
        in = 0; #10;
        if (uut.state !== 2) $display("FAIL: Expected state C");

        // Transition back to state A
        in = 1; #10;
        in = 0; #10;
        if (uut.state !== 0) $display("FAIL: Expected state A");

        // Check output in state A
        if (out !== 0) $display("FAIL: Expected output low in state A");

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule