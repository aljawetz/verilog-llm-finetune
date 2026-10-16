`timescale 1ns/1ps

module tb_cla_mod1;

  reg x;
  reg y;
  reg cin;
  wire s;
  wire cout;

  // Instantiate the module under test (uut)
  cla_mod1 uut (
    .x(x),
    .y(y),
    .cin(cin),
    .s(s),
    .cout(cout)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, cout = 0
    x = 0; y = 0; cin = 0;
    #10;
    if (s !== 0 || cout !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: 0 + 0 + 1 = 1, cout = 0
    x = 0; y = 0; cin = 1;
    #10;
    if (s !== 1 || cout !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: 0 + 1 + 0 = 1, cout = 0
    x = 0; y = 1; cin = 0;
    #10;
    if (s !== 1 || cout !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: 0 + 1 + 1 = 0, cout = 1
    x = 0; y = 1; cin = 1;
    #10;
    if (s !== 0 || cout !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: 1 + 0 + 0 = 1, cout = 0
    x = 1; y = 0; cin = 0;
    #10;
    if (s !== 1 || cout !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: 1 + 0 + 1 = 0, cout = 1
    x = 1; y = 0; cin = 1;
    #10;
    if (s !== 0 || cout !== 1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: 1 + 1 + 0 = 0, cout = 1
    x = 1; y = 1; cin = 0;
    #10;
    if (s !== 0 || cout !== 1) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: 1 + 1 + 1 = 1, cout = 1
    x = 1; y = 1; cin = 1;
    #10;
    if (s !== 1 || cout !== 1) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule