`timescale 1ns/1ps

module tb_two2one;

  reg [7:0] a_i;
  reg [7:0] b_i;
  reg sel_i;
  wire [7:0] y_o;

  // Instantiate the module under test (uut)
  two2one uut (
    .a_i(a_i),
    .b_i(b_i),
    .sel_i(sel_i),
    .y_o(y_o)
  );

  initial begin
    // Test sequence
    // Test case 1: sel_i = 0, expect y_o = b_i
    a_i = 8'hAA; // 10101010
    b_i = 8'h55; // 01010101
    sel_i = 0;
    #10; // Wait for 10 time units
    if (y_o !== b_i) begin
      $display("FAIL: Test case 1 failed, expected %h but got %h", b_i, y_o);
      $finish;
    end

    // Test case 2: sel_i = 1, expect y_o = a_i
    sel_i = 1;
    #10; // Wait for 10 time units
    if (y_o !== a_i) begin
      $display("FAIL: Test case 2 failed, expected %h but got %h", a_i, y_o);
      $finish;
    end

    // Test case 3: Change inputs and test again
    a_i = 8'hFF; // 11111111
    b_i = 8'h00; // 00000000
    sel_i = 0;
    #10; // Wait for 10 time units
    if (y_o !== b_i) begin
      $display("FAIL: Test case 3 failed, expected %h but got %h", b_i, y_o);
      $finish;
    end

    sel_i = 1;
    #10; // Wait for 10 time units
    if (y_o !== a_i) begin
      $display("FAIL: Test case 4 failed, expected %h but got %h", a_i, y_o);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule