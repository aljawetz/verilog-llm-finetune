`timescale 1ns/1ps

module tb_bit4count;

    reg clk;
    reg reset;
    wire A, B, C, D;
    
    // Instantiate the module under test
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

        // Check initial state
        if ({A, B, C, D} !== 4'b0000) begin
            $display("FAIL: Initial state is not 0000");
            $finish;
        end

        // Count to 15
        repeat (15) begin
            #10; // Wait for one clock cycle
        end

        // Check state after counting to 15
        if ({A, B, C, D} !== 4'b1111) begin
            $display("FAIL: Count did not reach 1111");
            $finish;
        end

        // Check reset functionality
        reset = 1;
        #10; // Wait for reset
        reset = 0;

        // Check state after reset
        if ({A, B, C, D} !== 4'b0000) begin
            $display("FAIL: State after reset is not 0000");
            $finish;
        end

        // Count again to 15
        repeat (15) begin
            #10; // Wait for one clock cycle
        end

        // Check state after counting to 15 again
        if ({A, B, C, D} !== 4'b1111) begin
            $display("FAIL: Count did not reach 1111 after reset");
            $finish;
        end

        // Final reset check
        reset = 1;
        #10; // Wait for reset
        reset = 0;

        // Check state after final reset
        if ({A, B, C, D} !== 4'b0000) begin
            $display("FAIL: Final state after reset is not 0000");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule