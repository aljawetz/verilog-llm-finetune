`timescale 1ns/1ps

module tb_shift;

    reg clk;
    reg rst;
    reg din;
    reg [1:0] mode;
    reg [15:0] data;
    wire [15:0] dout;

    // Instantiate the module under test (uut)
    shift uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .mode(mode),
        .data(data),
        .dout(dout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        din = 0;
        mode = 2'b00;
        data = 16'hAAAA; // Example data
        
        // Release reset
        #10;
        rst = 0;

        // Test holding value
        mode = 2'b00; // Hold
        #10;
        if (dout !== 16'b0) $display("FAIL: Expected dout to be 0 after reset, got %h", dout);

        // Test shifting right
        din = 1;
        mode = 2'b01; // Shift right
        #10;
        if (dout !== 16'b1000000000000000) $display("FAIL: Expected dout to be 1000...000 after right shift, got %h", dout);

        // Test shifting left
        din = 1;
        mode = 2'b10; // Shift left
        #10;
        if (dout !== 16'b0000000000000001) $display("FAIL: Expected dout to be 0000...001 after left shift, got %h", dout);

        // Test loading new data
        data = 16'h1234;
        mode = 2'b11; // Load new data
        #10;
        if (dout !== 16'h1234) $display("FAIL: Expected dout to be 1234 after loading new data, got %h", dout);

        // Test reset functionality
        rst = 1;
        #10;
        if (dout !== 16'b0) $display("FAIL: Expected dout to be 0 after reset, got %h", dout);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule