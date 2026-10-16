`timescale 1ns/1ps

module tb_parity_generator;

  reg [7:0] in;
  wire parity_out;

  // Instantiate the module under test (uut)
  parity_generator uut (
    .in(in),
    .parity_out(parity_out)
  );

  initial begin
    // Test case 1: All zeros (even number of 1s)
    in = 8'b00000000; #10;
    if (parity_out !== 1'b1) $display("FAIL: Test case 1 failed, expected 1, got %b", parity_out);

    // Test case 2: One 1 (odd number of 1s)
    in = 8'b00000001; #10;
    if (parity_out !== 1'b0) $display("FAIL: Test case 2 failed, expected 0, got %b", parity_out);

    // Test case 3: Two 1s (even number of 1s)
    in = 8'b00000011; #10;
    if (parity_out !== 1'b1) $display("FAIL: Test case 3 failed, expected 1, got %b", parity_out);

    // Test case 4: Three 1s (odd number of 1s)
    in = 8'b00000111; #10;
    if (parity_out !== 1'b0) $display("FAIL: Test case 4 failed, expected 0, got %b", parity_out);

    // Test case 5: Four 1s (even number of 1s)
    in = 8'b00001111; #10;
    if (parity_out !== 1'b1) $display("FAIL: Test case 5 failed, expected 1, got %b", parity_out);

    // Test case 6: Five 1s (odd number of 1s)
    in = 8'b00011111; #10;
    if (parity_out !== 1'b0) $display("FAIL: Test case 6 failed, expected 0, got %b", parity_out);

    // Test case 7: Six 1s (even number of 1s)
    in = 8'b00111111; #10;
    if (parity_out !== 1'b1) $display("FAIL: Test case 7 failed, expected 1, got %b", parity_out);

    // Test case 8: Seven 1s (odd number of 1s)
    in = 8'b01111111; #10;
    if (parity_out !== 1'b0) $display("FAIL: Test case 8 failed, expected 0, got %b", parity_out);

    // Test case 9: All ones (odd number of 1s)
    in = 8'b11111111; #10;
    if (parity_out !== 1'b0) $display("FAIL: Test case 9 failed, expected 0, got %b", parity_out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule