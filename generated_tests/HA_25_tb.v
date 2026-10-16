`timescale 1ns/1ps

module tb_HA;

  reg in1;
  reg in2;
  wire sum;
  wire carry;

  // Instantiate the Half Adder
  HA uut (
    .in1(in1),
    .in2(in2),
    .sum(sum),
    .carry(carry)
  );

  initial begin
    // Test case 1: in1 = 0, in2 = 0
    in1 = 0; in2 = 0;
    #10;
    if (sum !== 0 || carry !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: in1 = 0, in2 = 1
    in1 = 0; in2 = 1;
    #10;
    if (sum !== 1 || carry !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: in1 = 1, in2 = 0
    in1 = 1; in2 = 0;
    #10;
    if (sum !== 1 || carry !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: in1 = 1, in2 = 1
    in1 = 1; in2 = 1;
    #10;
    if (sum !== 0 || carry !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule