`timescale 1ns/1ps

module tb_async_up_counter;

    reg clk;
    reg reset;
    wire [2:0] count;

    // Instantiate the module under test (uut)
    async_up_counter uut (
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

        // Check initial count after reset
        if (count !== 3'b000) begin
            $display("FAIL: Initial count after reset is not zero");
            $finish;
        end

        // Wait for a few clock cycles and check count
        #10; // Wait for 1 clock cycle
        if (count !== 3'b001) begin
            $display("FAIL: Count after 1 clock cycle is not 1");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 3'b010) begin
            $display("FAIL: Count after 2 clock cycles is not 2");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 3'b011) begin
            $display("FAIL: Count after 3 clock cycles is not 3");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 3'b100) begin
            $display("FAIL: Count after 4 clock cycles is not 4");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 3'b101) begin
            $display("FAIL: Count after 5 clock cycles is not 5");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 3'b110) begin
            $display("FAIL: Count after 6 clock cycles is not 6");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 3'b111) begin
            $display("FAIL: Count after 7 clock cycles is not 7");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 3'b000) begin
            $display("FAIL: Count after 8 clock cycles is not 0");
            $finish;
        end

        // Test reset functionality
        reset = 1; // Assert reset
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Check count after reset
        if (count !== 3'b000) begin
            $display("FAIL: Count after reset is not zero");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule