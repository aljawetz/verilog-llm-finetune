`timescale 1ns/1ps

module tb_mux;

  reg [2:0] a;
  reg [2:0] b;
  reg s;
  wire [2:0] y;

  // Instantiate the module under test (uut)
  mux uut (
    .a(a),
    .b(b),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: Select input a
    a = 3'b101; // a = 5
    b = 3'b011; // b = 3
    s = 1'b0;   // select a
    #10;        // wait for 10 time units
    if (y !== a) begin
      $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 2: Select input b
    s = 1'b1;   // select b
    #10;        // wait for 10 time units
    if (y !== b) begin
      $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    // Test case 3: Change inputs
    a = 3'b000; // a = 0
    b = 3'b111; // b = 7
    s = 1'b0;   // select a
    #10;        // wait for 10 time units
    if (y !== a) begin
      $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 4: Change select to b
    s = 1'b1;   // select b
    #10;        // wait for 10 time units
    if (y !== b) begin
      $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    // Test case 5: Random values
    a = 3'b110; // a = 6
    b = 3'b001; // b = 1
    s = 1'b0;   // select a
    #10;        // wait for 10 time units
    if (y !== a) begin
      $display("FAIL: Test case 5 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    s = 1'b1;   // select b
    #10;        // wait for 10 time units
    if (y !== b) begin
      $display("FAIL: Test case 5 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule