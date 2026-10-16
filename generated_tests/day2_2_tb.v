`timescale 1ns/1ps

module tb_day2;

  reg [3:0] a_i;
  reg [3:0] b_i;
  reg sel_i;
  wire [3:0] y_o;

  // Instantiate the module under test (uut)
  day2 uut (
    .a_i(a_i),
    .b_i(b_i),
    .sel_i(sel_i),
    .y_o(y_o)
  );

  initial begin
    // Test case 1: sel_i = 0, expect y_o = b_i
    a_i = 4'b1010; 
    b_i = 4'b0101; 
    sel_i = 0; 
    #10;
    if (y_o !== b_i) begin
      $display("FAIL: Test case 1 failed, expected %b but got %b", b_i, y_o);
      $finish;
    end

    // Test case 2: sel_i = 1, expect y_o = a_i
    sel_i = 1; 
    #10;
    if (y_o !== a_i) begin
      $display("FAIL: Test case 2 failed, expected %b but got %b", a_i, y_o);
      $finish;
    end

    // Test case 3: Change inputs and test again
    a_i = 4'b1111; 
    b_i = 4'b0000; 
    sel_i = 0; 
    #10;
    if (y_o !== b_i) begin
      $display("FAIL: Test case 3 failed, expected %b but got %b", b_i, y_o);
      $finish;
    end

    sel_i = 1; 
    #10;
    if (y_o !== a_i) begin
      $display("FAIL: Test case 4 failed, expected %b but got %b", a_i, y_o);
      $finish;
    end

    // Test case 5: Random values
    a_i = 4'b1100; 
    b_i = 4'b0011; 
    sel_i = 0; 
    #10;
    if (y_o !== b_i) begin
      $display("FAIL: Test case 5 failed, expected %b but got %b", b_i, y_o);
      $finish;
    end

    sel_i = 1; 
    #10;
    if (y_o !== a_i) begin
      $display("FAIL: Test case 6 failed, expected %b but got %b", a_i, y_o);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule