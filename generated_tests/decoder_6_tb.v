`timescale 1ns/1ps

module tb_decoder;
  reg a;
  wire d0, d1;

  // Instantiate the decoder module
  decoder uut (
    .a(a),
    .d0(d0),
    .d1(d1)
  );

  initial begin
    // Test case 1: Check output when a is 0
    a = 1'b0; 
    #10; // Wait for 10 time units
    if (d0 !== 1'b1 || d1 !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected d0=1, d1=0 but got d0=%b, d1=%b", d0, d1);
      $finish;
    end

    // Test case 2: Check output when a is 1
    a = 1'b1; 
    #10; // Wait for 10 time units
    if (d0 !== 1'b0 || d1 !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected d0=0, d1=1 but got d0=%b, d1=%b", d0, d1);
      $finish;
    end

    // Test case 3: Check output when a is toggled back to 0
    a = 1'b0; 
    #10; // Wait for 10 time units
    if (d0 !== 1'b1 || d1 !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected d0=1, d1=0 but got d0=%b, d1=%b", d0, d1);
      $finish;
    end

    // Test case 4: Check output when a is toggled back to 1
    a = 1'b1; 
    #10; // Wait for 10 time units
    if (d0 !== 1'b0 || d1 !== 1'b1) begin
      $display("FAIL: Test case 4 failed, expected d0=0, d1=1 but got d0=%b, d1=%b", d0, d1);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule