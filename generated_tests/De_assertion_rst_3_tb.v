`timescale 1ns/1ps

module tb_De_assertion_rst;

    reg clk;
    reg rst;
    wire master_rst;

    // Instantiate the module under test (uut)
    De_assertion_rst uut (
        .clk(clk),
        .rst(rst),
        .master_rst(master_rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        rst = 0;
        #10; // Wait for 10ns
        rst = 1; // Release reset
        #10; // Wait for 10ns

        // Check master_rst after reset is released
        if (master_rst !== 1'b0) begin
            $display("FAIL: master_rst should be 0 after reset is released");
            $finish;
        end

        // Wait for one clock cycle
        #10;

        // Check master_rst after one clock cycle
        if (master_rst !== 1'b1) begin
            $display("FAIL: master_rst should be 1 after one clock cycle");
            $finish;
        end

        // Assert reset again
        rst = 0;
        #10; // Wait for 10ns
        rst = 1; // Release reset
        #10; // Wait for 10ns

        // Check master_rst after reset is released again
        if (master_rst !== 1'b0) begin
            $display("FAIL: master_rst should be 0 after reset is released");
            $finish;
        end

        // Wait for one clock cycle
        #10;

        // Check master_rst after one clock cycle
        if (master_rst !== 1'b1) begin
            $display("FAIL: master_rst should be 1 after one clock cycle");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule