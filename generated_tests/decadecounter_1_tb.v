`timescale 1ns/1ps

module tb_decadecounter;

  reg en;
  reg clock;
  wire [3:0] count;

  // Instantiate the module under test (uut)
  decadecounter uut (
    .en(en),
    .clock(clock),
    .count(count)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize
    en = 0;
    #10; // Wait for some time

    // Enable counting
    en = 1;

    // Test counting from 0 to 9
    #10; // count should be 1
    if (count !== 4'd1) $display("FAIL: Expected count 1, got %d", count);

    #10; // count should be 2
    if (count !== 4'd2) $display("FAIL: Expected count 2, got %d", count);

    #10; // count should be 3
    if (count !== 4'd3) $display("FAIL: Expected count 3, got %d", count);

    #10; // count should be 4
    if (count !== 4'd4) $display("FAIL: Expected count 4, got %d", count);

    #10; // count should be 5
    if (count !== 4'd5) $display("FAIL: Expected count 5, got %d", count);

    #10; // count should be 6
    if (count !== 4'd6) $display("FAIL: Expected count 6, got %d", count);

    #10; // count should be 7
    if (count !== 4'd7) $display("FAIL: Expected count 7, got %d", count);

    #10; // count should be 8
    if (count !== 4'd8) $display("FAIL: Expected count 8, got %d", count);

    #10; // count should be 9
    if (count !== 4'd9) $display("FAIL: Expected count 9, got %d", count);

    #10; // count should reset to 0
    if (count !== 4'd0) $display("FAIL: Expected count 0, got %d", count);

    // Disable counting
    en = 0;
    #10; // count should remain 0
    if (count !== 4'd0) $display("FAIL: Expected count 0, got %d", count);

    // Re-enable counting
    en = 1;
    #10; // count should be 1 again
    if (count !== 4'd1) $display("FAIL: Expected count 1, got %d", count);

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule