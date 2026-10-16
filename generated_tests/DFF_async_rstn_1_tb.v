`timescale 1ns/1ps

module tb_DFF_async_rstn;

    reg clk;
    reg async_rstn;
    reg d;
    wire q;

    // Instantiate the DFF_async_rstn module
    DFF_async_rstn uut (
        .clk(clk),
        .async_rstn(async_rstn),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        async_rstn = 1;
        d = 0;

        // Wait for a clock cycle
        #10;

        // Check reset functionality
        if (q !== 0) begin
            $display("FAIL: q should be 0 after async_rstn is high");
            $finish;
        end

        // Release reset
        async_rstn = 0;
        #10;

        // Check that q remains unchanged when d is 0
        if (q !== 0) begin
            $display("FAIL: q should remain 0 when d is 0");
            $finish;
        end

        // Change d to 1 and check on next clock edge
        d = 1;
        #10;

        // Check that q updates to d on rising edge of clk
        if (q !== 1) begin
            $display("FAIL: q should be 1 after d is set to 1");
            $finish;
        end

        // Change d to 0 and check on next clock edge
        d = 0;
        #10;

        // Check that q updates to d on rising edge of clk
        if (q !== 0) begin
            $display("FAIL: q should be 0 after d is set to 0");
            $finish;
        end

        // Assert async reset again
        async_rstn = 1;
        #10;

        // Check reset functionality again
        if (q !== 0) begin
            $display("FAIL: q should be 0 after async_rstn is high again");
            $finish;
        end

        // Release reset and set d to 1
        async_rstn = 0;
        d = 1;
        #10;

        // Check that q updates to d on rising edge of clk
        if (q !== 1) begin
            $display("FAIL: q should be 1 after d is set to 1 again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule