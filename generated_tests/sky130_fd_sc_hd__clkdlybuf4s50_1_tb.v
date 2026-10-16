`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__clkdlybuf4s50;

    // Testbench signals
    reg A;
    wire X;

    // Instantiate the module under test (uut)
    sky130_fd_sc_hd__clkdlybuf4s50 uut (
        .X(X),
        .A(A)
    );

    // Clock generation
    reg clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        A = 0;

        // Wait for a clock cycle
        @(posedge clk);
        
        // Test case 1: Check output when A is 0
        if (X !== 0) begin
            $display("FAIL: Expected X = 0 when A = 0, got X = %b", X);
            $finish;
        end

        // Test case 2: Change A to 1
        A = 1;
        @(posedge clk);
        
        // Check output when A is 1
        if (X !== 1) begin
            $display("FAIL: Expected X = 1 when A = 1, got X = %b", X);
            $finish;
        end

        // Test case 3: Change A back to 0
        A = 0;
        @(posedge clk);
        
        // Check output when A is 0 again
        if (X !== 0) begin
            $display("FAIL: Expected X = 0 when A = 0, got X = %b", X);
            $finish;
        end

        // Test case 4: Change A to 1 again
        A = 1;
        @(posedge clk);
        
        // Check output when A is 1 again
        if (X !== 1) begin
            $display("FAIL: Expected X = 1 when A = 1, got X = %b", X);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule