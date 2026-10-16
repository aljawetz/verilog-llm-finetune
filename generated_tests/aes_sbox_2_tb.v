`timescale 1ns/1ps

module tb_aes_sbox;

    reg [7:0] pt;
    reg reset;
    reg clock;
    wire [7:0] ct;

    // Instantiate the module under test
    aes_sbox uut (
        .pt(pt),
        .ct(ct),
        .reset(reset),
        .clock(clock)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;

        // Test vector 1
        pt = 8'h00; // Input: 0x00
        #10; // Wait for 10ns
        if (ct !== 8'h63) begin
            $display("FAIL: Expected ct = 0x63 for pt = 0x00, got ct = %h", ct);
            $finish;
        end

        // Test vector 2
        pt = 8'h01; // Input: 0x01
        #10; // Wait for 10ns
        if (ct !== 8'h7c) begin
            $display("FAIL: Expected ct = 0x7c for pt = 0x01, got ct = %h", ct);
            $finish;
        end

        // Test vector 3
        pt = 8'hff; // Input: 0xff
        #10; // Wait for 10ns
        if (ct !== 8'h16) begin
            $display("FAIL: Expected ct = 0x16 for pt = 0xff, got ct = %h", ct);
            $finish;
        end

        // Test vector 4
        pt = 8'h7f; // Input: 0x7f
        #10; // Wait for 10ns
        if (ct !== 8'hd2) begin
            $display("FAIL: Expected ct = 0xd2 for pt = 0x7f, got ct = %h", ct);
            $finish;
        end

        // Test vector 5
        pt = 8'h80; // Input: 0x80
        #10; // Wait for 10ns
        if (ct !== 8'hcd) begin
            $display("FAIL: Expected ct = 0xcd for pt = 0x80, got ct = %h", ct);
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10; // Wait for 10ns
        reset = 0;
        pt = 8'h01; // Input after reset
        #10; // Wait for 10ns
        if (ct !== 8'h7c) begin
            $display("FAIL: Expected ct = 0x7c for pt = 0x01 after reset, got ct = %h", ct);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule