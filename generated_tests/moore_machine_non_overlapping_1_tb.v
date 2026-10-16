`timescale 1ns/1ps

module tb_moore_machine_non_overlapping;
    reg data;
    reg clk;
    reg rst;
    wire op;

    // Instantiate the module under test (uut)
    moore_machine_non_overlapping uut (
        .data(data),
        .clk(clk),
        .rst(rst),
        .op(op)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 0;
        data = 0;

        // Apply reset
        #10;
        rst = 1; // Release reset

        // Test sequence
        // State s0
        #10; data = 1; // Transition to s1
        #10; data = 1; // Stay in s1
        #10; data = 0; // Transition to s2
        #10; data = 0; // Transition to s3
        #10; data = 1; // Transition to s4
        #10; data = 1; // Stay in s4
        #10; data = 0; // Transition to s2
        #10; data = 1; // Transition to s1
        #10; data = 1; // Stay in s1
        #10; data = 0; // Transition to s2
        #10; data = 0; // Transition to s3
        #10; data = 1; // Transition to s4
        
        // Check final state
        #10;
        if (uut.op !== 1'b1) begin
            $display("FAIL: Expected op to be 1 at the end of the sequence, got %b", uut.op);
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end
endmodule