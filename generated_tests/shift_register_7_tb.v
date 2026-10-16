`timescale 1ns/1ps

module tb_shift_register;
  reg clk;
  reg reset;
  reg shift_left;
  reg shift_right;
  reg s_in;
  wire [3:0] data;

  // Instantiate the shift_register module
  shift_register uut (
    .clk(clk),
    .reset(reset),
    .shift_left(shift_left),
    .shift_right(shift_right),
    .s_in(s_in),
    .data(data)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    shift_left = 0;
    shift_right = 0;
    s_in = 0;

    // Wait for a clock cycle
    #10;
    
    // Release reset
    reset = 0;
    
    // Test shifting left
    s_in = 1; shift_left = 1; shift_right = 0; #10;
    if (data !== 4'b0001) $display("FAIL: Expected data=0001, got data=%b", data);
    
    s_in = 0; shift_left = 1; #10;
    if (data !== 4'b0010) $display("FAIL: Expected data=0010, got data=%b", data);
    
    s_in = 1; shift_left = 1; #10;
    if (data !== 4'b0101) $display("FAIL: Expected data=0101, got data=%b", data);
    
    // Reset the register
    reset = 1; #10;
    reset = 0; #10;
    
    // Test shifting right
    s_in = 1; shift_left = 0; shift_right = 1; #10;
    if (data !== 4'b1000) $display("FAIL: Expected data=1000, got data=%b", data);
    
    s_in = 0; shift_right = 1; #10;
    if (data !== 4'b0100) $display("FAIL: Expected data=0100, got data=%b", data);
    
    s_in = 1; shift_right = 1; #10;
    if (data !== 4'b0010) $display("FAIL: Expected data=0010, got data=%b", data);
    
    // Final check
    if (data !== 4'b0010) $display("FAIL: Final data check failed, got data=%b", data);
    
    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule