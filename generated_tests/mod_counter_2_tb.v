`timescale 1ns/1ps

module tb_mod_counter;

reg clk;
reg rst;
wire [2:0] y;

// Instantiate the module under test (uut)
mod_counter uut (
    .clk(clk),
    .rst(rst),
    .y(y)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize reset
    rst = 1;
    #10; // Hold reset for 10ns
    rst = 0;

    // Test counting up to 6
    #10; // Wait for 1 clock cycle
    if (y !== 3'b001) $display("FAIL: Expected y=1 after 1 clock cycle");
    
    #10; // Wait for 1 clock cycle
    if (y !== 3'b010) $display("FAIL: Expected y=2 after 2 clock cycles");
    
    #10; // Wait for 1 clock cycle
    if (y !== 3'b011) $display("FAIL: Expected y=3 after 3 clock cycles");
    
    #10; // Wait for 1 clock cycle
    if (y !== 3'b100) $display("FAIL: Expected y=4 after 4 clock cycles");
    
    #10; // Wait for 1 clock cycle
    if (y !== 3'b101) $display("FAIL: Expected y=5 after 5 clock cycles");
    
    #10; // Wait for 1 clock cycle
    if (y !== 3'b000) $display("FAIL: Expected y=0 after reaching 6");
    
    // Test reset functionality
    #10; // Wait for 1 clock cycle
    rst = 1; // Assert reset
    #10; // Hold reset for 10ns
    rst = 0; // Deassert reset
    #10; // Wait for 1 clock cycle
    if (y !== 3'b001) $display("FAIL: Expected y=1 after reset and 1 clock cycle");

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule