`timescale 1ns/1ps

module tb_keyreg;

  // Testbench signals
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
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    shift = 0;
    key = 4'b0000;

    // Wait for a clock cycle
    #10;
    
    // Release reset
    reset = 0;

    // Test case 1: Shift in first key
    key = 4'b1010; // Key pressed
    shift = 1; // Trigger shift
    #10; // Wait for clock
    shift = 0; // Release shift
    #10;

    // Check results
    if (key_buffer_ls_min !== 4'b1010 || key_buffer_ms_min !== 4'b0000 || key_buffer_ls_hr !== 4'b0000 || key_buffer_ms_hr !== 4'b0000) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Shift in second key
    key = 4'b1100; // Key pressed
    shift = 1; // Trigger shift
    #10; // Wait for clock
    shift = 0; // Release shift
    #10;

    // Check results
    if (key_buffer_ls_min !== 4'b1100 || key_buffer_ms_min !== 4'b1010 || key_buffer_ls_hr !== 4'b0000 || key_buffer_ms_hr !== 4'b0000) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Shift in third key
    key = 4'b0011; // Key pressed
    shift = 1; // Trigger shift
    #10; // Wait for clock
    shift = 0; // Release shift
    #10;

    // Check results
    if (key_buffer_ls_min !== 4'b0011 || key_buffer_ms_min !== 4'b1100 || key_buffer_ls_hr !== 4'b1010 || key_buffer_ms_hr !== 4'b0000) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Shift in fourth key
    key = 4'b0110; // Key pressed
    shift = 1; // Trigger shift
    #10; // Wait for clock
    shift = 0; // Release shift
    #10;

    // Check results
    if (key_buffer_ls_min !== 4'b0110 || key_buffer_ms_min !== 4'b0011 || key_buffer_ls_hr !== 4'b1100 || key_buffer_ms_hr !== 4'b1010) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Reset the module
    reset = 1; // Trigger reset
    #10; // Wait for clock
    reset = 0; // Release reset
    #10;

    // Check results after reset
    if (key_buffer_ls_min !== 4'b0000 || key_buffer_ms_min !== 4'b0000 || key_buffer_ls_hr !== 4'b0000 || key_buffer_ms_hr !== 4'b0000) begin
      $display("FAIL: Reset test failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule