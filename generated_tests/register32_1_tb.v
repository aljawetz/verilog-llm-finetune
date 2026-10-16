`timescale 1ns/1ps

module tb_register32;
    reg [31:0] Parallel_in;
    reg clk;
    reg rst;
    reg enable;
    reg Ready;
    wire [31:0] parallel_out;
    wire Accepted;

    // Instantiate the module under test (uut)
    register32 uut (
        .Parallel_in(Parallel_in),
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .Ready(Ready),
        .parallel_out(parallel_out),
        .Accepted(Accepted)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        enable = 0;
        Ready = 0;
        Parallel_in = 32'hA5A5A5A5;

        // Release reset
        #10 rst = 0;

        // Test 1: Check reset functionality
        #10;
        if (parallel_out !== 32'd0 || Accepted !== 0) begin
            $display("FAIL: Reset did not clear outputs");
            $finish;
        end

        // Test 2: Check accepted flag when Ready and enable are low
        #10;
        enable = 1;
        Ready = 0;
        #10;
        if (parallel_out !== 32'd0 || Accepted !== 0) begin
            $display("FAIL: Accepted flag should be low when Ready is low");
            $finish;
        end

        // Test 3: Load data when Ready and enable are high
        #10;
        Ready = 1;
        #10;
        if (parallel_out !== 32'hA5A5A5A5 || Accepted !== 1) begin
            $display("FAIL: Data not loaded correctly when Ready and enable are high");
            $finish;
        end

        // Test 4: Check accepted flag when Ready goes low
        #10;
        Ready = 0;
        #10;
        if (Accepted !== 0) begin
            $display("FAIL: Accepted flag should be low when Ready is low");
            $finish;
        end

        // Test 5: Check reset functionality again
        #10;
        rst = 1;
        #10;
        if (parallel_out !== 32'd0 || Accepted !== 0) begin
            $display("FAIL: Reset did not clear outputs");
            $finish;
        end

        // Test 6: Check behavior with reset and then valid inputs
        #10;
        rst = 0;
        enable = 1;
        Ready = 1;
        Parallel_in = 32'hDEADBEEF;
        #10;
        if (parallel_out !== 32'hDEADBEEF || Accepted !== 1) begin
            $display("FAIL: Data not loaded correctly after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule