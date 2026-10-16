`timescale 1ns/1ps

module tb_even_parity_generator;

  reg [7:0] data_in;
  wire parity;

  // Instantiate the module under test (uut)
  even_parity_generator uut (
    .data_in(data_in),
    .parity(parity)
  );

  initial begin
    // Test case 1: All zeros
    data_in = 8'b00000000; #10;
    if (parity !== 1'b0) $display("FAIL: Test case 1 failed, expected parity 0 for input 00000000");

    // Test case 2: All ones
    data_in = 8'b11111111; #10;
    if (parity !== 1'b1) $display("FAIL: Test case 2 failed, expected parity 1 for input 11111111");

    // Test case 3: One bit set
    data_in = 8'b00000001; #10;
    if (parity !== 1'b1) $display("FAIL: Test case 3 failed, expected parity 1 for input 00000001");

    // Test case 4: Two bits set
    data_in = 8'b00000011; #10;
    if (parity !== 1'b0) $display("FAIL: Test case 4 failed, expected parity 0 for input 00000011");

    // Test case 5: Three bits set
    data_in = 8'b00000111; #10;
    if (parity !== 1'b1) $display("FAIL: Test case 5 failed, expected parity 1 for input 00000111");

    // Test case 6: Four bits set
    data_in = 8'b00001111; #10;
    if (parity !== 1'b0) $display("FAIL: Test case 6 failed, expected parity 0 for input 00001111");

    // Test case 7: Five bits set
    data_in = 8'b00011111; #10;
    if (parity !== 1'b1) $display("FAIL: Test case 7 failed, expected parity 1 for input 00011111");

    // Test case 8: Random bits
    data_in = 8'b10101010; #10;
    if (parity !== 1'b0) $display("FAIL: Test case 8 failed, expected parity 0 for input 10101010");

    // Test case 9: Another random bits
    data_in = 8'b11001100; #10;
    if (parity !== 1'b0) $display("FAIL: Test case 9 failed, expected parity 0 for input 11001100");

    // Test case 10: Another random bits
    data_in = 8'b11110000; #10;
    if (parity !== 1'b1) $display("FAIL: Test case 10 failed, expected parity 1 for input 11110000");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule