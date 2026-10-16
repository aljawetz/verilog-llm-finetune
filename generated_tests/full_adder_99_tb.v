`timescale 1ns/1ps

module tb_full_adder;

  reg rst;
  reg a, b, cin;
  wire sum, cout;

  // Instantiate the full_adder module
  full_adder uut (
    .rst(rst),
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    // Initialize inputs
    rst = 1;
    a = 0;
    b = 0;
    cin = 0;

    // Test reset functionality
    #10;
    if (sum !== 0 || cout !== 0) begin
      $display("FAIL: Reset did not set outputs to zero");
      $finish;
    end

    // Release reset
    rst = 0;

    // Test case 1: 0 + 0 + 0
    a = 0; b = 0; cin = 0;
    #10;
    if (sum !== 0 || cout !== 0) begin
      $display("FAIL: 0 + 0 + 0 did not produce correct outputs");
      $finish;
    end

    // Test case 2: 0 + 0 + 1
    a = 0; b = 0; cin = 1;
    #10;
    if (sum !== 1 || cout !== 0) begin
      $display("FAIL: 0 + 0 + 1 did not produce correct outputs");
      $finish;
    end

    // Test case 3: 0 + 1 + 0
    a = 0; b = 1; cin = 0;
    #10;
    if (sum !== 1 || cout !== 0) begin
      $display("FAIL: 0 + 1 + 0 did not produce correct outputs");
      $finish;
    end

    // Test case 4: 1 + 0 + 0
    a = 1; b = 0; cin = 0;
    #10;
    if (sum !== 1 || cout !== 0) begin
      $display("FAIL: 1 + 0 + 0 did not produce correct outputs");
      $finish;
    end

    // Test case 5: 1 + 1 + 0
    a = 1; b = 1; cin = 0;
    #10;
    if (sum !== 0 || cout !== 1) begin
      $display("FAIL: 1 + 1 + 0 did not produce correct outputs");
      $finish;
    end

    // Test case 6: 1 + 1 + 1
    a = 1; b = 1; cin = 1;
    #10;
    if (sum !== 1 || cout !== 1) begin
      $display("FAIL: 1 + 1 + 1 did not produce correct outputs");
      $finish;
    end

    // Test case 7: 0 + 1 + 1
    a = 0; b = 1; cin = 1;
    #10;
    if (sum !== 0 || cout !== 1) begin
      $display("FAIL: 0 + 1 + 1 did not produce correct outputs");
      $finish;
    end

    // Test case 8: 1 + 0 + 1
    a = 1; b = 0; cin = 1;
    #10;
    if (sum !== 0 || cout !== 1) begin
      $display("FAIL: 1 + 0 + 1 did not produce correct outputs");
      $finish;
    end

    // Test case 9: 1 + 1 + 0 with reset
    rst = 1;
    #10;
    if (sum !== 0 || cout !== 0) begin
      $display("FAIL: Reset did not set outputs to zero");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule