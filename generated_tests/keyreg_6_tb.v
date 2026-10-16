`timescale 1ns/1ps

module tb_keyreg;

  reg reset;
  reg clock;
  reg shift;
  reg [3:0] key;
  wire [3:0] key_buffer_ls_min;
  wire [3:0] key_buffer_ms_min;
  wire [3:0] key_buffer_ls_hr;
  wire [3:0] key_buffer_ms_hr;

  // Instantiate the module under test (uut)
  keyreg uut (
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

  // Test procedure
  initial begin
    // Initialize signals
    reset = 1;
    shift = 0;
    key = 4'b0000;

    // Wait for a clock cycle
    #10;
    
    // Release reset
    reset = 0;
    
    // Test case 1: Shift with first key
    key = 4'b0001; shift = 1; #10;
    shift = 0; #10;
    if (key_buffer_ls_min !== 4'b0001 || key_buffer_ms_min !== 4'b0000 || 
        key_buffer_ls_hr !== 4'b0000 || key_buffer_ms_hr !== 4'b0000) 
      $display("FAIL: Test case 1 failed");

    // Test case 2: Shift with second key
    key = 4'b0010; shift = 1; #10;
    shift = 0; #10;
    if (key_buffer_ls_min !== 4'b0010 || key_buffer_ms_min !== 4'b0001 || 
        key_buffer_ls_hr !== 4'b0000 || key_buffer_ms_hr !== 4'b0000) 
      $display("FAIL: Test case 2 failed");

    // Test case 3: Shift with third key
    key = 4'b0011; shift = 1; #10;
    shift = 0; #10;
    if (key_buffer_ls_min !== 4'b0011 || key_buffer_ms_min !== 4'b0010 || 
        key_buffer_ls_hr !== 4'b0001 || key_buffer_ms_hr !== 4'b0000) 
      $display("FAIL: Test case 3 failed");

    // Test case 4: Shift with fourth key
    key = 4'b0100; shift = 1; #10;
    shift = 0; #10;
    if (key_buffer_ls_min !== 4'b0100 || key_buffer_ms_min !== 4'b0011 || 
        key_buffer_ls_hr !== 4'b0010 || key_buffer_ms_hr !== 4'b0001) 
      $display("FAIL: Test case 4 failed");

    // Test case 5: Reset functionality
    reset = 1; #10;
    reset = 0; #10;
    if (key_buffer_ls_min !== 4'b0000 || key_buffer_ms_min !== 4'b0000 || 
        key_buffer_ls_hr !== 4'b0000 || key_buffer_ms_hr !== 4'b0000) 
      $display("FAIL: Reset functionality failed");

    // Final check after reset
    key = 4'b1000; shift = 1; #10;
    shift = 0; #10;
    if (key_buffer_ls_min !== 4'b1000 || key_buffer_ms_min !== 4'b0000 || 
        key_buffer_ls_hr !== 4'b0000 || key_buffer_ms_hr !== 4'b0000) 
      $display("FAIL: Final check after reset failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule