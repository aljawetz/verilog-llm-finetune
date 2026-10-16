`timescale 1ns/1ps

module tb_gray_sync2d;

    parameter ADDRSIZE = 4;
    reg [ADDRSIZE:0] i_ptr;
    reg des_clk;
    reg des_rst_n;
    wire [ADDRSIZE:0] o_ptr;

    // Instantiate the module under test (uut)
    gray_sync2d #(ADDRSIZE) uut (
        .o_ptr(o_ptr),
        .i_ptr(i_ptr),
        .des_clk(des_clk),
        .des_rst_n(des_rst_n)
    );

    // Clock generation
    initial begin
        des_clk = 0;
        forever #5 des_clk = ~des_clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        des_rst_n = 0;
        i_ptr = 0;

        // Apply reset
        #10;
        des_rst_n = 1; // Release reset
        #10;

        // Test case 1: Check initial output after reset
        if (o_ptr !== 0) begin
            $display("FAIL: Initial output after reset is not zero");
            $finish;
        end

        // Test case 2: Drive i_ptr and check o_ptr
        i_ptr = 5'b00001; // Set i_ptr to 1
        #10; // Wait for one clock cycle
        if (o_ptr !== 5'b00000) begin
            $display("FAIL: Output o_ptr is not as expected after first clock cycle");
            $finish;
        end

        // Test case 3: Change i_ptr and check o_ptr
        i_ptr = 5'b00010; // Set i_ptr to 2
        #10; // Wait for one clock cycle
        if (o_ptr !== 5'b00001) begin
            $display("FAIL: Output o_ptr is not as expected after second clock cycle");
            $finish;
        end

        // Test case 4: Change i_ptr again and check o_ptr
        i_ptr = 5'b00011; // Set i_ptr to 3
        #10; // Wait for one clock cycle
        if (o_ptr !== 5'b00010) begin
            $display("FAIL: Output o_ptr is not as expected after third clock cycle");
            $finish;
        end

        // Test case 5: Test reset functionality
        des_rst_n = 0; // Assert reset
        #10;
        if (o_ptr !== 0) begin
            $display("FAIL: Output o_ptr is not zero after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule