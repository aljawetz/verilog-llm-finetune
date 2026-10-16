`timescale 1ns/1ps

module tb_serializer;

reg clk;
reg rst;
reg [7:0] par_data;
reg load;
wire ser_o;

// Instantiate the module under test
serializer uut (
    .clk(clk),
    .rst(rst),
    .par_data(par_data),
    .load(load),
    .ser_o(ser_o)
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
    load = 0;
    par_data = 8'b0;
    
    // Release reset
    #10;
    rst = 0;

    // Test case 1: Load data and serialize
    par_data = 8'b10101010; // Load this data
    load = 1; // Signal to load data
    #10; // Wait for one clock cycle
    load = 0; // Stop loading

    // Check serialized output
    #10; // Wait for first bit to be output
    if (ser_o !== 1'b1) begin
        $display("FAIL: Expected ser_o = 1, got %b", ser_o);
        $finish;
    end

    #10; // Wait for second bit
    if (ser_o !== 1'b0) begin
        $display("FAIL: Expected ser_o = 0, got %b", ser_o);
        $finish;
    end

    #10; // Wait for third bit
    if (ser_o !== 1'b1) begin
        $display("FAIL: Expected ser_o = 1, got %b", ser_o);
        $finish;
    end

    #10; // Wait for fourth bit
    if (ser_o !== 0) begin
        $display("FAIL: Expected ser_o = 0, got %b", ser_o);
        $finish;
    end

    #10; // Wait for fifth bit
    if (ser_o !== 1) begin
        $display("FAIL: Expected ser_o = 1, got %b", ser_o);
        $finish;
    end

    #10; // Wait for sixth bit
    if (ser_o !== 0) begin
        $display("FAIL: Expected ser_o = 0, got %b", ser_o);
        $finish;
    end

    #10; // Wait for seventh bit
    if (ser_o !== 1) begin
        $display("FAIL: Expected ser_o = 1, got %b", ser_o);
        $finish;
    end

    #10; // Wait for eighth bit
    if (ser_o !== 0) begin
        $display("FAIL: Expected ser_o = 0, got %b", ser_o);
        $finish;
    end

    // Test case 2: Reset functionality
    #10;
    rst = 1; // Assert reset
    #10;
    rst = 0; // Release reset

    // Check that output is reset
    if (ser_o !== 0) begin
        $display("FAIL: Expected ser_o = 0 after reset, got %b", ser_o);
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule