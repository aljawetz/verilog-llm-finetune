`timescale 1ns/1ps

module tb_HammingWeight;

    reg clk;
    reg rst_n;
    reg op_start;
    reg [15:0] din;
    wire hw_vld;
    wire [4:0] hamW;

    // Instantiate the module under test (uut)
    HammingWeight uut (
        .clk(clk),
        .rst_n(rst_n),
        .op_start(op_start),
        .din(din),
        .hw_vld(hw_vld),
        .hamW(hamW)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        op_start = 0;
        din = 16'd0;

        // Reset the DUT
        #10;
        rst_n = 1;

        // Test case 1: Hamming weight of 0x0000
        din = 16'h0000;
        op_start = 1;
        #10;
        op_start = 0;
        #40; // Wait for processing
        if (hamW !== 5'd0) begin
            $display("FAIL: Expected hamW = 0 for input 0x0000, got %d", hamW);
            $finish;
        end

        // Test case 2: Hamming weight of 0xFFFF
        din = 16'hFFFF;
        op_start = 1;
        #10;
        op_start = 0;
        #40; // Wait for processing
        if (hamW !== 5'd16) begin
            $display("FAIL: Expected hamW = 16 for input 0xFFFF, got %d", hamW);
            $finish;
        end

        // Test case 3: Hamming weight of 0xAAAA
        din = 16'hAAAA;
        op_start = 1;
        #10;
        op_start = 0;
        #40; // Wait for processing
        if (hamW !== 5'd8) begin
            $display("FAIL: Expected hamW = 8 for input 0xAAAA, got %d", hamW);
            $finish;
        end

        // Test case 4: Hamming weight of 0x5555
        din = 16'h5555;
        op_start = 1;
        #10;
        op_start = 0;
        #40; // Wait for processing
        if (hamW !== 5'd8) begin
            $display("FAIL: Expected hamW = 8 for input 0x5555, got %d", hamW);
            $finish;
        end

        // Test case 5: Hamming weight of 0x1234
        din = 16'h1234;
        op_start = 1;
        #10;
        op_start = 0;
        #40; // Wait for processing
        if (hamW !== 5'd5) begin
            $display("FAIL: Expected hamW = 5 for input 0x1234, got %d", hamW);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule