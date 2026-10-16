`timescale 1ns/1ps

module tb_Async_DFF;

    reg clk;
    reg D;
    reg reset_n;
    reg clear_n;
    wire Q;

    // Instantiate the module under test (uut)
    Async_DFF uut (
        .clk(clk),
        .D(D),
        .reset_n(reset_n),
        .clear_n(clear_n),
        .Q(Q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset_n = 1;
        clear_n = 1;
        D = 0;

        // Test 1: Asynchronous reset
        reset_n = 0; // Assert reset
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Asynchronous reset failed");
            $finish;
        end
        reset_n = 1; // Deassert reset
        #10;

        // Test 2: Check D input
        D = 1; // Set D to 1
        #10;
        if (Q !== 1'b1) begin
            $display("FAIL: D input capture failed");
            $finish;
        end

        // Test 3: Synchronous clear
        clear_n = 0; // Assert clear
        #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Synchronous clear failed");
            $finish;
        end
        clear_n = 1; // Deassert clear
        #10;

        // Test 4: Check D input again after clear
        D = 0; // Set D to 0
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: D input capture after clear failed");
            $finish;
        end

        // Test 5: Check D input with clear active
        clear_n = 0; // Assert clear
        #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Synchronous clear with D input failed");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule