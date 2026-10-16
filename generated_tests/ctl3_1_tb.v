`timescale 1ns/1ps

module tb_ctl3;

  // Inputs
  reg i_valid;
  reg i_inverse;

  // Outputs
  wire o_valid0;
  wire o_valid1;

  // Instantiate the Unit Under Test (UUT)
  ctl3 uut (
    .i_valid(i_valid),
    .i_inverse(i_inverse),
    .o_valid0(o_valid0),
    .o_valid1(o_valid1)
  );

  initial begin
    // Initialize Inputs
    i_valid = 0;
    i_inverse = 0;

    // Test Case 1: i_valid = 1, i_inverse = 0
    i_valid = 1; i_inverse = 0;
    #10;
    if (o_valid0 !== 1'b1 || o_valid1 !== 1'b0) begin
      $display("FAIL: Test Case 1 failed");
      $finish;
    end

    // Test Case 2: i_valid = 1, i_inverse = 1
    i_valid = 1; i_inverse = 1;
    #10;
    if (o_valid0 !== 1'b0 || o_valid1 !== 1'b1) begin
      $display("FAIL: Test Case 2 failed");
      $finish;
    end

    // Test Case 3: i_valid = 0, i_inverse = 0
    i_valid = 0; i_inverse = 0;
    #10;
    if (o_valid0 !== 1'b0 || o_valid1 !== 1'b0) begin
      $display("FAIL: Test Case 3 failed");
      $finish;
    end

    // Test Case 4: i_valid = 0, i_inverse = 1
    i_valid = 0; i_inverse = 1;
    #10;
    if (o_valid0 !== 1'b0 || o_valid1 !== 1'b0) begin
      $display("FAIL: Test Case 4 failed");
      $finish;
    end

    // Test Case 5: i_valid toggling with i_inverse = 0
    i_valid = 1; i_inverse = 0;
    #10;
    i_valid = 0; 
    #10;
    if (o_valid0 !== 1'b0 || o_valid1 !== 1'b0) begin
      $display("FAIL: Test Case 5 failed");
      $finish;
    end

    // Test Case 6: i_valid toggling with i_inverse = 1
    i_valid = 1; i_inverse = 1;
    #10;
    i_valid = 0; 
    #10;
    if (o_valid0 !== 1'b0 || o_valid1 !== 1'b0) begin
      $display("FAIL: Test Case 6 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule