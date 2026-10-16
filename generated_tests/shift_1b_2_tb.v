`timescale 1ns/1ps

module tb_shift_1b;

  reg i_shift;
  reg [31:0] i_data;
  wire [31:0] o_data;

  // Instantiate the module under test (uut)
  shift_1b uut (
    .i_shift(i_shift),
    .i_data(i_data),
    .o_data(o_data)
  );

  initial begin
    // Test case 1: Shift when i_shift is high
    i_shift = 1;
    i_data = 32'hA; // 0000 0000 0000 0000 0000 0000 0000 1010
    #10;
    if (o_data !== 32'h14) // Expected: 0000 0000 0000 0000 0000 0000 0010 1000
      $display("FAIL: Test case 1 failed, expected 0x14, got %h", o_data);

    // Test case 2: No shift when i_shift is low
    i_shift = 0;
    i_data = 32'hA; // 0000 0000 0000 0000 0000 0000 0000 1010
    #10;
    if (o_data !== 32'hA) // Expected: 0000 0000 0000 0000 0000 0000 0000 1010
      $display("FAIL: Test case 2 failed, expected 0xA, got %h", o_data);

    // Test case 3: Shift with a larger number
    i_shift = 1;
    i_data = 32'hFFFFFFFF; // All bits set
    #10;
    if (o_data !== 32'hFFFFFFFE) // Expected: 1111 1111 1111 1111 1111 1111 1111 1110
      $display("FAIL: Test case 3 failed, expected 0xFFFFFFFE, got %h", o_data);

    // Test case 4: Shift with zero
    i_shift = 1;
    i_data = 32'h0; // All bits cleared
    #10;
    if (o_data !== 32'h0) // Expected: 0000 0000 0000 0000 0000 0000 0000 0000
      $display("FAIL: Test case 4 failed, expected 0x0, got %h", o_data);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule