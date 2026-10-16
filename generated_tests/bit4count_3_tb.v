`timescale 1ns/1ps

module tb_bit4count;

    reg clk;
    reg reset;
    wire A, B, C, D;

    // Instantiate the module under test (uut)
    bit4count uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .clk(clk),
        .reset(reset)
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

        // Check initial value
        if ({A, B, C, D} !== 4'b0000) begin
            $display("FAIL: Initial value is not 0000");
            $finish;
        end

        // Count to 15
        repeat (15) begin
            #10; // Wait for clock edge
        end

        // Check value after counting to 15
        if ({A, B, C, D} !== 4'b1111) begin
            $display("FAIL: Value after counting to 15 is not 1111");
            $finish;
        end

        // Check reset functionality
        reset = 1;
        #10; // Wait for reset
        reset = 0;

        // Check value after reset
        if ({A, B, C, D} !== 4'b0000) begin
            $display("FAIL: Value after reset is not 0000");
            $finish;
        end

        // Count to 15 again
        repeat (15) begin
            #10; // Wait for clock edge
        end

        // Check value after counting to 15 again
        if ({A, B, C, D} !== 4'b1111) begin
            $display("FAIL: Value after counting to 15 is not 1111");
            $finish;
        end

        // Check reset functionality again
        reset = 1;
        #10; // Wait for reset
        reset = 0;

        // Final check after reset
        if ({A, B, C, D} !== 4'b0000) begin
            $display("FAIL: Final value after reset is not 0000");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule