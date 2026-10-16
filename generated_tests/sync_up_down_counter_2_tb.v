`timescale 1ns/1ps

module tb_sync_up_down_counter;
  // Inputs
  reg clk;
  reg reset;
  reg up_down;

  // Outputs
  wire [3:0] count;

  // Instantiate the Unit Under Test (UUT)
  sync_up_down_counter uut (
    .clk(clk), 
    .reset(reset), 
    .up_down(up_down), 
    .count(count)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 0;
    up_down = 1; // Start with counting up

    // Test 1: Reset the counter
    #10 reset = 1; // Activate reset
    #10 reset = 0; // Deactivate reset
    if (count !== 0) begin
      $display("FAIL: Counter should be 0 after reset");
      $finish;
    end

    // Test 2: Count up from 0 to 15
    #10; // Wait for clock edge
    if (count !== 1) begin
      $display("FAIL: Counter should be 1 after counting up");
      $finish;
    end
    #10; // Wait for clock edge
    if (count !== 2) begin
      $display("FAIL: Counter should be 2 after counting up");
      $finish;
    end
    #10; // Wait for clock edge
    if (count !== 3) begin
      $display("FAIL: Counter should be 3 after counting up");
      $finish;
    end
    // Continue counting up until 15
    repeat(12) begin
      #10; // Wait for clock edge
    end
    if (count !== 15) begin
      $display("FAIL: Counter should be 15 after counting up");
      $finish;
    end

    // Test 3: Count down from 15 to 0
    up_down = 0; // Change to counting down
    repeat(15) begin
      #10; // Wait for clock edge
    end
    if (count !== 0) begin
      $display("FAIL: Counter should be 0 after counting down");
      $finish;
    end

    // Test 4: Count up from 0 to 8
    up_down = 1; // Change to counting up
    repeat(8) begin
      #10; // Wait for clock edge
    end
    if (count !== 8) begin
      $display("FAIL: Counter should be 8 after counting up");
      $finish;
    end

    // Test 5: Reset the counter again
    #10 reset = 1; // Activate reset
    #10 reset = 0; // Deactivate reset
    if (count !== 0) begin
      $display("FAIL: Counter should be 0 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule