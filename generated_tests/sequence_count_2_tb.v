`timescale 1ns/1ps

module tb_sequence_count;
  reg clk;
  reg rst;
  wire [3:0] counter;

  // Instantiate the module under test (uut)
  sequence_count uut (
    .clk(clk),
    .rst(rst),
    .counter(counter)
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
    
    // Wait for a few clock cycles and check the counter values
    #10; 
    if (counter !== 4'b0000) $display("FAIL: Counter should be 0 after reset");

    #10; 
    if (counter !== 4'b0010) $display("FAIL: Counter should be 2");

    #10; 
    if (counter !== 4'b0101) $display("FAIL: Counter should be 5");

    #10; 
    if (counter !== 4'b1000) $display("FAIL: Counter should be 8");

    #10; 
    if (counter !== 4'b1011) $display("FAIL: Counter should be 11");

    #10; 
    if (counter !== 4'b1110) $display("FAIL: Counter should be 14");

    #10; 
    if (counter !== 4'b0000) $display("FAIL: Counter should be 0 again");

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule