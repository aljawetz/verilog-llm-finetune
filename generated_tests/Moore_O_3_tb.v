`timescale 1ns/1ps

module tb_Moore_O;

reg clk;
reg rst;
reg in;
wire out;

// Instantiate the module under test
Moore_O uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    in = 0;

    // Apply reset
    #10 rst = 0;

    // Test sequence
    // Test pattern: 1010
    // Expected output: out should be high after the last '0' in '1010'
    
    // State s0
    #10 in = 1; // Move to s1
    #10 in = 0; // Move to s10
    #10 in = 1; // Move to s101
    #10 in = 0; // Move to s1010
    #10 in = 1; // out should be 1 (detected 1010)
    
    if (out !== 1) begin
        $display("FAIL: Expected out to be 1 after 1010, got %b", out);
        $finish;
    end

    // Reset and check output
    #10 rst = 1; // Reset
    #10 rst = 0; // Release reset

    // Test pattern: 110
    // Expected output: out should be low (no valid pattern)
    
    // State s0
    #10 in = 1; // Move to s1
    #10 in = 1; // Stay in s1
    #10 in = 0; // Move to s10
    
    if (out !== 0) begin
        $display("FAIL: Expected out to be 0 after 110, got %b", out);
        $finish;
    end

    // Test pattern: 1010 again
    #10 in = 1; // Move to s1
    #10 in = 0; // Move to s10
    #10 in = 1; // Move to s101
    #10 in = 0; // Move to s1010
    #10 in = 1; // out should be 1 (detected 1010)
    
    if (out !== 1) begin
        $display("FAIL: Expected out to be 1 after 1010, got %b", out);
        $finish;
    end

    // Final reset
    #10 rst = 1; // Reset
    #10 rst = 0; // Release reset

    // Check for no output with a different pattern
    #10 in = 0; // Stay in s0
    #10 in = 0; // Stay in s0
    
    if (out !== 0) begin
        $display("FAIL: Expected out to be 0 after no input, got %b", out);
        $finish;
    end

    // If we reach here, all tests passed
    $display("PASS");
    $finish;
end

endmodule