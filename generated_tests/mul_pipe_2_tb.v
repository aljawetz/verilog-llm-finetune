`timescale 1ns/1ps

module tb_mul_pipe;

    parameter N = 4;
    parameter M = 4;

    reg clk;
    reg rstn;
    reg vld;
    reg [M-1:0] mult1;
    reg [N-1:0] mult2;
    wire [N+M-1:0] res;
    wire res_vld;

    // Instantiate the module under test (uut)
    mul_pipe #(.N(N), .M(M)) uut (
        .clk(clk),
        .rstn(rstn),
        .vld(vld),
        .mult1(mult1),
        .mult2(mult2),
        .res(res),
        .res_vld(res_vld)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rstn = 0;
        vld = 0;
        mult1 = 0;
        mult2 = 0;

        // Release reset
        #10 rstn = 1;

        // Test case 1: 3 * 2 = 6
        #10;
        vld = 1;
        mult1 = 4'b0011; // 3
        mult2 = 4'b0010; // 2
        #10;
        vld = 0; // Deassert valid
        #10;
        if (res != 8'b00000110 || res_vld != 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: 4 * 4 = 16
        #10;
        vld = 1;
        mult1 = 4'b0100; // 4
        mult2 = 4'b0100; // 4
        #10;
        vld = 0; // Deassert valid
        #10;
        if (res != 8'b00010000 || res_vld != 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: 0 * 5 = 0
        #10;
        vld = 1;
        mult1 = 4'b0000; // 0
        mult2 = 4'b0101; // 5
        #10;
        vld = 0; // Deassert valid
        #10;
        if (res != 8'b00000000 || res_vld != 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: 7 * 3 = 21
        #10;
        vld = 1;
        mult1 = 4'b0111; // 7
        mult2 = 4'b0011; // 3
        #10;
        vld = 0; // Deassert valid
        #10;
        if (res != 8'b00010101 || res_vld != 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule