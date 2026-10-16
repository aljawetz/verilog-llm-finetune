`timescale 1ns/1ps

module tb_sgmii_8b10b_encode;

    reg clk;
    reg rst;
    reg [7:0] eight_bit;
    reg is_k;
    wire [9:0] ten_bit;

    // Instantiate the module under test (uut)
    sgmii_8b10b_encode uut (
        .clk(clk),
        .rst(rst),
        .eight_bit(eight_bit),
        .is_k(is_k),
        .ten_bit(ten_bit)
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
        eight_bit = 8'h00;
        is_k = 0;

        // Release reset
        #10;
        rst = 0;

        // Test cases
        // Test normal data encoding
        eight_bit = 8'h00; is_k = 0; #10;
        if (ten_bit !== 10'b1001110100) $display("FAIL: Expected 1001110100 for 8'h00, got %b", ten_bit);

        eight_bit = 8'h01; is_k = 0; #10;
        if (ten_bit !== 10'b0111010100) $display("FAIL: Expected 0111010100 for 8'h01, got %b", ten_bit);

        eight_bit = 8'h02; is_k = 0; #10;
        if (ten_bit !== 10'b1011010100) $display("FAIL: Expected 1011010100 for 8'h02, got %b", ten_bit);

        // Test K character encoding
        eight_bit = 8'h1C; is_k = 1; #10;
        if (ten_bit !== 10'b0011110100) $display("FAIL: Expected 0011110100 for K character 8'h1C, got %b", ten_bit);

        eight_bit = 8'h3C; is_k = 1; #10;
        if (ten_bit !== 10'b0011111001) $display("FAIL: Expected 0011111001 for K character 8'h3C, got %b", ten_bit);

        // Test reset functionality
        rst = 1; #10;
        rst = 0; #10;

        // Test more data encoding after reset
        eight_bit = 8'h04; is_k = 0; #10;
        if (ten_bit !== 10'b1101010100) $display("FAIL: Expected 1101010100 for 8'h04, got %b", ten_bit);

        eight_bit = 8'hFF; is_k = 0; #10;
        if (ten_bit !== 10'b1010110110) $display("FAIL: Expected 1010110110 for 8'hFF, got %b", ten_bit);

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule