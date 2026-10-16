`timescale 1ns/1ps

module tb_fadd;

  reg d, e, cin;
  wire s, cout;

  // Instantiate the full adder
  fadd uut (
    .s(s),
    .cout(cout),
    .d(d),
    .e(e),
    .cin(cin)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, cout = 0
    d = 0; e = 0; cin = 0;
    #10;
    if (s !== 0 || cout !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: 0 + 0 + 1 = 1, cout = 0
    d = 0; e = 0; cin = 1;
    #10;
    if (s !== 1 || cout !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: 0 + 1 + 0 = 1, cout = 0
    d = 0; e = 1; cin = 0;
    #10;
    if (s !== 1 || cout !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: 0 + 1 + 1 = 0, cout = 1
    d = 0; e = 1; cin = 1;
    #10;
    if (s !== 0 || cout !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: 1 + 0 + 0 = 1, cout = 0
    d = 1; e = 0; cin = 0;
    #10;
    if (s !== 1 || cout !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: 1 + 0 + 1 = 0, cout = 1
    d = 1; e = 0; cin = 1;
    #10;
    if (s !== 0 || cout !== 1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: 1 + 1 + 0 = 0, cout = 1
    d = 1; e = 1; cin = 0;
    #10;
    if (s !== 0 || cout !== 1) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: 1 + 1 + 1 = 1, cout = 1
    d = 1; e = 1; cin = 1;
    #10;
    if (s !== 1 || cout !== 1) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule