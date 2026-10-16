`timescale 1ns/1ps

module tb_mux_2x1_Nbit;

  parameter N = 3;
  reg [N-1:0] w0;
  reg [N-1:0] w1;
  reg s;
  wire [N-1:0] o;

  // Instantiate the module under test (uut)
  mux_2x1_Nbit #(N) uut (
    .w0(w0),
    .w1(w1),
    .s(s),
    .o(o)
  );

  initial begin
    // Test case 1: Select w0
    w0 = 3'b101; // w0 = 5
    w1 = 3'b010; // w1 = 2
    s = 0;      // Select w0
    #10;        // Wait for 10 time units
    if (o !== w0) begin
      $display("FAIL: Test case 1 failed, expected %b but got %b", w0, o);
      $finish;
    end

    // Test case 2: Select w1
    s = 1;      // Select w1
    #10;        // Wait for 10 time units
    if (o !== w1) begin
      $display("FAIL: Test case 2 failed, expected %b but got %b", w1, o);
      $finish;
    end

    // Test case 3: Change inputs
    w0 = 3'b111; // w0 = 7
    w1 = 3'b000; // w1 = 0
    s = 0;      // Select w0
    #10;        // Wait for 10 time units
    if (o !== w0) begin
      $display("FAIL: Test case 3 failed, expected %b but got %b", w0, o);
      $finish;
    end

    // Test case 4: Select w1
    s = 1;      // Select w1
    #10;        // Wait for 10 time units
    if (o !== w1) begin
      $display("FAIL: Test case 4 failed, expected %b but got %b", w1, o);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule