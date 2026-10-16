`timescale 1ns/1ps

module tb_dff;
    reg d;
    reg clk;
    wire q;

    // Instantiate the D Flip-Flop
    dff uut (
        .d(d),
        .clk(clk),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        d = 0;

        // Wait for the first clock edge
        #10;

        // Test case 1: Set d = 1, expect q = 1 after clock edge
        d = 1;
        #10; // Wait for the next clock edge
        if (q !== 1) begin
            $display("FAIL: Test case 1 failed, expected q = 1, got q = %b", q);
            $finish;
        end

        // Test case 2: Set d = 0, expect q = 0 after clock edge
        d = 0;
        #10; // Wait for the next clock edge
        if (q !== 0) begin
            $display("FAIL: Test case 2 failed, expected q = 0, got q = %b", q);
            $finish;
        end

        // Test case 3: Toggle d = 1, expect q = 1 after clock edge
        d = 1;
        #10; // Wait for the next clock edge
        if (q !== 1) begin
            $display("FAIL: Test case 3 failed, expected q = 1, got q = %b", q);
            $finish;
        end

        // Test case 4: Toggle d = 0, expect q = 0 after clock edge
        d = 0;
        #10; // Wait for the next clock edge
        if (q !== 0) begin
            $display("FAIL: Test case 4 failed, expected q = 0, got q = %b", q);
            $finish;
        end

        // Test case 5: Set d = 1 again, expect q = 1 after clock edge
        d = 1;
        #10; // Wait for the next clock edge
        if (q !== 1) begin
            $display("FAIL: Test case 5 failed, expected q = 1, got q = %b", q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule