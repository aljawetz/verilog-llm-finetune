`timescale 1ns/1ps

module tb_synchronizer;

    parameter pt = 3;
    reg clk;
    reg rst;
    reg [pt:0] pin;
    wire [pt:0] pout;

    // Instantiate the module under test (uut)
    synchronizer uut (
        .clk(clk),
        .rst(rst),
        .pin(pin),
        .pout(pout)
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
        pin = 4'b0000;

        // Apply reset
        #3 rst = 0; // Assert reset
        #10 rst = 1; // Deassert reset

        // Test case 1: Check output after reset
        #10;
        if (pout !== 4'b0000) begin
            $display("FAIL: Output not zero after reset");
            $finish;
        end

        // Test case 2: Check synchronization of pin
        pin = 4'b1010; // Change input
        #10; // Wait for two clock cycles
        if (pout !== 4'b0000) begin
            $display("FAIL: Output not synchronized after first clock");
            $finish;
        end

        // Test case 3: Check output after one clock cycle
        #10; // Wait for another clock cycle
        if (pout !== 4'b1010) begin
            $display("FAIL: Output not synchronized after second clock");
            $finish;
        end

        // Test case 4: Change input and check output
        pin = 4'b1111; // Change input again
        #10; // Wait for two clock cycles
        if (pout !== 4'b1010) begin
            $display("FAIL: Output not synchronized after first clock with new input");
            $finish;
        end

        // Test case 5: Check output after another clock cycle
        #10; // Wait for another clock cycle
        if (pout !== 4'b1111) begin
            $display("FAIL: Output not synchronized after second clock with new input");
            $finish;
        end

        // Test case 6: Assert reset again
        #5 rst = 0; // Assert reset
        #10 rst = 1; // Deassert reset
        #10;
        if (pout !== 4'b0000) begin
            $display("FAIL: Output not zero after reset again");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule