`timescale 1ns/1ps

module tb_Bit_4_UP_DOWN_COUNTER;

reg trig;
reg clk;
reg rst;
wire [3:0] count_out;

// Instantiate the module under test (uut)
Bit_4_UP_DOWN_COUNTER uut (
    .trig(trig),
    .clk(clk),
    .rst(rst),
    .count_out(count_out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 0;
    trig = 0;

    // Apply reset
    #10;
    rst = 1; // Release reset

    // Test counting up
    trig = 1; // Set trigger to count up
    #10; // Wait for 1 clock cycle
    if (count_out !== 4'd1) $display("FAIL: Expected count_out to be 1 after first count up");
    
    #10; // Wait for 1 clock cycle
    if (count_out !== 4'd2) $display("FAIL: Expected count_out to be 2 after second count up");
    
    #10; // Wait for 1 clock cycle
    if (count_out !== 4'd3) $display("FAIL: Expected count_out to be 3 after third count up");
    
    // Test counting down
    trig = 0; // Set trigger to count down
    #10; // Wait for 1 clock cycle
    if (count_out !== 4'd2) $display("FAIL: Expected count_out to be 2 after first count down");
    
    #10; // Wait for 1 clock cycle
    if (count_out !== 4'd1) $display("FAIL: Expected count_out to be 1 after second count down");
    
    #10; // Wait for 1 clock cycle
    if (count_out !== 4'd0) $display("FAIL: Expected count_out to be 0 after third count down");
    
    // Test wrap around on counting down
    #10; // Wait for 1 clock cycle
    if (count_out !== 4'd15) $display("FAIL: Expected count_out to be 15 after wrap around down");
    
    // Test wrap around on counting up
    trig = 1; // Set trigger to count up
    repeat (15) begin
        #10; // Wait for 1 clock cycle
    end
    if (count_out !== 4'd0) $display("FAIL: Expected count_out to be 0 after wrap around up");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule