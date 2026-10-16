`timescale 1ns/1ps

module tb_counter_1bit;

    reg clk;
    reg rst;
    wire [3:0] count;

    // Instantiate the module under test (uut)
    counter_1bit #(4) uut (
        .clk(clk),
        .rst(rst),
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

        // Check initial count value
        if (count !== 4'b0000) begin
            $display("FAIL: Initial count is not zero");
            $finish;
        end

        // Wait for a few clock cycles and check count
        #10; // Wait for 1 clock cycle
        if (count !== 4'b0001) begin
            $display("FAIL: Count after 1 clock cycle is not 1");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (count !== 4'b0010) begin
            $display("FAIL: Count after 2 clock cycles is not 2");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (count !== 4'b0011) begin
            $display("FAIL: Count after 3 clock cycles is not 3");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (count !== 4'b0100) begin
            $display("FAIL: Count after 4 clock cycles is not 4");
            $finish;
        end

        // Assert reset and check count
        rst = 1;
        #10; // Wait for reset to take effect
        if (count !== 4'b0000) begin
            $display("FAIL: Count after reset is not zero");
            $finish;
        end

        // Release reset and check count again
        rst = 0;
        #10; // Wait for 1 clock cycle
        if (count !== 4'b0001) begin
            $display("FAIL: Count after releasing reset is not 1");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule