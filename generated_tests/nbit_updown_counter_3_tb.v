`timescale 1ns/1ps

module tb_nbit_updown_counter;

    reg reset_n;
    reg clk;
    reg up_down;
    wire [3:0] q_out;

    // Instantiate the module under test (uut)
    nbit_updown_counter #(4) uut (
        .reset_n(reset_n),
        .clk(clk),
        .up_down(up_down),
        .q_out(q_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        reset_n = 0;
        up_down = 0;
        #10; // Wait for some time

        // Assert reset
        reset_n = 1; // Release reset
        #10;

        // Test counting up
        up_down = 1; // Set to count up
        #10; // Expect q_out = 1
        if (q_out !== 4'b0001) $display("FAIL: Expected q_out = 1, got %b", q_out);

        #10; // Expect q_out = 2
        if (q_out !== 4'b0010) $display("FAIL: Expected q_out = 2, got %b", q_out);

        #10; // Expect q_out = 3
        if (q_out !== 4'b0011) $display("FAIL: Expected q_out = 3, got %b", q_out);

        #10; // Expect q_out = 4
        if (q_out !== 4'b0100) $display("FAIL: Expected q_out = 4, got %b", q_out);

        // Test counting down
        up_down = 0; // Set to count down
        #10; // Expect q_out = 3
        if (q_out !== 4'b0011) $display("FAIL: Expected q_out = 3, got %b", q_out);

        #10; // Expect q_out = 2
        if (q_out !== 4'b0010) $display("FAIL: Expected q_out = 2, got %b", q_out);

        #10; // Expect q_out = 1
        if (q_out !== 4'b0001) $display("FAIL: Expected q_out = 1, got %b", q_out);

        #10; // Expect q_out = 0
        if (q_out !== 4'b0000) $display("FAIL: Expected q_out = 0, got %b", q_out);

        // Test reset functionality
        reset_n = 0; // Assert reset
        #10; // Wait for reset to take effect
        if (q_out !== 4'b0000) $display("FAIL: Expected q_out = 0 after reset, got %b", q_out);

        reset_n = 1; // Release reset
        #10;

        // Final up count
        up_down = 1; // Count up
        #10; // Expect q_out = 1
        if (q_out !== 4'b0001) $display("FAIL: Expected q_out = 1, got %b", q_out);

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule