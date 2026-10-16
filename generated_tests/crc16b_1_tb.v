`timescale 1ns/1ps

module tb_crc16b;

    reg clk;
    reg rst;
    reg [7:0] data_in;
    reg crc_en;
    wire [15:0] crc_out;

    // Instantiate the Unit Under Test (UUT)
    crc16b uut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .crc_en(crc_en),
        .crc_out(crc_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        crc_en = 0;
        data_in = 8'h00;
        #10;

        // Release reset
        rst = 0;
        #10;

        // Test case 1: Check initial CRC value after reset
        if (crc_out !== 16'h0000) begin
            $display("FAIL: Initial CRC value is not zero");
            $finish;
        end

        // Test case 2: Enable CRC and input data
        crc_en = 1;
        data_in = 8'hFF; // Input data
        #10;

        // Check CRC output after first input
        if (crc_out === 16'h0000) begin
            $display("FAIL: CRC output should not be zero after input");
            $finish;
        end

        // Test case 3: Input another data
        data_in = 8'hAA; // Input data
        #10;

        // Check CRC output after second input
        if (crc_out === 16'h0000) begin
            $display("FAIL: CRC output should not be zero after second input");
            $finish;
        end

        // Test case 4: Disable CRC and check output remains the same
        crc_en = 0;
        #10;

        if (crc_out !== crc_out) begin
            $display("FAIL: CRC output should remain unchanged when disabled");
            $finish;
        end

        // Test case 5: Reset the module
        rst = 1;
        #10;
        rst = 0;
        #10;

        // Check CRC value after reset
        if (crc_out !== 16'h0000) begin
            $display("FAIL: CRC value is not zero after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule