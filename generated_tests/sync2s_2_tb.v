`timescale 1ns/1ps

module tb_sync2s;

    reg rst;
    reg clk;
    reg i;
    wire o;

    // Instantiate the module under test (uut)
    sync2s uut (
        .rst(rst),
        .clk(clk),
        .i(i),
        .o(o)
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
        i = 0;

        // Apply reset
        #10;
        rst = 0;

        // Test case 1: Check output when input is 0
        #10;
        if (o !== 0) begin
            $display("FAIL: Expected output 0, got %b", o);
            $finish;
        end

        // Test case 2: Check output when input changes to 1
        i = 1;
        #10;
        if (o !== 0) begin
            $display("FAIL: Expected output 0, got %b", o);
            $finish;
        end

        // Test case 3: Check output after one more clock cycle
        #10;
        if (o !== 1) begin
            $display("FAIL: Expected output 1, got %b", o);
            $finish;
        end

        // Test case 4: Check output when input changes back to 0
        i = 0;
        #10;
        if (o !== 1) begin
            $display("FAIL: Expected output 1, got %b", o);
            $finish;
        end

        // Test case 5: Check output after one more clock cycle
        #10;
        if (o !== 0) begin
            $display("FAIL: Expected output 0, got %b", o);
            $finish;
        end

        // Test case 6: Assert reset functionality
        rst = 1;
        #10;
        rst = 0;
        #10;
        if (o !== 0) begin
            $display("FAIL: Expected output 0 after reset, got %b", o);
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule