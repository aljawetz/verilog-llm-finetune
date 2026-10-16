`timescale 1ns/1ps

module tb_even_parity_c;

  reg [7:0] in;
  reg parity;
  wire error;

  // Instantiate the module under test (uut)
  even_parity_c uut (
    .in(in),
    .parity(parity),
    .error(error)
  );

  initial begin
    // Test case 1: Even parity (0b00000000 + parity 0 -> no error)
    in = 8'b00000000; parity = 1'b0;
    #10;
    if (error !== 1'b0) $display("FAIL: Test case 1 failed (expected error = 0, got %b)", error);

    // Test case 2: Even parity (0b00000001 + parity 1 -> no error)
    in = 8'b00000001; parity = 1'b1;
    #10;
    if (error !== 1'b0) $display("FAIL: Test case 2 failed (expected error = 0, got %b)", error);

    // Test case 3: Odd parity (0b00000001 + parity 0 -> error)
    in = 8'b00000001; parity = 1'b0;
    #10;
    if (error !== 1'b1) $display("FAIL: Test case 3 failed (expected error = 1, got %b)", error);

    // Test case 4: Even parity (0b11111111 + parity 1 -> no error)
    in = 8'b11111111; parity = 1'b1;
    #10;
    if (error !== 1'b0) $display("FAIL: Test case 4 failed (expected error = 0, got %b)", error);

    // Test case 5: Odd parity (0b11111111 + parity 0 -> error)
    in = 8'b11111111; parity = 1'b0;
    #10;
    if (error !== 1'b1) $display("FAIL: Test case 5 failed (expected error = 1, got %b)", error);

    // Test case 6: Even parity (0b10101010 + parity 0 -> no error)
    in = 8'b10101010; parity = 1'b0;
    #10;
    if (error !== 1'b0) $display("FAIL: Test case 6 failed (expected error = 0, got %b)", error);

    // Test case 7: Odd parity (0b10101010 + parity 1 -> error)
    in = 8'b10101010; parity = 1'b1;
    #10;
    if (error !== 1'b1) $display("FAIL: Test case 7 failed (expected error = 1, got %b)", error);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule