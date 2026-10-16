`timescale 1ns/1ps

module tb_ring_counter;

    reg clk;
    reg reset;
    wire [3:0] q;

    // Instantiate the ring_counter module
    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 10ns clock period
    end

    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;

        // Test sequence
        // Test 1: Reset the counter
        reset = 1;
        #10; // Wait for one clock cycle
        if (q !== 4'b1000) begin
            $display("FAIL: Reset did not set q to 1000");
            $finish;
        end

        // Test 2: Shift the counter
        reset = 0;
        #10; // Wait for one clock cycle
        if (q !== 4'b0100) begin
            $display("FAIL: First shift did not produce 0100");
            $finish;
        end
        
        #10; // Wait for one clock cycle
        if (q !== 4'b0010) begin
            $display("FAIL: Second shift did not produce 0010");
            $finish;
        end
        
        #10; // Wait for one clock cycle
        if (q !== 4'b0001) begin
            $display("FAIL: Third shift did not produce 0001");
            $finish;
        end
        
        #10; // Wait for one clock cycle
        if (q !== 4'b1000) begin
            $display("FAIL: Fourth shift did not produce 1000");
            $finish;
        end

        // Test 3: Reset again
        reset = 1;
        #10; // Wait for one clock cycle
        if (q !== 4'b1000) begin
            $display("FAIL: Reset did not set q to 1000 again");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule