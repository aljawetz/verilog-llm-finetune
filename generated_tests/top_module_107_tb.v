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
        // Initialize inputs
        areset = 1;
        in = 0;

        // Apply asynchronous reset
        #3 areset = 0; // Assert reset
        #10 areset = 1; // Deassert reset

        // Test sequence
        // State A to B
        #10 in = 1; // Move to state B
        #10 in = 0; // Stay in state B
        if (uut.state !== 2'b01) $display("FAIL: Expected state B, got %b", uut.state);

        // State B to C
        #10 in = 0; // Move to state C
        if (uut.state !== 2'b10) $display("FAIL: Expected state C, got %b", uut.state);

        // State C to D
        #10 in = 1; // Move to state D
        if (uut.state !== 2'b11) $display("FAIL: Expected state D, got %b", uut.state);
        if (out !== 1) $display("FAIL: Expected output high in state D, got %b", out);

        // State D to B
        #10 in = 1; // Move back to state B
        if (uut.state !== 2'b01) $display("FAIL: Expected state B, got %b", uut.state);
        
        // State B to C
        #10 in = 0; // Move to state C
        if (uut.state !== 2'b10) $display("FAIL: Expected state C, got %b", uut.state);

        // State C to A
        #10 in = 0; // Move back to state A
        if (uut.state !== 2'b00) $display("FAIL: Expected state A, got %b", uut.state);

        // Final check for output
        if (out !== 0) $display("FAIL: Expected output low in state A, got %b", out);

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule