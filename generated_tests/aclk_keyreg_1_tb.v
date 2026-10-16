`timescale 1ns/1ps

module tb_aclk_keyreg;

  // Inputs
  reg reset;
  reg clock;
  reg shift;
  reg [3:0] key;

  // Outputs
  wire [3:0] key_buffer_ls_min;
  wire [3:0] key_buffer_ms_min;
  wire [3:0] key_buffer_ls_hr;
  wire [3:0] key_buffer_ms_hr;

  // Instantiate the Unit Under Test (UUT)
  aclk_keyreg uut (
    .reset(reset),
    .clock(clock),
    .shift(shift),
    .key(key),
    .key_buffer_ls_min(key_buffer_ls_min),
    .key_buffer_ms_min(key_buffer_ms_min),
    .key_buffer_ls_hr(key_buffer_ls_hr),
    .key_buffer_ms_hr(key_buffer_ms_hr)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    shift = 0;
    key = 4'b0000;

    // Wait for a clock cycle
    #10;
    
    // Release reset
    reset = 0;
    
    // Test case 1: Shift in first key
    key = 4'b0001; shift = 1; #10;
    shift = 0; #10;
    if (key_buffer_ls_min !== 4'b0001 || key_buffer_ms_min !== 4'b0000 || key_buffer_ls_hr !== 4'b0000 || key_buffer_ms_hr !== 4'b0000) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Shift in second key
    key = 4'b0010; shift = 1; #10;
    shift = 0; #10;
    if (key_buffer_ls_min !== 4'b0010 || key_buffer_ms_min !== 4'b0001 || key_buffer_ls_hr !== 4'b0000 || key_buffer_ms_hr !== 4'b0000) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Shift in third key
    key = 4'b0011; shift = 1; #10;
    shift = 0; #10;
    if (key_buffer_ls_min !== 4'b0011 || key_buffer_ms_min !== 4'b0010 || key_buffer_ls_hr !== 4'b0001 || key_buffer_ms_hr !== 4'b0000) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Shift in fourth key
    key = 4'b0100; shift = 1; #10;
    shift = 0; #10;
    if (key_buffer_ls_min !== 4'b0100 || key_buffer_ms_min !== 4'b0011 || key_buffer_ls_hr !== 4'b0010 || key_buffer_ms_hr !== 4'b0001) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Reset the registers
    reset = 1; #10;
    reset = 0; #10;
    if (key_buffer_ls_min !== 4'b0000 || key_buffer_ms_min !== 4'b0000 || key_buffer_ls_hr !== 4'b0000 || key_buffer_ms_hr !== 4'b0000) begin
      $display("FAIL: Reset failed");
      $finish;
    end

    // Final test case: Shift in new keys after reset
    key = 4'b1000; shift = 1; #10;
    shift = 0; #10;
    if (key_buffer_ls_min !== 4'b1000 || key_buffer_ms_min !== 4'b0000 || key_buffer_ls_hr !== 4'b0000 || key_buffer_ms_hr !== 4'b0000) begin
      $display("FAIL: Test after reset failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule