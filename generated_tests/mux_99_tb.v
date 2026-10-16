`timescale 1ns/1ps

module tb_mux;

  reg [1:0] d;
  reg s;
  wire y;

  // Instantiate the module under test (uut)
  mux uut (
    .d(d),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: s = 0, expect y = d[0]
    d = 2'b01; // d[0] = 1, d[1] = 0
    s = 0;
    #10;
    if (y !== d[0]) begin
      $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", d[0], y);
      $finish;
    end

    // Test case 2: s = 1, expect y = d[1]
    d = 2'b10; // d[0] = 0, d[1] = 1
    s = 1;
    #10;
    if (y !== d[1]) begin
      $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", d[1], y);
      $finish;
    end

    // Test case 3: s = 0, expect y = d[0]
    d = 2'b11; // d[0] = 1, d[1] = 1
    s = 0;
    #10;
    if (y !== d[0]) begin
      $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", d[0], y);
      $finish;
    end

    // Test case 4: s = 1, expect y = d[1]
    d = 2'b00; // d[0] = 0, d[1] = 0
    s = 1;
    #10;
    if (y !== d[1]) begin
      $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", d[1], y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule