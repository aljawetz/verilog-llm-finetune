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
        #10; // Wait for 10ns
        
        // Release reset
        rst = 0;
        #10; // Wait for 10ns

        // Test case 1: Check output when input is 0
        i = 0;
        #10; // Wait for 10ns
        if (o !== 0) begin
            $display("FAIL: Expected output 0 when input is 0");
            $finish;
        end

        // Test case 2: Check output when input changes to 1
        i = 1;
        #10; // Wait for 10ns
        if (o !== 0) begin
            $display("FAIL: Expected output 0 when input is 1 (first clock)");
            $finish;
        end

        // Test case 3: Check output after another clock cycle
        #10; // Wait for 10ns
        if (o !== 1) begin
            $display("FAIL: Expected output 1 after second clock with input 1");
            $finish;
        end

        // Test case 4: Check output when input goes back to 0
        i = 0;
        #10; // Wait for 10ns
        if (o !== 1) begin
            $display("FAIL: Expected output 1 after input goes to 0 (first clock)");
            $finish;
        end

        // Test case 5: Check output after another clock cycle
        #10; // Wait for 10ns
        if (o !== 0) begin
            $display("FAIL: Expected output 0 after second clock with input 0");
            $finish;
        end

        // Test case 6: Assert reset functionality
        rst = 1;
        #10; // Wait for 10ns
        if (o !== 0) begin
            $display("FAIL: Expected output 0 after reset");
            $finish;
        end

        // Test case 7: Check output after reset is released
        rst = 0;
        #10; // Wait for 10ns
        i = 1;
        #10; // Wait for 10ns
        if (o !== 0) begin
            $display("FAIL: Expected output 0 when input is 1 (first clock after reset)");
            $finish;
        end

        // Final check after another clock cycle
        #10; // Wait for 10ns
        if (o !== 1) begin
            $display("FAIL: Expected output 1 after second clock with input 1 after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule