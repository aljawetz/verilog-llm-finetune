`timescale 1ns/1ps

module tb_or1;

  // Inputs
  reg a;
  reg b;
  reg c;

  // Outputs
  wire cout;

  // Instantiate the Unit Under Test (UUT)
  or1 uut (
    .a(a),
    .b(b),
    .c(c),
    .cout(cout)
  );

  initial begin
    // Test case 1: All inputs are 0
    a = 0; b = 0; c = 0;
    #10;
    if (cout !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected cout = 0, got cout = %b", cout);
      $finish;
    end

    // Test case 2: One input is 1
    a = 1; b = 0; c = 0;
    #10;
    if (cout !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected cout = 1, got cout = %b", cout);
      $finish;
    end

    // Test case 3: Two inputs are 1
    a = 1; b = 1; c = 0;
    #10;
    if (cout !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected cout = 1, got cout = %b", cout);
      $finish;
    end

    // Test case 4: All inputs are 1
    a = 1; b = 1; c = 1;
    #10;
    if (cout !== 1'b1) begin
      $display("FAIL: Test case 4 failed, expected cout = 1, got cout = %b", cout);
      $finish;
    end

    // Test case 5: Two inputs are 1, one is 0
    a = 0; b = 1; c = 1;
    #10;
    if (cout !== 1'b1) begin
      $display("FAIL: Test case 5 failed, expected cout = 1, got cout = %b", cout);
      $finish;
    end

    // Test case 6: One input is 1, two are 0
    a = 0; b = 0; c = 1;
    #10;
    if (cout !== 1'b1) begin
      $display("FAIL: Test case 6 failed, expected cout = 1, got cout = %b", cout);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule