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
    // Initialize inputs
    a_i = 8'h00;
    b_i = 8'hFF;
    sel_i = 1'b0;

    // Test case 1: sel_i = 0, expect y_o = a_i
    a_i = 8'hAA; // Set a_i to 0xAA
    #10; // Wait for 10 time units
    if (y_o !== 8'hAA) begin
      $display("FAIL: Expected y_o = 0xAA, got y_o = %h", y_o);
      $finish;
    end

    // Test case 2: sel_i = 1, expect y_o = a_i (still)
    sel_i = 1'b1;
    #10; // Wait for 10 time units
    if (y_o !== 8'hAA) begin
      $display("FAIL: Expected y_o = 0xAA, got y_o = %h", y_o);
      $finish;
    end

    // Test case 3: Change a_i, sel_i = 0, expect y_o = a_i
    a_i = 8'h55; // Set a_i to 0x55
    sel_i = 1'b0;
    #10; // Wait for 10 time units
    if (y_o !== 8'h55) begin
      $display("FAIL: Expected y_o = 0x55, got y_o = %h", y_o);
      $finish;
    end

    // Test case 4: Change a_i, sel_i = 1, expect y_o = a_i (still)
    sel_i = 1'b1;
    #10; // Wait for 10 time units
    if (y_o !== 8'h55) begin
      $display("FAIL: Expected y_o = 0x55, got y_o = %h", y_o);
      $finish;
    end

    // Test case 5: sel_i = 0, a_i = 0x00
    a_i = 8'h00; // Set a_i to 0x00
    sel_i = 1'b0;
    #10; // Wait for 10 time units
    if (y_o !== 8'h00) begin
      $display("FAIL: Expected y_o = 0x00, got y_o = %h", y_o);
      $finish;
    end

    // Test case 6: sel_i = 1, a_i = 0x00
    sel_i = 1'b1;
    #10; // Wait for 10 time units
    if (y_o !== 8'h00) begin
      $display("FAIL: Expected y_o = 0x00, got y_o = %h", y_o);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule