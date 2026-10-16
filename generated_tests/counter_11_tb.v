`timescale 1ns/1ps

module tb_counter;

    reg clkn;
    reg reset;
    wire [7:0] result;

    // Instantiate the counter module
    counter uut (
        .clkn(clkn),
        .reset(reset),
        .result(result)
    );

    // Clock generation
    initial begin
        clkn = 0;
        forever #5 clkn = ~clkn; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Check initial value
        if (result !== 8'b00000000) begin
            $display("FAIL: Initial value is not zero");
            $finish;
        end

        // Wait for a few clock cycles and check the result
        #10; // Wait for 1 clock cycle
        if (result !== 8'b00000001) begin
            $display("FAIL: Value after 1 clock cycle is not 1");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (result !== 8'b00000010) begin
            $display("FAIL: Value after 2 clock cycles is not 2");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (result !== 8'b00000011) begin
            $display("FAIL: Value after 3 clock cycles is not 3");
            $finish;
        end

        // Activate reset
        reset = 1;
        #10; // Wait for 1 clock cycle
        reset = 0;

        // Check value after reset
        if (result !== 8'b00000000) begin
            $display("FAIL: Value after reset is not zero");
            $finish;
        end

        // Continue counting
        #10; // Wait for 1 clock cycle
        if (result !== 8'b00000001) begin
            $display("FAIL: Value after 1 clock cycle post-reset is not 1");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (result !== 8'b00000010) begin
            $display("FAIL: Value after 2 clock cycles post-reset is not 2");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule