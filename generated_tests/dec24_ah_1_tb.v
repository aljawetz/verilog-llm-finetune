`timescale 1ns/1ps

module tb_dec24_ah;

  reg i0;
  reg i1;
  wire o0;
  wire o1;
  wire o2;
  wire o3;

  // Instantiate the module under test (uut)
  dec24_ah uut (
    .i0(i0),
    .i1(i1),
    .o0(o0),
    .o1(o1),
    .o2(o2),
    .o3(o3)
  );

  initial begin
    // Test all combinations of i0 and i1
    // Test case 1: i0 = 0, i1 = 0
    i0 = 0; i1 = 0; #10;
    if (o0 !== 1 || o1 !== 0 || o2 !== 0 || o3 !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: i0 = 0, i1 = 1
    i0 = 0; i1 = 1; #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 1 || o3 !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: i0 = 1, i1 = 0
    i0 = 1; i1 = 0; #10;
    if (o0 !== 0 || o1 !== 1 || o2 !== 0 || o3 !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: i0 = 1, i1 = 1
    i0 = 1; i1 = 1; #10;
    if (o0 !== 0 || o1 !== 0 || o2 !== 0 || o3 !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule