`timescale 1ns/1ps

module tb_tristate_buffer;

  // Inputs
  reg i;
  reg e;

  // Output
  wire o;

  // Instantiate the Unit Under Test (UUT)
  tristate_buffer uut (
    .i(i),
    .e(e),
    .o(o)
  );

  initial begin
    // Initialize Inputs
    i = 0;
    e = 0;

    // Test Case 1: Enable is low, output should follow input
    #10;
    i = 1; e = 0; // Set input to 1, enable to 0
    #10;
    if (o !== 1) begin
      $display("FAIL: Test Case 1 failed, expected output 1, got %b", o);
      $finish;
    end

    // Test Case 2: Enable is high, output should be high impedance
    #10;
    e = 1; // Set enable to 1
    #10;
    if (o !== 1'bz) begin
      $display("FAIL: Test Case 2 failed, expected output high impedance, got %b", o);
      $finish;
    end

    // Test Case 3: Enable is low again, output should follow input
    #10;
    e = 0; i = 0; // Set input to 0, enable to 0
    #10;
    if (o !== 0) begin
      $display("FAIL: Test Case 3 failed, expected output 0, got %b", o);
      $finish;
    end

    // Test Case 4: Change input while enabled
    #10;
    i = 1; // Set input to 1, enable remains 0
    #10;
    if (o !== 1) begin
      $display("FAIL: Test Case 4 failed, expected output 1, got %b", o);
      $finish;
    end

    // Test Case 5: Enable high again, output should be high impedance
    #10;
    e = 1; // Set enable to 1
    #10;
    if (o !== 1'bz) begin
      $display("FAIL: Test Case 5 failed, expected output high impedance, got %b", o);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule