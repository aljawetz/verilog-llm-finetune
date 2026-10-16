`timescale 1ns/1ps

module tb_sipo_behav;

  reg clk;
  reg rst;
  reg s_in;
  wire [3:0] p_out;

  // Instantiate the module under test (uut)
  sipo_behav uut (
    .clk(clk),
    .rst(rst),
    .s_in(s_in),
    .p_out(p_out)
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
    s_in = 0;

    // Apply reset
    #10;
    rst = 0;

    // Test sequence
    // Shift in 4 bits: 1011
    s_in = 1; #10; // p_out should be 0001
    if (p_out !== 4'b0001) $display("FAIL: Expected p_out = 0001, got p_out = %b", p_out);
    
    s_in = 0; #10; // p_out should be 0010
    if (p_out !== 4'b0010) $display("FAIL: Expected p_out = 0010, got p_out = %b", p_out);
    
    s_in = 1; #10; // p_out should be 0101
    if (p_out !== 4'b0101) $display("FAIL: Expected p_out = 0101, got p_out = %b", p_out);
    
    s_in = 1; #10; // p_out should be 1011
    if (p_out !== 4'b1011) $display("FAIL: Expected p_out = 1011, got p_out = %b", p_out);
    
    // Reset the module
    rst = 1; #10; // p_out should be 0000
    rst = 0; #10; // Check if p_out is reset
    if (p_out !== 4'b0000) $display("FAIL: Expected p_out = 0000 after reset, got p_out = %b", p_out);
    
    // Check if shifting works after reset
    s_in = 0; #10; // p_out should be 0001
    if (p_out !== 4'b0001) $display("FAIL: Expected p_out = 0001, got p_out = %b", p_out);
    
    s_in = 1; #10; // p_out should be 0011
    if (p_out !== 4'b0011) $display("FAIL: Expected p_out = 0011, got p_out = %b", p_out);
    
    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule