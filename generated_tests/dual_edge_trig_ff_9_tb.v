`timescale 1ns/1ps

module tb_dual_edge_trig_ff;

    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the module under test (uut)
    dual_edge_trig_ff uut (
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
        d = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: Set d to 1, check output on both edges
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q=1 after d=1 on posedge");
            $finish;
        end
        
        #10; // Wait for the next clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q=1 after d=1 on negedge");
            $finish;
        end

        // Test case 2: Change d to 0, check output on both edges
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q=0 after d=0 on posedge");
            $finish;
        end
        
        #10; // Wait for the next clock cycle
        if (q !== 0) begin
            $display("FAIL: Expected q=0 after d=0 on negedge");
            $finish;
        end

        // Test case 3: Reset the flip-flop
        reset = 1;
        #10; // Wait for reset to take effect
        if (q !== 0) begin
            $display("FAIL: Expected q=0 after reset");
            $finish;
        end
        
        // Test case 4: Check behavior after reset
        reset = 0;
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q=1 after d=1 on posedge after reset");
            $finish;
        end
        
        #10; // Wait for the next clock cycle
        if (q !== 1) begin
            $display("FAIL: Expected q=1 after d=1 on negedge after reset");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule