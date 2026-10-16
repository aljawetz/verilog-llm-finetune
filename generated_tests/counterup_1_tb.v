`timescale 1ns/1ps

module tb_counterup;

reg clk;
reg rst;
reg load;
reg [3:0] din;
wire [3:0] cntr;

// Instantiate the module under test
counterup uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .din(din),
    .cntr(cntr)
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
    load = 0;
    din = 4'b0000;

    // Test 1: Reset the counter
    #10 rst = 1; // Release reset
    #10 if (cntr !== 4'b0000) $display("FAIL: Counter not reset to zero");
    
    // Test 2: Load a value into the counter
    #10 load = 1; din = 4'b1010; // Load 10
    #10 load = 0; // Release load
    #10 if (cntr !== 4'b1010) $display("FAIL: Counter did not load the correct value");

    // Test 3: Increment the counter
    #10 if (cntr !== 4'b1011) $display("FAIL: Counter did not increment correctly");
    #10 if (cntr !== 4'b1100) $display("FAIL: Counter did not increment correctly");
    #10 if (cntr !== 4'b1101) $display("FAIL: Counter did not increment correctly");
    
    // Test 4: Reset the counter again
    #10 rst = 0; // Assert reset
    #10 rst = 1; // Release reset
    #10 if (cntr !== 4'b0000) $display("FAIL: Counter not reset to zero after second reset");

    // Test 5: Load another value
    #10 load = 1; din = 4'b0011; // Load 3
    #10 load = 0; // Release load
    #10 if (cntr !== 4'b0011) $display("FAIL: Counter did not load the correct value");

    // Test 6: Increment after loading
    #10 if (cntr !== 4'b0100) $display("FAIL: Counter did not increment correctly after loading");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule