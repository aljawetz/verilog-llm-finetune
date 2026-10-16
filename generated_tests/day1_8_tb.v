`timescale 1ns/1ps

module tb_day1;

  reg [7:0] a_i;
  reg [7:0] b_i;
  reg sel_i;
  wire [7:0] y_o;

  // Instantiate the module under test (uut)
  day1 uut (
    .a_i(a_i),
    .b_i(b_i),
    .sel_i(sel_i),
    .y_o(y_o)
  );

  initial begin
    // Test sequence
    // Test case 1: sel_i = 0, expect y_o = b_i
    a_i = 8'hAA; // 170 in decimal
    b_i = 8'h55; // 85 in decimal
    sel_i = 0;
    #10;
    if (y_o !== b_i) begin
      $display("FAIL: Test case 1 failed, expected %h but got %h", b_i, y_o);
      $finish;
    end

    // Test case 2: sel_i = 1, expect y_o = a_i
    sel_i = 1;
    #10;
    if (y_o !== a_i) begin
      $display("FAIL: Test case 2 failed, expected %h but got %h", a_i, y_o);
      $finish;
    end

    // Test case 3: sel_i = 0, different values
    a_i = 8'hFF; // 255 in decimal
    b_i = 8'h00; // 0 in decimal
    sel_i = 0;
    #10;
    if (y_o !== b_i) begin
      $display("FAIL: Test case 3 failed, expected %h but got %h", b_i, y_o);
      $finish;
    end

    // Test case 4: sel_i = 1, different values
    sel_i = 1;
    #10;
    if (y_o !== a_i) begin
      $display("FAIL: Test case 4 failed, expected %h but got %h", a_i, y_o);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule