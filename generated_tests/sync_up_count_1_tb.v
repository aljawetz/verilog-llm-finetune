`timescale 1ns/1ps

module tb_sync_up_count;

    reg rst;
    reg clk;
    wire [3:0] count;

    // Instantiate the module under test (uut)
    sync_up_count uut (
        .rst(rst),
        .clk(clk),
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
        rst = 1;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Check initial count after reset
        if (count !== 4'b0000) begin
            $display("FAIL: Initial count is not zero");
            $finish;
        end

        // Wait for a few clock cycles and check count
        #10; // Wait for 1 clock cycle
        if (count !== 4'b0001) begin
            $display("FAIL: Count is not 1 after 1 clock cycle");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (count !== 4'b0010) begin
            $display("FAIL: Count is not 2 after 2 clock cycles");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (count !== 4'b0011) begin
            $display("FAIL: Count is not 3 after 3 clock cycles");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (count !== 4'b0100) begin
            $display("FAIL: Count is not 4 after 4 clock cycles");
            $finish;
        end

        // Assert reset and check count
        rst = 1;
        #10; // Wait for 1 clock cycle
        if (count !== 4'b0000) begin
            $display("FAIL: Count is not zero after reset");
            $finish;
        end

        // Release reset and check count again
        rst = 0;
        #10; // Wait for 1 clock cycle
        if (count !== 4'b0001) begin
            $display("FAIL: Count is not 1 after reset release");
            $finish;
        end

        // Continue counting to check wrap around
        #40; // Wait for 4 more clock cycles
        if (count !== 4'b0101) begin
            $display("FAIL: Count is not 5 after 5 clock cycles");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (count !== 4'b0110) begin
            $display("FAIL: Count is not 6 after 6 clock cycles");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (count !== 4'b0111) begin
            $display("FAIL: Count is not 7 after 7 clock cycles");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (count !== 4'b1000) begin
            $display("FAIL: Count is not 8 after 8 clock cycles");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (count !== 4'b1001) begin
            $display("FAIL: Count is not 9 after 9 clock cycles");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (count !== 4'b1010) begin
            $display("FAIL: Count is not 10 after 10 clock cycles");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule