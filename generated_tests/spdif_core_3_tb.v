`timescale 1ns/1ps

module tb_spdif_core;

    // Parameters
    reg clk_i;
    reg rst_i;
    reg bit_out_en_i;
    reg [31:0] sample_i;
    wire spdif_o;
    wire sample_req_o;

    // Instantiate the module under test (uut)
    spdif_core uut (
        .clk_i(clk_i),
        .rst_i(rst_i),
        .bit_out_en_i(bit_out_en_i),
        .spdif_o(spdif_o),
        .sample_i(sample_i),
        .sample_req_o(sample_req_o)
    );

    // Clock generation
    initial begin
        clk_i = 0;
        forever #5 clk_i = ~clk_i; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_i = 1;
        bit_out_en_i = 0;
        sample_i = 32'h00000000;

        // Release reset
        #10;
        rst_i = 0;

        // Test 1: Send a left sample
        sample_i = 32'h12345678; // Left: 0x5678, Right: 0x1234
        bit_out_en_i = 1; // Enable bit output
        #10; // Wait for a few clock cycles

        // Check sample_req_o
        if (sample_req_o !== 1'b1) begin
            $display("FAIL: sample_req_o should be high after loading sample");
            $finish;
        end

        // Wait for the next subframe
        #100; // Wait enough time for the subframe to be processed

        // Test 2: Check if right sample is loaded
        bit_out_en_i = 1; // Keep bit output enabled
        #10; // Wait for a few clock cycles

        // Check sample_req_o
        if (sample_req_o !== 1'b0) begin
            $display("FAIL: sample_req_o should be low after processing right sample");
            $finish;
        end

        // Wait for the next subframe
        #100; // Wait enough time for the subframe to be processed

        // Test 3: Check SPDIF output
        bit_out_en_i = 1; // Enable bit output
        #10; // Wait for a few clock cycles

        // Check the output bits (this is a simplified check)
        if (spdif_o !== 1'b0) begin
            $display("FAIL: spdif_o should be low during preamble");
            $finish;
        end

        // Wait for the next subframe
        #100; // Wait enough time for the subframe to be processed

        // Check if the output transitions correctly
        // This would require more detailed timing analysis in a real testbench

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule