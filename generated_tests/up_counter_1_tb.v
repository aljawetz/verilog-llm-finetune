`timescale 1ns/1ps

module tb_up_counter;

    reg clk;
    reg rst;
    wire [3:0] count;

    // Instantiate the up_counter module
    up_counter uut (
        .count(count),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        rst = 1;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Check initial count value
        if (count !== 4'b0000) begin
            $display("FAIL: Initial count is not zero");
            $finish;
        end

        // Wait for a few clock cycles and check count
        #10; // Wait for 1 clock cycle
        if (count !== 4'b0001) begin
            $display("FAIL: Count did not increment to 1");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b0010) begin
            $display("FAIL: Count did not increment to 2");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b0011) begin
            $display("FAIL: Count did not increment to 3");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b0100) begin
            $display("FAIL: Count did not increment to 4");
            $finish;
        end

        // Assert reset functionality
        rst = 1; // Assert reset
        #10; // Wait for 1 clock cycle
        if (count !== 4'b0000) begin
            $display("FAIL: Count did not reset to zero");
            $finish;
        end

        rst = 0; // Release reset
        #10; // Wait for 1 clock cycle
        if (count !== 4'b0001) begin
            $display("FAIL: Count did not increment to 1 after reset");
            $finish;
        end

        // Continue counting to check wrap around
        #40; // Wait for 4 more clock cycles
        if (count !== 4'b0101) begin
            $display("FAIL: Count did not increment correctly after reset");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b0110) begin
            $display("FAIL: Count did not increment to 6");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b0111) begin
            $display("FAIL: Count did not increment to 7");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b1000) begin
            $display("FAIL: Count did not increment to 8");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b1001) begin
            $display("FAIL: Count did not increment to 9");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b1010) begin
            $display("FAIL: Count did not increment to 10");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b1011) begin
            $display("FAIL: Count did not increment to 11");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b1100) begin
            $display("FAIL: Count did not increment to 12");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b1101) begin
            $display("FAIL: Count did not increment to 13");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b1110) begin
            $display("FAIL: Count did not increment to 14");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b1111) begin
            $display("FAIL: Count did not increment to 15");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (count !== 4'b0000) begin
            $display("FAIL: Count did not wrap around to 0");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule