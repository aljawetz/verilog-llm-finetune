`timescale 1ns/1ps

module tb_pipo;

    reg clk;
    reg reset;
    reg [3:0] d;
    wire [3:0] q;

    // Instantiate the module under test (uut)
    pipo uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 4'b0000;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Load data 4'b1010
        d = 4'b1010;
        #10; // Wait for one clock cycle
        if (q !== 4'b1010) begin
            $display("FAIL: Expected q = 4'b1010, got q = %b", q);
            $finish;
        end

        // Test case 2: Load data 4'b1100
        d = 4'b1100;
        #10; // Wait for one clock cycle
        if (q !== 4'b1100) begin
            $display("FAIL: Expected q = 4'b1100, got q = %b", q);
            $finish;
        end

        // Test case 3: Assert reset functionality
        reset = 1;
        #10; // Wait for one clock cycle
        if (q !== 4'b0000) begin
            $display("FAIL: Expected q = 4'b0000 after reset, got q = %b", q);
            $finish;
        end

        // Test case 4: Load data after reset
        reset = 0;
        d = 4'b0111;
        #10; // Wait for one clock cycle
        if (q !== 4'b0111) begin
            $display("FAIL: Expected q = 4'b0111, got q = %b", q);
            $finish;
        end

        // Test case 5: Load data 4'b0001
        d = 4'b0001;
        #10; // Wait for one clock cycle
        if (q !== 4'b0001) begin
            $display("FAIL: Expected q = 4'b0001, got q = %b", q);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule