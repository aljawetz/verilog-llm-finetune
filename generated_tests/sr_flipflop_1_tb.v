`timescale 1ns/1ps

module tb_sr_flipflop;

    reg clk;
    reg reset;
    reg s;
    reg r;
    wire q;

    // Instantiate the SR Flip-Flop
    sr_flipflop uut (
        .clk(clk),
        .reset(reset),
        .s(s),
        .r(r),
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
        s = 0;
        r = 0;

        // Wait for a clock edge
        #10;

        // Test 1: Reset the flip-flop
        reset = 1; 
        #10; // Wait for clock edge
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Set the flip-flop
        reset = 0; 
        s = 1; 
        r = 0; 
        #10; // Wait for clock edge
        if (q !== 1'b1) begin
            $display("FAIL: Set did not set q to 1");
            $finish;
        end

        // Test 3: Clear the flip-flop
        s = 0; 
        r = 1; 
        #10; // Wait for clock edge
        if (q !== 1'b0) begin
            $display("FAIL: Clear did not set q to 0");
            $finish;
        end

        // Test 4: Hold state
        s = 0; 
        r = 0; 
        #10; // Wait for clock edge
        if (q !== 1'b0) begin
            $display("FAIL: Hold state did not maintain q at 0");
            $finish;
        end

        // Test 5: Set again
        s = 1; 
        r = 0; 
        #10; // Wait for clock edge
        if (q !== 1'b1) begin
            $display("FAIL: Set did not set q to 1 again");
            $finish;
        end

        // Test 6: Reset again
        reset = 1; 
        #10; // Wait for clock edge
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule