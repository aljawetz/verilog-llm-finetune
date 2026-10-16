`timescale 1ns/1ps

module tb_mealy_sequence_detector_ol;
  reg clk;
  reg rst_n;
  reg x;
  wire z;

  // Instantiate the module under test (uut)
  mealy_sequence_detector_ol uut (
    .clk(clk),
    .rst_n(rst_n),
    .x(x),
    .z(z)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst_n = 0;
    x = 0;

    // Apply reset
    #10;
    rst_n = 1;

    // Test sequence: A -> B -> C -> D
    // Input sequence: 1, 0, 1
    #10; x = 1; // State A to B
    #10; if (uut.state !== 4'h2) $display("FAIL: Expected state B, got %h", uut.state);
    #10; x = 0; // State B to C
    #10; if (uut.state !== 4'h3) $display("FAIL: Expected state C, got %h", uut.state);
    #10; x = 1; // State C to D
    #10; if (uut.state !== 4'h4) $display("FAIL: Expected state D, got %h", uut.state);
    #10; if (z !== 1) $display("FAIL: Expected output z=1, got z=%b", z);

    // Test sequence: D -> C -> B
    #10; x = 0; // State D to C
    #10; if (uut.state !== 4'h3) $display("FAIL: Expected state C, got %h", uut.state);
    #10; x = 0; // State C to A
    #10; if (uut.state !== 4'h1) $display("FAIL: Expected state A, got %h", uut.state);
    #10; x = 1; // State A to B
    #10; if (uut.state !== 4'h2) $display("FAIL: Expected state B, got %h", uut.state);

    // Final checks
    #10; if (z !== 0) $display("FAIL: Expected output z=0, got z=%b", z);

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule