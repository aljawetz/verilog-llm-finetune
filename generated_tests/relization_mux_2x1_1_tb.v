`timescale 1ns/1ps

module tb_relization_mux_2x1;

  // Inputs
  reg a;
  reg b;

  // Outputs
  wire output_and;
  wire output_or;
  wire output_not;

  // Instantiate the Unit Under Test (UUT)
  relization_mux_2x1 uut (
    .a(a),
    .b(b),
    .output_and(output_and),
    .output_or(output_or),
    .output_not(output_not)
  );

  initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (output_and !== 1'b0 || output_or !== 1'b0 || output_not !== 1'b1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (output_and !== 1'b0 || output_or !== 1'b1 || output_not !== 1'b1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (output_and !== 1'b0 || output_or !== 1'b1 || output_not !== 1'b0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (output_and !== 1'b1 || output_or !== 1'b1 || output_not !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule