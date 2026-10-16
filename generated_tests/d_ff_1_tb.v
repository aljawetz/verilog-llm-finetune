`timescale 1ns/1ps

module tb_d_ff;

    reg d;
    reg clk;
    reg reset;
    wire q;

    // Instantiate the D flip-flop
    d_ff uut (
        .d(d),
        .clk(clk),
        .reset(reset),
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
        d = 0;
        reset = 0;

        // Test 1: Reset the flip-flop
        reset = 1; #10; // Hold reset high for 10ns
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Set d to 1 and clock
        reset = 0; d = 1; #10; // Rising edge of clk
        if (q !== 1) begin
            $display("FAIL: q did not store d value 1");
            $finish;
        end

        // Test 3: Change d to 0 and clock
        d = 0; #10; // Rising edge of clk
        if (q !== 0) begin
            $display("FAIL: q did not store d value 0");
            $finish;
        end

        // Test 4: Assert reset again
        reset = 1; #10; // Hold reset high for 10ns
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Test 5: Check if q holds value after reset is released
        reset = 0; d = 1; #10; // Rising edge of clk
        if (q !== 1) begin
            $display("FAIL: q did not store d value 1 after reset");
            $finish;
        end

        // Test 6: Final check with d = 0
        d = 0; #10; // Rising edge of clk
        if (q !== 0) begin
            $display("FAIL: q did not store d value 0 in final check");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule