`timescale 1ns/1ps

module tb_gray_counter;

    reg clk;
    reg reset;
    wire [3:0] gray_count;

    // Instantiate the gray_counter module
    gray_counter uut (
        .clk(clk),
        .reset(reset),
        .gray_count(gray_count)
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

        // Check initial gray_count
        if (gray_count !== 4'b0000) begin
            $display("FAIL: Initial gray_count is not 0000");
            $finish;
        end

        // Test counting
        #10; // Wait for 1 clock cycle
        if (gray_count !== 4'b0001) begin
            $display("FAIL: gray_count is not 0001 after 1 clock cycle");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (gray_count !== 4'b0011) begin
            $display("FAIL: gray_count is not 0011 after 2 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (gray_count !== 4'b0010) begin
            $display("FAIL: gray_count is not 0010 after 3 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (gray_count !== 4'b0110) begin
            $display("FAIL: gray_count is not 0110 after 4 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (gray_count !== 4'b0111) begin
            $display("FAIL: gray_count is not 0111 after 5 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (gray_count !== 4'b0101) begin
            $display("FAIL: gray_count is not 0101 after 6 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (gray_count !== 4'b0100) begin
            $display("FAIL: gray_count is not 0100 after 7 clock cycles");
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for 1 clock cycle
        reset = 0;

        // Check gray_count after reset
        if (gray_count !== 4'b0000) begin
            $display("FAIL: gray_count is not 0000 after reset");
            $finish;
        end

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule