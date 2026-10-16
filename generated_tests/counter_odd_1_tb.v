`timescale 1ns/1ps

module tb_counter_odd;

    reg clk;
    reg rst;
    wire [7:0] cnt_o;

    // Instantiate the module under test (uut)
    counter_odd uut (
        .clk(clk),
        .rst(rst),
        .cnt_o(cnt_o)
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

        // Check initial value after reset
        if (cnt_o !== 8'h1) begin
            $display("FAIL: Initial value after reset is not 1");
            $finish;
        end

        // Wait for a few clock cycles and check values
        #10; // Wait for 1 clock cycle
        if (cnt_o !== 8'h3) begin
            $display("FAIL: Value after 1 clock cycle is not 3");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (cnt_o !== 8'h5) begin
            $display("FAIL: Value after 2 clock cycles is not 5");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (cnt_o !== 8'h7) begin
            $display("FAIL: Value after 3 clock cycles is not 7");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (cnt_o !== 8'h9) begin
            $display("FAIL: Value after 4 clock cycles is not 9");
            $finish;
        end

        // Reset the counter
        rst = 1;
        #10; // Wait for 10ns
        rst = 0; // Release reset

        // Check value after reset again
        if (cnt_o !== 8'h1) begin
            $display("FAIL: Value after reset is not 1");
            $finish;
        end

        // Wait for a few more clock cycles
        #10; // Wait for 1 clock cycle
        if (cnt_o !== 8'h3) begin
            $display("FAIL: Value after 1 clock cycle is not 3");
            $finish;
        end

        #10; // Wait for 1 more clock cycle
        if (cnt_o !== 8'h5) begin
            $display("FAIL: Value after 2 clock cycles is not 5");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule