`timescale 1ns/1ps

module tb_good_shift_reg;

    reg clk;
    reg reset;
    reg d;
    wire dout;

    // Instantiate the module under test (uut)
    good_shift_reg uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .dout(dout)
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

        // Wait for a clock edge
        #10;

        // Release reset
        reset = 0;

        // Test case 1: Check reset functionality
        #10;
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after reset");
            $finish;
        end

        // Test case 2: Shift in a value
        d = 1; // Load 1 into the shift register
        #10; // Wait for clock edge
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after first load");
            $finish;
        end

        // Test case 3: Shift in another value
        #10; // Wait for clock edge
        if (dout !== 1) begin
            $display("FAIL: dout should be 1 after second load");
            $finish;
        end

        // Test case 4: Shift in a zero
        d = 0; // Load 0 into the shift register
        #10; // Wait for clock edge
        if (dout !== 1) begin
            $display("FAIL: dout should be 1 after loading 0");
            $finish;
        end

        // Test case 5: Shift in another value
        #10; // Wait for clock edge
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after loading 0 again");
            $finish;
        end

        // Test case 6: Assert reset again
        reset = 1; // Assert reset
        #10; // Wait for clock edge
        if (dout !== 0) begin
            $display("FAIL: dout should be 0 after reset");
            $finish;
        end

        // Finalize the simulation
        $display("PASS");
        $finish;
    end

endmodule