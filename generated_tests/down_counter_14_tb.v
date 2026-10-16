`timescale 1ns/1ps

module tb_down_counter;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the down_counter module
    down_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
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
        reset = 0; // Release reset

        // Check initial count value after reset
        if (count !== 4'b1111) begin
            $display("FAIL: Initial count after reset is not 1111");
            $finish;
        end

        // Decrement the counter and check values
        #10; // Wait for 1 clock cycle
        if (count !== 4'b1110) begin
            $display("FAIL: Count after 1 decrement is not 1110");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 4'b1101) begin
            $display("FAIL: Count after 2 decrements is not 1101");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 4'b1100) begin
            $display("FAIL: Count after 3 decrements is not 1100");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 4'b1011) begin
            $display("FAIL: Count after 4 decrements is not 1011");
            $finish;
        end

        // Assert reset functionality
        reset = 1; // Assert reset
        #10; // Wait for 1 clock cycle
        reset = 0; // Release reset

        // Check count value after reset again
        if (count !== 4'b1111) begin
            $display("FAIL: Count after reset is not 1111");
            $finish;
        end

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule