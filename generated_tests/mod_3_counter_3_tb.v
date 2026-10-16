`timescale 1ns/1ps

module tb_mod_3_counter;

    reg clk;
    reg reset;
    wire [1:0] counter;

    // Instantiate the module under test (uut)
    mod_3_counter uut (
        .clk(clk),
        .reset(reset),
        .counter(counter)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Test counting behavior
        if (counter !== 2'b00) begin
            $display("FAIL: Counter should be 0 after reset");
            $finish;
        end

        // Wait for 3 clock cycles
        #10; // 1st clock cycle
        if (counter !== 2'b01) begin
            $display("FAIL: Counter should be 1 after 1 clock cycle");
            $finish;
        end

        #10; // 2nd clock cycle
        if (counter !== 2'b10) begin
            $display("FAIL: Counter should be 2 after 2 clock cycles");
            $finish;
        end

        #10; // 3rd clock cycle
        if (counter !== 2'b00) begin
            $display("FAIL: Counter should be 0 after 3 clock cycles");
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for reset to take effect
        reset = 0;

        if (counter !== 2'b00) begin
            $display("FAIL: Counter should be 0 after reset");
            $finish;
        end

        // Continue counting
        #10; // 1st clock cycle
        if (counter !== 2'b01) begin
            $display("FAIL: Counter should be 1 after 1 clock cycle");
            $finish;
        end

        #10; // 2nd clock cycle
        if (counter !== 2'b10) begin
            $display("FAIL: Counter should be 2 after 2 clock cycles");
            $finish;
        end

        #10; // 3rd clock cycle
        if (counter !== 2'b00) begin
            $display("FAIL: Counter should be 0 after 3 clock cycles");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule