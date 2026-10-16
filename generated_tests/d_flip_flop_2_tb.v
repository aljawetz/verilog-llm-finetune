`timescale 1ns/1ps

module tb_d_flip_flop;

    reg reset;
    reg clk;
    reg din;
    wire dout;

    // Instantiate the D flip-flop
    d_flip_flop uut (
        .reset(reset),
        .clk(clk),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        din = 0;

        // Wait for a clock cycle
        #10;

        // Test reset functionality
        reset = 1; // Assert reset
        #10;
        if (dout !== 1'b0) begin
            $display("FAIL: dout should be 0 after reset");
            $finish;
        end

        // Release reset
        reset = 0;
        #10;

        // Test D flip-flop functionality
        din = 1; // Set din to 1
        #10;
        if (dout !== 1'b1) begin
            $display("FAIL: dout should be 1 when din is 1");
            $finish;
        end

        din = 0; // Set din to 0
        #10;
        if (dout !== 1'b0) begin
            $display("FAIL: dout should be 0 when din is 0");
            $finish;
        end

        // Test multiple clock edges
        din = 1; // Set din to 1
        #10;
        if (dout !== 1'b1) begin
            $display("FAIL: dout should be 1 after clock edge with din 1");
            $finish;
        end

        din = 0; // Set din to 0
        #10;
        if (dout !== 1'b0) begin
            $display("FAIL: dout should be 0 after clock edge with din 0");
            $finish;
        end

        // Test reset during operation
        din = 1; // Set din to 1
        #10;
        reset = 1; // Assert reset
        #10;
        if (dout !== 1'b0) begin
            $display("FAIL: dout should be 0 after reset during operation");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule