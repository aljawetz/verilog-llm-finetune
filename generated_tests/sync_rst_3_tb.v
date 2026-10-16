`timescale 1ns/1ps

module tb_sync_rst;

    reg in;
    reg clk;
    reg rst;
    wire out;

    // Instantiate the module under test (uut)
    sync_rst uut (
        .in(in),
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        in = 0;
        rst = 0;

        // Apply reset
        #3 rst = 1; // Release reset after 3ns

        // Test case 1: Check output when input is 0
        #10;
        in = 0; // Set input to 0
        #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0, got out = %b", out);
            $finish;
        end

        // Test case 2: Check output when input is 1
        #10;
        in = 1; // Set input to 1
        #10;
        if (out !== 1) begin
            $display("FAIL: Expected out = 1, got out = %b", out);
            $finish;
        end

        // Test case 3: Check output after reset
        #10;
        rst = 0; // Assert reset
        #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0 after reset, got out = %b", out);
            $finish;
        end

        // Test case 4: Check output when input is 0 again
        #10;
        rst = 1; // Release reset
        in = 0; // Set input to 0
        #10;
        if (out !== 0) begin
            $display("FAIL: Expected out = 0, got out = %b", out);
            $finish;
        end

        // Test case 5: Check output when input is 1 again
        #10;
        in = 1; // Set input to 1
        #10;
        if (out !== 1) begin
            $display("FAIL: Expected out = 1, got out = %b", out);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule