`timescale 1ns/1ps

module tb_signal_detector;

    reg clk;
    reg rst;
    reg req;
    wire ack;

    // Instantiate the module under test (uut)
    signal_detector uut (
        .clk(clk),
        .rst(rst),
        .req(req),
        .ack(ack)
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
        req = 0;
        #10; // Wait for 10ns
        rst = 0;

        // Test case 1: Assert req and check ack after 5 clock cycles
        req = 1; // Assert req
        #10; // Wait for 10ns
        req = 0; // Deassert req

        // Wait for 5 clock cycles
        #50; 
        if (ack !== 1) begin
            $display("FAIL: ack should be asserted after 5 clock cycles from req posedge");
            $finish;
        end

        // Reset the module
        rst = 1;
        #10;
        rst = 0;

        // Test case 2: Assert req again and check ack
        req = 1; // Assert req
        #10; // Wait for 10ns
        req = 0; // Deassert req

        // Wait for 5 clock cycles
        #50; 
        if (ack !== 1) begin
            $display("FAIL: ack should be asserted after 5 clock cycles from req posedge");
            $finish;
        end

        // Final reset and check ack
        rst = 1;
        #10;
        rst = 0;

        // Test case 3: Assert req and check ack again
        req = 1; // Assert req
        #10; // Wait for 10ns
        req = 0; // Deassert req

        // Wait for 5 clock cycles
        #50; 
        if (ack !== 1) begin
            $display("FAIL: ack should be asserted after 5 clock cycles from req posedge");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule