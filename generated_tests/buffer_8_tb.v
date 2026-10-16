`timescale 1ns/1ps

module tb_buffer;

  // Inputs
  reg a;

  // Outputs
  wire s;

  // Instantiate the Unit Under Test (UUT)
  buffer uut (
    .s(s),
    .a(a)
  );

  initial begin
    // Initialize Inputs
    a = 0;

    // Wait for global reset to finish
    #10;

    // Test case 1: Check output when input is 0
    a = 0;
    #10;
    if (s !== 0) begin
      $display("FAIL: Test case 1 failed, expected s=0, got s=%b", s);
      $finish;
    end

    // Test case 2: Check output when input is 1
    a = 1;
    #10;
    if (s !== 1) begin
      $display("FAIL: Test case 2 failed, expected s=1, got s=%b", s);
      $finish;
    end

    // Test case 3: Check output when input changes from 0 to 1
    a = 0;
    #10;
    if (s !== 0) begin
      $display("FAIL: Test case 3 failed, expected s=0, got s=%b", s);
      $finish;
    end
    a = 1;
    #10;
    if (s !== 1) begin
      $display("FAIL: Test case 3 failed, expected s=1, got s=%b", s);
      $finish;
    end

    // Test case 4: Check output when input changes from 1 to 0
    a = 1;
    #10;
    if (s !== 1) begin
      $display("FAIL: Test case 4 failed, expected s=1, got s=%b", s);
      $finish;
    end
    a = 0;
    #10;
    if (s !== 0) begin
      $display("FAIL: Test case 4 failed, expected s=0, got s=%b", s);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule