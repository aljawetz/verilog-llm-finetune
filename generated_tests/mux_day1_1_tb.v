`timescale 1ns/1ps

module tb_mux_day1;

  reg [31:0] a_i;
  reg [31:0] b_i;
  reg sel_i;
  wire [31:0] y;

  // Instantiate the module under test (uut)
  mux_day1 uut (
    .a_i(a_i),
    .b_i(b_i),
    .sel_i(sel_i),
    .y(y)
  );

  initial begin
    // Test case 1: sel_i = 1, expect y = a_i
    a_i = 32'hA5A5A5A5; // Example value for a_i
    b_i = 32'h5A5A5A5A; // Example value for b_i
    sel_i = 1'b1;
    #10; // Wait for 10 time units
    if (y !== a_i) begin
      $display("FAIL: Test case 1 failed, expected y = %h, got y = %h", a_i, y);
      $finish;
    end

    // Test case 2: sel_i = 0, expect y = b_i
    sel_i = 1'b0;
    #10; // Wait for 10 time units
    if (y !== b_i) begin
      $display("FAIL: Test case 2 failed, expected y = %h, got y = %h", b_i, y);
      $finish;
    end

    // Test case 3: sel_i = 1, changing inputs
    a_i = 32'hFFFFFFFF; // New value for a_i
    b_i = 32'h00000000; // New value for b_i
    sel_i = 1'b1;
    #10; // Wait for 10 time units
    if (y !== a_i) begin
      $display("FAIL: Test case 3 failed, expected y = %h, got y = %h", a_i, y);
      $finish;
    end

    // Test case 4: sel_i = 0, changing inputs
    sel_i = 1'b0;
    #10; // Wait for 10 time units
    if (y !== b_i) begin
      $display("FAIL: Test case 4 failed, expected y = %h, got y = %h", b_i, y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule