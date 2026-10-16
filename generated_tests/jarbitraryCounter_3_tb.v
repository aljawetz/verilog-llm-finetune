`timescale 1ns/1ps

module tb_jarbitraryCounter;

  reg clock;
  reg reset;
  wire [2:0] OUTPUT;

  // Instantiate the module under test
  jarbitraryCounter uut (
    .OUTPUT(OUTPUT),
    .clock(clock),
    .reset(reset)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    reset = 1; // Assert reset
    #10; // Wait for a clock cycle
    reset = 0; // Deassert reset

    // Check initial output
    if (OUTPUT !== 3'b000) begin
      $display("FAIL: Initial output is not 000");
      $finish;
    end

    // Test counting behavior
    #10; // Wait for 1 clock cycle
    if (OUTPUT !== 3'b001) begin
      $display("FAIL: Output is not 001 after 1 count");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (OUTPUT !== 3'b010) begin
      $display("FAIL: Output is not 010 after 2 counts");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (OUTPUT !== 3'b011) begin
      $display("FAIL: Output is not 011 after 3 counts");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (OUTPUT !== 3'b110) begin
      $display("FAIL: Output is not 110 after 4 counts");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (OUTPUT !== 3'b101) begin
      $display("FAIL: Output is not 101 after 5 counts");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (OUTPUT !== 3'b111) begin
      $display("FAIL: Output is not 111 after 6 counts");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (OUTPUT !== 3'b000) begin
      $display("FAIL: Output is not 000 after reset");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule