`timescale 1ns/1ps

module tb_JK_flipflop;

    reg j, k, clk, reset;
    wire Q;
    
    // Instantiate the JK_flipflop module
    JK_flipflop uut (
        .j(j),
        .k(k),
        .clk(clk),
        .reset(reset),
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
        j = 0; k = 0; reset = 0;
        
        // Test 1: Reset the flip-flop
        reset = 1; #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0");
            $finish;
        end
        
        // Clear reset
        reset = 0; #10;

        // Test 2: Set Q to 1
        j = 1; k = 0; #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not set to 1 when J=1, K=0");
            $finish;
        end
        
        // Test 3: Clear Q to 0
        j = 0; k = 1; #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not clear to 0 when J=0, K=1");
            $finish;
        end
        
        // Test 4: Toggle Q
        j = 1; k = 1; #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not toggle to 1 when J=1, K=1");
            $finish;
        end
        
        // Test 5: Hold Q
        j = 0; k = 0; #10;
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not hold value when J=0, K=0");
            $finish;
        end
        
        // Test 6: Toggle Q again
        j = 1; k = 1; #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not toggle to 0 when J=1, K=1 again");
            $finish;
        end
        
        // Final check
        reset = 1; #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not set Q to 0 again");
            $finish;
        end
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule