`timescale 1ns/1ps

module tb_dff;

    reg clk;
    reg rst;
    reg [7:0] d;
    wire [7:0] q;

    // Instantiate the D flip-flop
    dff #(8) uut (
        .clk(clk),
        .rst(rst),
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
        // Initialize signals
        rst = 1;
        d = 8'b00000000;
        #10; // Wait for 10ns

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Check reset functionality
        d = 8'b10101010;
        #10; // Wait for one clock cycle
        if (q !== 8'b10101010) begin
            $display("FAIL: Output q should be 10101010 after clock edge with d = 10101010");
            $finish;
        end

        // Test case 2: Check reset functionality
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 8'b00000000) begin
            $display("FAIL: Output q should be 00000000 after reset");
            $finish;
        end

        // Test case 3: Check normal operation after reset
        rst = 0; // Release reset
        d = 8'b11110000;
        #10; // Wait for one clock cycle
        if (q !== 8'b11110000) begin
            $display("FAIL: Output q should be 11110000 after clock edge with d = 11110000");
            $finish;
        end

        // Test case 4: Check another value
        d = 8'b00001111;
        #10; // Wait for one clock cycle
        if (q !== 8'b00001111) begin
            $display("FAIL: Output q should be 00001111 after clock edge with d = 00001111");
            $finish;
        end

        // Test case 5: Check reset again
        rst = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 8'b00000000) begin
            $display("FAIL: Output q should be 00000000 after reset");
            $finish;
        end

        // Finalize the simulation
        $display("PASS");
        $finish;
    end

endmodule