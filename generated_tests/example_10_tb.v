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
    // Test sequence
    binValue = 1; #10;
    if (asciiValue !== "A") begin
      $display("FAIL: Expected asciiValue to be 'A' for binValue 1");
      $finish;
    end

    binValue = 2; #10;
    if (asciiValue !== "B") begin
      $display("FAIL: Expected asciiValue to be 'B' for binValue 2");
      $finish;
    end

    binValue = 3; #10;
    if (asciiValue !== "C") begin
      $display("FAIL: Expected asciiValue to be 'C' for binValue 3");
      $finish;
    end

    binValue = 4; #10;
    if (asciiValue !== "D") begin
      $display("FAIL: Expected asciiValue to be 'D' for binValue 4");
      $finish;
    end

    binValue = 5; #10;
    if (asciiValue !== "E") begin
      $display("FAIL: Expected asciiValue to be 'E' for binValue 5");
      $finish;
    end

    // Additional test case for boundary check
    binValue = 0; #10;
    if (asciiValue !== "E") begin
      $display("FAIL: Expected asciiValue to be 'E' for binValue 0");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule