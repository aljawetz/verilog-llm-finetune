`timescale 1ns/1ps

module tb_dff_asynchronous;

  reg clk;
  reg rst;
  reg d_in;
  wire q_out;

  // Instantiate the D flip-flop module
  dff_asynchronous uut (
    .q_out(q_out),
    .clk(clk),
    .rst(rst),
    .d_in(d_in)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    d_in = 0;

    // Wait for a clock edge
    #10;

    // Test 1: Check reset functionality
    rst = 0; // Activate reset
    #10;
    if (q_out !== 0) begin
      $display("FAIL: Reset did not set q_out to 0");
      $finish;
    end

    // Test 2: Check data input when reset is inactive
    rst = 1; // Deactivate reset
    d_in = 1; // Set data input to 1
    #10; // Wait for clock edge
    if (q_out !== 1) begin
      $display("FAIL: q_out did not update to d_in when reset is inactive");
      $finish;
    end

    // Test 3: Change data input
    d_in = 0; // Change data input to 0
    #10; // Wait for clock edge
    if (q_out !== 0) begin
      $display("FAIL: q_out did not update to new d_in value");
      $finish;
    end

    // Test 4: Check reset functionality again
    rst = 0; // Activate reset
    #10;
    if (q_out !== 0) begin
      $display("FAIL: Reset did not set q_out to 0 again");
      $finish;
    end

    // Test 5: Check data input after reset
    rst = 1; // Deactivate reset
    d_in = 1; // Set data input to 1
    #10; // Wait for clock edge
    if (q_out !== 1) begin
      $display("FAIL: q_out did not update to d_in after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule