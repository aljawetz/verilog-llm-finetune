`timescale 1ns/1ps

module tb_DFFR;

    parameter WIDTH = 4;
    parameter RESET_VALUE = 4'b1010;

    reg clk;
    reg rst_n;
    reg [WIDTH-1:0] d;
    wire [WIDTH-1:0] q;

    // Instantiate the DFFR module
    DFFR #(
        .WIDTH(WIDTH),
        .RESET_VALUE(RESET_VALUE)
    ) uut (
        .clk(clk),
        .rst_n(rst_n),
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
        // Initialize
        rst_n = 0; // Assert reset
        d = 4'b0000;
        #10; // Wait for 10ns
        
        // Check reset behavior
        if (q !== RESET_VALUE) begin
            $display("FAIL: Reset value is incorrect, expected %b, got %b", RESET_VALUE, q);
            $finish;
        end

        // Release reset
        rst_n = 1;
        #10; // Wait for 10ns

        // Test D flip-flop behavior
        d = 4'b1100; // Set input
        #10; // Wait for 10ns
        if (q !== d) begin
            $display("FAIL: Output does not match input, expected %b, got %b", d, q);
            $finish;
        end

        // Change input
        d = 4'b0011; // Change input
        #10; // Wait for 10ns
        if (q !== d) begin
            $display("FAIL: Output does not match input, expected %b, got %b", d, q);
            $finish;
        end

        // Assert reset again
        rst_n = 0; // Assert reset
        #10; // Wait for 10ns
        if (q !== RESET_VALUE) begin
            $display("FAIL: Reset value is incorrect, expected %b, got %b", RESET_VALUE, q);
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule