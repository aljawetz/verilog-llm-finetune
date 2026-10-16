`timescale 1ns/1ps

module tb_day1;

  // Inputs
  reg [7:0] a_i;
  reg [7:0] b_i;
  reg sel_i;

  // Outputs
  wire [7:0] y_o;

  // Instantiate the Unit Under Test (UUT)
  day1 uut (
    .a_i(a_i),
    .b_i(b_i),
    .sel_i(sel_i),
    .y_o(y_o)
  );

  initial begin
    // Initialize Inputs
    a_i = 8'b00000000;
    b_i = 8'b00000000;
    sel_i = 0;

    // Test case 1: sel_i = 0, expect y_o = b_i
    a_i = 8'b10101010; // a_i value
    b_i = 8'b11001100; // b_i value
    sel_i = 0;        // Select b_i
    #10;              // Wait for 10 time units
    if (y_o !== b_i) begin
      $display("FAIL: Test case 1 failed, expected %b but got %b", b_i, y_o);
      $finish;
    end

    // Test case 2: sel_i = 1, expect y_o = a_i
    sel_i = 1;        // Select a_i
    #10;              // Wait for 10 time units
    if (y_o !== a_i) begin
      $display("FAIL: Test case 2 failed, expected %b but got %b", a_i, y_o);
      $finish;
    end

    // Test case 3: Change inputs
    a_i = 8'b11110000; // New a_i value
    b_i = 8'b00001111; // New b_i value
    sel_i = 0;        // Select b_i
    #10;              // Wait for 10 time units
    if (y_o !== b_i) begin
      $display("FAIL: Test case 3 failed, expected %b but got %b", b_i, y_o);
      $finish;
    end

    // Test case 4: sel_i = 1, expect y_o = a_i
    sel_i = 1;        // Select a_i
    #10;              // Wait for 10 time units
    if (y_o !== a_i) begin
      $display("FAIL: Test case 4 failed, expected %b but got %b", a_i, y_o);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule