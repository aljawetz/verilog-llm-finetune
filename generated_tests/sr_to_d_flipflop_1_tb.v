`timescale 1ns/1ps

module tb_sr_to_d_flipflop;
    reg clk;
    reg reset;
    reg D;
    wire Q;

    // Instantiate the module under test
    sr_to_d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .D(D),
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
        reset = 1;
        D = 0;
        #10; // Wait for 10ns
        
        // Release reset
        reset = 0;
        #10;

        // Test case 1: Set D to 1
        D = 1;
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Expected Q to be 1 after D is set to 1");
            $finish;
        end

        // Test case 2: Set D to 0
        D = 0;
        #10; // Wait for one clock cycle
        if (Q !== 1'b0) begin
            $display("FAIL: Expected Q to be 0 after D is set to 0");
            $finish;
        end

        // Test case 3: Asynchronous reset
        reset = 1;
        #10; // Wait for reset to take effect
        if (Q !== 1'b0) begin
            $display("FAIL: Expected Q to be 0 after reset");
            $finish;
        end

        // Test case 4: Check no change on reset
        reset = 0;
        D = 1;
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Expected Q to be 1 after D is set to 1");
            $finish;
        end

        // Test case 5: Check no change when S and R are both 0
        D = 1; // S = 1, R = 0
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Expected Q to remain 1 when D is 1");
            $finish;
        end

        // Test case 6: Invalid condition (should not happen)
        D = 1; // S = 1, R = 0
        #10; // Wait for one clock cycle
        if (Q !== 1'b1) begin
            $display("FAIL: Expected Q to remain 1 when D is 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule