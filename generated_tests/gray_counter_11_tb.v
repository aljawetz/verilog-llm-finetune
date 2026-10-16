`timescale 1ns/1ps

module tb_gray_counter;

    reg clk;
    reg rst;
    wire [3:0] gray_count;

    // Instantiate the gray_counter module
    gray_counter uut (
        .clk(clk),
        .rst(rst),
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
        rst = 1;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Check initial gray_count after reset
        if (gray_count !== 4'b0000) begin
            $display("FAIL: Initial gray_count is not zero");
            $finish;
        end

        // Wait for a few clock cycles and check gray_count
        #10; // Wait for 1 clock cycle
        if (gray_count !== 4'b0001) begin
            $display("FAIL: gray_count is not 1 after 1 clock cycle");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (gray_count !== 4'b0011) begin
            $display("FAIL: gray_count is not 3 after 2 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (gray_count !== 4'b0010) begin
            $display("FAIL: gray_count is not 2 after 3 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (gray_count !== 4'b0110) begin
            $display("FAIL: gray_count is not 6 after 4 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (gray_count !== 4'b0111) begin
            $display("FAIL: gray_count is not 7 after 5 clock cycles");
            $finish;
        end

        // Test reset functionality
        rst = 1; // Assert reset
        #10; // Wait for 1 clock cycle
        rst = 0; // Release reset

        // Check gray_count after reset
        if (gray_count !== 4'b0000) begin
            $display("FAIL: gray_count is not zero after reset");
            $finish;
        end

        // Continue counting after reset
        #10; // Wait for 1 clock cycle
        if (gray_count !== 4'b0001) begin
            $display("FAIL: gray_count is not 1 after reset and 1 clock cycle");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule