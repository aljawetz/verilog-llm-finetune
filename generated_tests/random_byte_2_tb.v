`timescale 1ns/1ps

module tb_random_byte;

    reg clk;
    reg rst;
    reg [7:0] seed;
    wire [7:0] value;

    // Instantiate the module under test (uut)
    random_byte uut (
        .clk(clk),
        .rst(rst),
        .seed(seed),
        .value(value)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize seed and reset
        seed = 8'b10101010; // Example seed
        rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        rst = 0; // Deassert reset

        // Check initial value after reset
        if (value !== seed) begin
            $display("FAIL: Initial value after reset is incorrect. Expected: %b, Got: %b", seed, value);
            $finish;
        end

        // Run a few clock cycles and check feedback behavior
        #10; // Wait for 1 clock cycle
        if (value === 8'b0) begin
            $display("FAIL: Value should not be zero after first clock cycle.");
            $finish;
        end

        // Continue to check for a few more cycles
        repeat (10) begin
            #10; // Wait for 1 clock cycle
            if (value == 8'd128) begin
                $display("FAIL: Value should not be 128.");
                $finish;
            end
        end

        // Assert reset again and check value
        rst = 1; // Assert reset
        #10; // Wait for a clock cycle
        if (value !== seed) begin
            $display("FAIL: Value after reset is incorrect. Expected: %b, Got: %b", seed, value);
            $finish;
        end

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule