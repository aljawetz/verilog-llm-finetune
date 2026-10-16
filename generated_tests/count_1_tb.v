`timescale 1ns/1ps

module tb_count;

  reg clk;
  reg rst;
  reg load_i;
  reg [3:0] load_val_i;
  wire [3:0] count_o;

  // Instantiate the module under test (uut)
  count uut (
    .clk(clk),
    .rst(rst),
    .load_i(load_i),
    .load_val_i(load_val_i),
    .count_o(count_o)
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
    load_i = 0;
    load_val_i = 4'h0;

    // Release reset
    #10 rst = 0;

    // Test 1: Incrementing the counter
    #10;
    if (count_o !== 4'h0) $display("FAIL: Expected count_o = 0 after reset");

    // Increment to 5
    #50; // 5 clock cycles
    if (count_o !== 4'h5) $display("FAIL: Expected count_o = 5 after 5 increments");

    // Test 2: Load value
    load_val_i = 4'hA; // Load value 10
    load_i = 1; // Activate load
    #10 load_i = 0; // Deactivate load

    // Check if count_o is loaded with 10
    #10;
    if (count_o !== 4'hA) $display("FAIL: Expected count_o = 10 after loading");

    // Test 3: Increment after loading
    #20; // 2 clock cycles
    if (count_o !== 4'hC) $display("FAIL: Expected count_o = 12 after 2 increments from 10");

    // Test 4: Wrap around
    #20; // 2 clock cycles to reach 15
    if (count_o !== 4'hE) $display("FAIL: Expected count_o = 14 after 2 increments from 12");

    #10; // 1 clock cycle to reach 15
    if (count_o !== 4'hF) $display("FAIL: Expected count_o = 15 after incrementing from 14");

    // Test 5: Wrap to loaded value
    #10; // 1 clock cycle to wrap
    if (count_o !== 4'hA) $display("FAIL: Expected count_o = 10 after wrapping to loaded value");

    // Test 6: Reset functionality
    #10 rst = 1; // Assert reset
    #10 rst = 0; // Release reset
    if (count_o !== 4'h0) $display("FAIL: Expected count_o = 0 after reset");

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule