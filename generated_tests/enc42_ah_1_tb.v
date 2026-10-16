`timescale 1ns/1ps

module tb_enc42_ah;

  // Inputs
  reg i0;
  reg i1;
  reg i2;
  reg i3;

  // Outputs
  wire o0;
  wire o1;

  // Instantiate the Unit Under Test (UUT)
  enc42_ah uut (
    .i0(i0), 
    .i1(i1), 
    .i2(i2), 
    .i3(i3), 
    .o0(o0), 
    .o1(o1)
  );

  initial begin
    // Initialize Inputs
    i0 = 0; i1 = 0; i2 = 0; i3 = 0;

    // Test case 1: All inputs low
    #10;
    if (o0 !== 0 || o1 !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: i1 high
    i1 = 1; #10;
    if (o0 !== 1 || o1 !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: i2 high
    i1 = 0; i2 = 1; #10;
    if (o0 !== 0 || o1 !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: i3 high
    i2 = 0; i3 = 1; #10;
    if (o0 !== 1 || o1 !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: i0 high (should not affect outputs)
    i0 = 1; #10;
    if (o0 !== 1 || o1 !== 1) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: All inputs low again
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; #10;
    if (o0 !== 0 || o1 !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule