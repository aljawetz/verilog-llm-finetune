`timescale 1ns/1ps

module tb_twoby1mux;

  // Inputs
  reg [7:0] a_i;
  reg [7:0] b_i;
  reg sel_i;

  // Output
  wire [7:0] y_o;

  // Instantiate the Unit Under Test (UUT)
  twoby1mux uut (
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

    // Test case 1: sel_i = 0, expect y_o = a_i
    a_i = 8'b10101010; // a_i = 170
    b_i = 8'b01010101; // b_i = 85
    sel_i = 0;
    #10;
    if (y_o !== a_i) begin
      $display("FAIL: Test case 1 failed, expected y_o = %b, got y_o = %b", a_i, y_o);
      $finish;
    end

    // Test case 2: sel_i = 1, expect y_o = b_i
    sel_i = 1;
    #10;
    if (y_o !== b_i) begin
      $display("FAIL: Test case 2 failed, expected y_o = %b, got y_o = %b", b_i, y_o);
      $finish;
    end

    // Test case 3: Change inputs and test again
    a_i = 8'b11110000; // a_i = 240
    b_i = 8'b00001111; // b_i = 15
    sel_i = 0;
    #10;
    if (y_o !== a_i) begin
      $display("FAIL: Test case 3 failed, expected y_o = %b, got y_o = %b", a_i, y_o);
      $finish;
    end

    sel_i = 1;
    #10;
    if (y_o !== b_i) begin
      $display("FAIL: Test case 4 failed, expected y_o = %b, got y_o = %b", b_i, y_o);
      $finish;
    end

    // Test case 5: All zeros
    a_i = 8'b00000000;
    b_i = 8'b00000000;
    sel_i = 0;
    #10;
    if (y_o !== a_i) begin
      $display("FAIL: Test case 5 failed, expected y_o = %b, got y_o = %b", a_i, y_o);
      $finish;
    end

    sel_i = 1;
    #10;
    if (y_o !== b_i) begin
      $display("FAIL: Test case 6 failed, expected y_o = %b, got y_o = %b", b_i, y_o);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule