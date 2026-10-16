`timescale 1ns/1ps

module tb_mealy_sequence_detector_nol;
  reg clk;
  reg rst;
  reg x;
  wire z;

  // Instantiate the module under test (uut)
  mealy_sequence_detector_nol uut (
    .clk(clk),
    .rst(rst),
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
    // Initialize signals
    rst = 0;
    x = 0;
    #10; // Wait for some time

    // Apply reset
    rst = 1;
    #10;

    // Test sequence: 1, 0, 0 (should detect and output z = 1)
    x = 1; #10; // State A -> B
    x = 0; #10; // State B -> C
    x = 0; #10; // State C -> D
    if (z !== 1) begin
      $display("FAIL: Expected z=1 after sequence 1,0,0");
      $finish;
    end

    // Test sequence: 1, 0, 1 (should not detect)
    x = 1; #10; // State D -> A
    if (z !== 0) begin
      $display("FAIL: Expected z=0 after sequence 1,0,1");
      $finish;
    end

    // Test sequence: 0, 0, 1 (should not detect)
    x = 0; #10; // State A -> A
    x = 0; #10; // State A -> A
    x = 1; #10; // State A -> B
    if (z !== 0) begin
      $display("FAIL: Expected z=0 after sequence 0,0,1");
      $finish;
    end

    // Test sequence: 1, 0, 0, 1, 0, 0 (should detect twice)
    x = 1; #10; // State A -> B
    x = 0; #10; // State B -> C
    x = 0; #10; // State C -> D
    if (z !== 1) begin
      $display("FAIL: Expected z=1 after sequence 1,0,0");
      $finish;
    end
    x = 1; #10; // State D -> A
    x = 0; #10; // State A -> A
    x = 0; #10; // State A -> A
    x = 1; #10; // State A -> B
    x = 0; #10; // State B -> C
    x = 0; #10; // State C -> D
    if (z !== 1) begin
      $display("FAIL: Expected z=1 after sequence 1,0,0 again");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule