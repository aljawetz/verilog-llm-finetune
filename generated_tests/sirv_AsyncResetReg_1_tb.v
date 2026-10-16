`timescale 1ns/1ps

module tb_sirv_AsyncResetReg;

    reg d;
    reg en;
    reg clk;
    reg rst;
    wire q;

    // Instantiate the module under test
    sirv_AsyncResetReg uut (
        .d(d),
        .q(q),
        .en(en),
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
        // Initialize signals
        d = 0;
        en = 0;
        rst = 1; // Assert reset
        #10; // Wait for 10ns
        rst = 0; // Deassert reset

        // Test case 1: Check reset behavior
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test case 2: Enable and set d
        en = 1;
        d = 1;
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: q did not update to d when enabled");
            $finish;
        end

        // Test case 3: Disable and check q remains unchanged
        en = 0;
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: q changed when disabled");
            $finish;
        end

        // Test case 4: Change d while enabled
        en = 1;
        d = 0;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: q did not update to new d when enabled");
            $finish;
        end

        // Test case 5: Assert reset again
        rst = 1;
        #10;
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule