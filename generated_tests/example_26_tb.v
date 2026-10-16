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
    binValue = 1; #10;
    if (asciiValue !== "A") begin
      $display("FAIL: Expected 'A' for input 1, got %c", asciiValue);
      $finish;
    end

    binValue = 2; #10;
    if (asciiValue !== "B") begin
      $display("FAIL: Expected 'B' for input 2, got %c", asciiValue);
      $finish;
    end

    binValue = 3; #10;
    if (asciiValue !== "C") begin
      $display("FAIL: Expected 'C' for input 3, got %c", asciiValue);
      $finish;
    end

    binValue = 4; #10;
    if (asciiValue !== "D") begin
      $display("FAIL: Expected 'D' for input 4, got %c", asciiValue);
      $finish;
    end

    binValue = 5; #10;
    if (asciiValue !== "E") begin
      $display("FAIL: Expected 'E' for input 5, got %c", asciiValue);
      $finish;
    end

    binValue = 0; #10;
    if (asciiValue !== "E") begin
      $display("FAIL: Expected 'E' for input 0, got %c", asciiValue);
      $finish;
    end

    binValue = 255; #10;
    if (asciiValue !== "E") begin
      $display("FAIL: Expected 'E' for input 255, got %c", asciiValue);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule