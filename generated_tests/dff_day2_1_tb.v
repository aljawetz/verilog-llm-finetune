`timescale 1ns/1ps

module tb_dff_day2;

    reg d_i;
    reg clk;
    reg rst;
    wire q_norst_o;
    wire q_syncrst_o;
    wire q_asyncrst_o;

    // Instantiate the module under test (uut)
    dff_day2 uut (
        .d_i(d_i),
        .clk(clk),
        .rst(rst),
        .q_norst_o(q_norst_o),
        .q_syncrst_o(q_syncrst_o),
        .q_asyncrst_o(q_asyncrst_o)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        d_i = 0;
        rst = 0;

        // Test 1: Check behavior without reset
        #10;
        d_i = 1; // Set input
        #10;
        if (q_norst_o !== 1) begin
            $display("FAIL: q_norst_o should be 1 after d_i is set to 1");
            $finish;
        end

        // Test 2: Check synchronous reset
        rst = 1; // Activate reset
        #10;
        if (q_syncrst_o !== 0) begin
            $display("FAIL: q_syncrst_o should be 0 after synchronous reset");
            $finish;
        end
        rst = 0; // Deactivate reset
        #10;
        d_i = 1; // Set input
        #10;
        if (q_syncrst_o !== 1) begin
            $display("FAIL: q_syncrst_o should be 1 after d_i is set to 1");
            $finish;
        end

        // Test 3: Check asynchronous reset
        rst = 1; // Activate reset
        #10;
        if (q_asyncrst_o !== 0) begin
            $display("FAIL: q_asyncrst_o should be 0 after asynchronous reset");
            $finish;
        end
        rst = 0; // Deactivate reset
        #10;
        d_i = 1; // Set input
        #10;
        if (q_asyncrst_o !== 1) begin
            $display("FAIL: q_asyncrst_o should be 1 after d_i is set to 1");
            $finish;
        end

        // Final check: Ensure all outputs are correct after a reset
        rst = 1; // Activate reset
        #10;
        if (q_norst_o !== 1 || q_syncrst_o !== 0 || q_asyncrst_o !== 0) begin
            $display("FAIL: Outputs should be q_norst_o=1, q_syncrst_o=0, q_asyncrst_o=0 after reset");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule