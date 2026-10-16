`timescale 1ns/1ps

module tb_top_module;

    reg in;
    reg clk;
    reg areset;
    wire out;

    // Instantiate the module under test (uut)
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
        areset = 0;
        in = 0;

        // Apply reset
        #3 areset = 1; // Release reset after 3ns
        #10;

        // Test sequence
        // State A (initial state)
        if (uut.state !== 0) begin
            $display("FAIL: Initial state is not A");
            $finish;
        end

        // Test transition from A to B
        in = 1; #10;
        if (uut.state !== 1) begin
            $display("FAIL: State did not transition to B");
            $finish;
        end

        // Test transition from B to C
        in = 0; #10;
        if (uut.state !== 2) begin
            $display("FAIL: State did not transition to C");
            $finish;
        end

        // Test transition from C to D
        in = 1; #10;
        if (uut.state !== 3) begin
            $display("FAIL: State did not transition to D");
            $finish;
        end

        // Check output when in state D
        if (out !== 1) begin
            $display("FAIL: Output is not high when in state D");
            $finish;
        end

        // Test transition from D to B
        in = 1; #10;
        if (uut.state !== 1) begin
            $display("FAIL: State did not transition back to B");
            $finish;
        end

        // Test transition from B to C again
        in = 0; #10;
        if (uut.state !== 2) begin
            $display("FAIL: State did not transition back to C");
            $finish;
        end

        // Test reset functionality
        areset = 0; #10; // Assert reset
        if (uut.state !== 0) begin
            $display("FAIL: State did not reset to A");
            $finish;
        end

        // Release reset and check initial state again
        areset = 1; #10;
        if (uut.state !== 0) begin
            $display("FAIL: State is not A after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule