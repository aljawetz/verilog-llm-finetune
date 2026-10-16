`timescale 1ns/1ps

module tb_twobit_updown_counter;

    reg clk;
    reg reset;
    reg mode;
    wire [1:0] count;

    // Instantiate the module under test (uut)
    twobit_updown_counter uut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .count(count)
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
        mode = 1; // Up mode

        // Wait for a clock cycle
        #10;
        reset = 0; // Release reset

        // Test counting up
        if (count !== 2'b00) begin
            $display("FAIL: Count should be 00 after reset");
            $finish;
        end

        // Count up to 3
        #10; // clk edge 1
        if (count !== 2'b01) begin
            $display("FAIL: Count should be 01");
            $finish;
        end

        #10; // clk edge 2
        if (count !== 2'b10) begin
            $display("FAIL: Count should be 10");
            $finish;
        end

        #10; // clk edge 3
        if (count !== 2'b11) begin
            $display("FAIL: Count should be 11");
            $finish;
        end

        // Test counting down
        mode = 0; // Down mode
        #10; // clk edge 4
        if (count !== 2'b10) begin
            $display("FAIL: Count should be 10 after decrement");
            $finish;
        end

        #10; // clk edge 5
        if (count !== 2'b01) begin
            $display("FAIL: Count should be 01 after decrement");
            $finish;
        end

        #10; // clk edge 6
        if (count !== 2'b00) begin
            $display("FAIL: Count should be 00 after decrement");
            $finish;
        end

        // Test reset functionality
        reset = 1; // Assert reset
        #10; // Wait for reset to take effect
        if (count !== 2'b00) begin
            $display("FAIL: Count should be 00 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule