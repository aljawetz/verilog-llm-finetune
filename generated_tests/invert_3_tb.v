`timescale 1ns/1ps

module tb_invert;

  reg b;
  wire ib;

  // Instantiate the module under test (uut)
  invert uut (
    .ib(ib),
    .b(b)
  );

  initial begin
    // Test sequence
    // Test case 1: b = 0
    b = 1'b0;
    #10; // Wait for 10 time units
    if (ib !== 1'b1) begin
      $display("FAIL: Test case 1 failed, expected ib = 1, got ib = %b", ib);
      $finish;
    end

    // Test case 2: b = 1
    b = 1'b1;
    #10; // Wait for 10 time units
    if (ib !== 1'b0) begin
      $display("FAIL: Test case 2 failed, expected ib = 0, got ib = %b", ib);
      $finish;
    end

    // Test case 3: b = 0 again
    b = 1'b0;
    #10; // Wait for 10 time units
    if (ib !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected ib = 1, got ib = %b", ib);
      $finish;
    end

    // Test case 4: b = 1 again
    b = 1'b1;
    #10; // Wait for 10 time units
    if (ib !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected ib = 0, got ib = %b", ib);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule