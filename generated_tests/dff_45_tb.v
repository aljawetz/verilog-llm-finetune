`timescale 1ns/1ps

module tb_dff;

    reg d, set, reset, clk;
    wire q, qbar;

    // Instantiate the D flip-flop
    dff uut (
        .q(q),
        .qbar(qbar),
        .d(d),
        .set(set),
        .reset(reset),
        .clk(clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        d = 0; set = 1; reset = 1;
        
        // Test 1: Check reset functionality
        reset = 0; // Assert reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end
        
        // Release reset
        reset = 1;
        #10;

        // Test 2: Check set functionality
        set = 0; // Assert set
        #10;
        if (q !== 1) begin
            $display("FAIL: Set did not set q to 1");
            $finish;
        end
        
        // Release set
        set = 1;
        #10;

        // Test 3: Check D input functionality
        d = 0; // Set D to 0
        #10; // Wait for clock edge
        if (q !== 0) begin
            $display("FAIL: D input did not set q to 0");
            $finish;
        end
        
        d = 1; // Set D to 1
        #10; // Wait for clock edge
        if (q !== 1) begin
            $display("FAIL: D input did not set q to 1");
            $finish;
        end
        
        // Test 4: Check asynchronous reset during D input
        reset = 0; // Assert reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 during D input");
            $finish;
        end
        
        // Test 5: Check asynchronous set during D input
        reset = 1; // Release reset
        set = 0; // Assert set
        #10;
        if (q !== 1) begin
            $display("FAIL: Set did not set q to 1 during D input");
            $finish;
        end
        
        // Final check for qbar
        if (qbar !== ~q) begin
            $display("FAIL: qbar is not the inverse of q");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule