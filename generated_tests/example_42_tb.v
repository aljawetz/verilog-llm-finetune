`timescale 1ns/1ps

module tb_example;

  reg [7:0] binValue;
  wire [7:0] asciiValue;

  // Instantiate the module under test (uut)
  example uut (
    .binValue(binValue),
    .asciiValue(asciiValue)
  );

  initial begin
    // Test cases
    // Test case 1: binValue = 1
    binValue = 1; #10;
    if (asciiValue !== "A") begin
      $display("FAIL: Expected 'A' for input 1, got %c", asciiValue);
      $finish;
    end

    // Test case 2: binValue = 2
    binValue = 2; #10;
    if (asciiValue !== "B") begin
      $display("FAIL: Expected 'B' for input 2, got %c", asciiValue);
      $finish;
    end

    // Test case 3: binValue = 3
    binValue = 3; #10;
    if (asciiValue !== "C") begin
      $display("FAIL: Expected 'C' for input 3, got %c", asciiValue);
      $finish;
    end

    // Test case 4: binValue = 4
    binValue = 4; #10;
    if (asciiValue !== "D") begin
      $display("FAIL: Expected 'D' for input 4, got %c", asciiValue);
      $finish;
    end

    // Test case 5: binValue = 0 (default case)
    binValue = 0; #10;
    if (asciiValue !== "E") begin
      $display("FAIL: Expected 'E' for input 0, got %c", asciiValue);
      $finish;
    end

    // Test case 6: binValue = 5 (default case)
    binValue = 5; #10;
    if (asciiValue !== "E") begin
      $display("FAIL: Expected 'E' for input 5, got %c", asciiValue);
      $finish;
    end

    // Test case 7: binValue = 255 (default case)
    binValue = 255; #10;
    if (asciiValue !== "E") begin
      $display("FAIL: Expected 'E' for input 255, got %c", asciiValue);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule