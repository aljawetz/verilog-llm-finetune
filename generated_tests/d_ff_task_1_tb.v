`timescale 1ns/1ps

module tb_d_ff_task;

    reg d_in;
    reg clk;
    reg rst;
    wire q_out;

    // Instantiate the module under test (uut)
    d_ff_task uut (
        .d_in(d_in),
        .clk(clk),
        .rst(rst),
        .q_out(q_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        d_in = 0;
        rst = 1;

        // Test case 1: Check reset functionality
        #10; // Wait for a clock edge
        if (q_out !== 0) begin
            $display("FAIL: q_out should be 0 after reset");
            $finish;
        end

        // Test case 2: Check D flip-flop functionality
        rst = 1; // Enable the flip-flop
        d_in = 1; 
        #10; // Wait for a clock edge
        if (q_out !== 1) begin
            $display("FAIL: q_out should be 1 when d_in is 1 and rst is high");
            $finish;
        end

        // Test case 3: Change d_in and check output
        d_in = 0; 
        #10; // Wait for a clock edge
        if (q_out !== 0) begin
            $display("FAIL: q_out should be 0 when d_in is 0 and rst is high");
            $finish;
        end

        // Test case 4: Check reset functionality again
        rst = 0; // Assert reset
        #10; // Wait for a clock edge
        if (q_out !== 0) begin
            $display("FAIL: q_out should be 0 after reset");
            $finish;
        end

        // Test case 5: Check D flip-flop functionality after reset
        rst = 1; // Enable the flip-flop
        d_in = 1; 
        #10; // Wait for a clock edge
        if (q_out !== 1) begin
            $display("FAIL: q_out should be 1 when d_in is 1 and rst is high");
            $finish;
        end

        // Test case 6: Final check with d_in = 0
        d_in = 0; 
        #10; // Wait for a clock edge
        if (q_out !== 0) begin
            $display("FAIL: q_out should be 0 when d_in is 0 and rst is high");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule