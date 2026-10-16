`timescale 1ns/1ps

module tb_neg_edge_dec;

    reg clk;
    reg sig;
    wire out;

    // Instantiate the module under test (uut)
    neg_edge_dec uut (
        .clk(clk),
        .sig(sig),
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
        sig = 0;

        // Wait for a few clock cycles
        #10;

        // Test case 1: No negative edge
        sig = 1; #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0, got %b", out);
            $finish;
        end

        // Test case 2: Negative edge detected
        sig = 0; #10;
        if (out !== 1) begin
            $display("FAIL: Expected out = 1, got %b", out);
            $finish;
        end

        // Test case 3: No negative edge
        sig = 1; #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0, got %b", out);
            $finish;
        end

        // Test case 4: Another negative edge detected
        sig = 0; #10;
        if (out !== 1) begin
            $display("FAIL: Expected out = 1, got %b", out);
            $finish;
        end

        // Test case 5: No negative edge
        sig = 1; #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0, got %b", out);
            $finish;
        end

        // Final check to ensure no more edges
        sig = 1; #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule