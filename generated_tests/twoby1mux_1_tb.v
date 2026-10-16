`timescale 1ns/1ps

module tb_twoby1mux;

  // Inputs
  reg [7:0] a_i;
  reg [7:0] b_i;
  reg sel_i;

  // Outputs
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
    a_i = 8'h00;
    b_i = 8'h00;
    sel_i = 1'b0;

    // Test Case 1: sel_i = 0, expect y_o = a_i
    a_i = 8'hAA; // 10101010
    b_i = 8'h55; // 01010101
    sel_i = 1'b0;
    #10;
    if (y_o !== a_i) begin
      $display("FAIL: Test Case 1 failed, expected y_o = %h, got y_o = %h", a_i, y_o);
      $finish;
    end

    // Test Case 2: sel_i = 1, expect y_o = b_i
    sel_i = 1'b1;
    #10;
    if (y_o !== b_i) begin
      $display("FAIL: Test Case 2 failed, expected y_o = %h, got y_o = %h", b_i, y_o);
      $finish;
    end

    // Test Case 3: Change inputs
    a_i = 8'hFF; // 11111111
    b_i = 8'h00; // 00000000
    sel_i = 1'b0;
    #10;
    if (y_o !== a_i) begin
      $display("FAIL: Test Case 3 failed, expected y_o = %h, got y_o = %h", a_i, y_o);
      $finish;
    end

    // Test Case 4: sel_i = 1, expect y_o = b_i
    sel_i = 1'b1;
    #10;
    if (y_o !== b_i) begin
      $display("FAIL: Test Case 4 failed, expected y_o = %h, got y_o = %h", b_i, y_o);
      $finish;
    end

    // Test Case 5: Random values
    a_i = 8'h7E; // 01111110
    b_i = 8'h81; // 10000001
    sel_i = 1'b0;
    #10;
    if (y_o !== a_i) begin
      $display("FAIL: Test Case 5 failed, expected y_o = %h, got y_o = %h", a_i, y_o);
      $finish;
    end

    sel_i = 1'b1;
    #10;
    if (y_o !== b_i) begin
      $display("FAIL: Test Case 5 failed, expected y_o = %h, got y_o = %h", b_i, y_o);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule