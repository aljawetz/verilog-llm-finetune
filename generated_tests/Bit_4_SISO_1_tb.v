`timescale 1ns/1ps

module tb_Bit_4_SISO;

reg in;
reg clk;
reg rst;
wire [3:0] out;

// Instantiate the module under test
Bit_4_SISO uut (
    .in(in),
    .clk(clk),
    .rst(rst),
    .out(out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    in = 0;
    rst = 0;

    // Apply reset
    #10 rst = 1; // Release reset after 10ns
    #10;

    // Test sequence
    // Shift in 1, 0, 1, 1
    in = 1; #10; // out should be 0001
    if (out !== 4'b0001) $display("FAIL: Expected out=0001, got out=%b", out);
    
    in = 0; #10; // out should be 1001
    if (out !== 4'b1001) $display("FAIL: Expected out=1001, got out=%b", out);
    
    in = 1; #10; // out should be 0101
    if (out !== 4'b0101) $display("FAIL: Expected out=0101, got out=%b", out);
    
    in = 1; #10; // out should be 1011
    if (out !== 4'b1011) $display("FAIL: Expected out=1011, got out=%b", out);
    
    // Reset the module
    rst = 0; #10; // Apply reset
    rst = 1; #10; // Release reset
    if (out !== 4'b0000) $display("FAIL: Expected out=0000 after reset, got out=%b", out);
    
    // Finish simulation
    $display("PASS");
    $finish;
end

endmodule