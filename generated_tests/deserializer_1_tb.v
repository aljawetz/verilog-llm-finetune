`timescale 1ns/1ps

module tb_deserializer;

    reg deserializer_enable;
    reg sampled_data;
    reg clk;
    reg rst;
    wire [7:0] P_DATA;

    // Instantiate the deserializer module
    deserializer uut (
        .deserializer_enable(deserializer_enable),
        .sampled_data(sampled_data),
        .clk(clk),
        .rst(rst),
        .P_DATA(P_DATA)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        deserializer_enable = 0;
        sampled_data = 0;
        rst = 0;

        // Reset the deserializer
        #10;
        rst = 1; // Release reset
        #10;

        // Test case 1: Enable deserializer and shift in bits
        deserializer_enable = 1;

        // Sample bits: 10101010
        sampled_data = 1; #10; // P_DATA should be 10000000
        if (P_DATA !== 8'b10000000) $display("FAIL: Expected P_DATA = 10000000, got %b", P_DATA);
        
        sampled_data = 0; #10; // P_DATA should be 11000000
        if (P_DATA !== 8'b11000000) $display("FAIL: Expected P_DATA = 11000000, got %b", P_DATA);
        
        sampled_data = 1; #10; // P_DATA should be 11100000
        if (P_DATA !== 8'b11100000) $display("FAIL: Expected P_DATA = 11100000, got %b", P_DATA);
        
        sampled_data = 0; #10; // P_DATA should be 01110000
        if (P_DATA !== 8'b01110000) $display("FAIL: Expected P_DATA = 01110000, got %b", P_DATA);
        
        sampled_data = 1; #10; // P_DATA should be 00111000
        if (P_DATA !== 8'b00111000) $display("FAIL: Expected P_DATA = 00111000, got %b", P_DATA);
        
        sampled_data = 0; #10; // P_DATA should be 00011100
        if (P_DATA !== 8'b00011100) $display("FAIL: Expected P_DATA = 00011100, got %b", P_DATA);
        
        sampled_data = 1; #10; // P_DATA should be 00001110
        if (P_DATA !== 8'b00001110) $display("FAIL: Expected P_DATA = 00001110, got %b", P_DATA);
        
        sampled_data = 0; #10; // P_DATA should be 00000111
        if (P_DATA !== 8'b00000111) $display("FAIL: Expected P_DATA = 00000111, got %b", P_DATA);

        // Test case 2: Disable deserializer
        deserializer_enable = 0;
        sampled_data = 1; #10; // P_DATA should remain 00000111
        if (P_DATA !== 8'b00000111) $display("FAIL: Expected P_DATA = 00000111, got %b", P_DATA);

        // Test case 3: Reset functionality
        rst = 0; #10; // Assert reset
        if (P_DATA !== 8'b00000000) $display("FAIL: Expected P_DATA = 00000000 after reset, got %b", P_DATA);
        
        rst = 1; #10; // Release reset
        deserializer_enable = 1; // Enable again
        sampled_data = 1; #10; // P_DATA should be 10000000
        if (P_DATA !== 8'b10000000) $display("FAIL: Expected P_DATA = 10000000 after reset, got %b", P_DATA);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule