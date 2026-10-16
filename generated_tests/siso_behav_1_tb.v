`timescale 1ns/1ps

module tb_siso_behav;

reg clk;
reg rst;
reg s_in;
wire s_out;

// Instantiate the module under test
siso_behav uut (
    .clk(clk),
    .rst(rst),
    .s_in(s_in),
    .s_out(s_out)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    s_in = 0;

    // Apply reset
    rst = 1;
    #10;
    rst = 0;

    // Test sequence
    // Test case 1: Shift in a '1'
    s_in = 1; #10;
    if (s_out !== 0) $display("FAIL: Expected s_out = 0 after first clock with s_in = 1");
    
    // Test case 2: Shift in a '0'
    s_in = 0; #10;
    if (s_out !== 1) $display("FAIL: Expected s_out = 1 after second clock with s_in = 0");
    
    // Test case 3: Shift in a '1'
    s_in = 1; #10;
    if (s_out !== 0) $display("FAIL: Expected s_out = 0 after third clock with s_in = 1");
    
    // Test case 4: Shift in a '1'
    s_in = 1; #10;
    if (s_out !== 1) $display("FAIL: Expected s_out = 1 after fourth clock with s_in = 1");
    
    // Test case 5: Shift in a '0'
    s_in = 0; #10;
    if (s_out !== 1) $display("FAIL: Expected s_out = 1 after fifth clock with s_in = 0");
    
    // Test case 6: Shift in a '0'
    s_in = 0; #10;
    if (s_out !== 0) $display("FAIL: Expected s_out = 0 after sixth clock with s_in = 0");

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule