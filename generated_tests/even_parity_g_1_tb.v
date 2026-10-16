`timescale 1ns/1ps

module tb_even_parity_g;

  reg [7:0] in;
  wire parity;

  // Instantiate the module under test (uut)
  even_parity_g uut (
    .in(in),
    .parity(parity)
  );

  initial begin
    // Test case 1: All zeros
    in = 8'b00000000; #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected parity 0 for input 00000000");
      $finish;
    end

    // Test case 2: One bit set (odd number of 1s)
    in = 8'b00000001; #10;
    if (parity !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected parity 1 for input 00000001");
      $finish;
    end

    // Test case 3: Two bits set (even number of 1s)
    in = 8'b00000011; #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected parity 0 for input 00000011");
      $finish;
    end

    // Test case 4: Three bits set (odd number of 1s)
    in = 8'b00000111; #10;
    if (parity !== 1'b1) begin
      $display("FAIL: Test case 4 failed, expected parity 1 for input 00000111");
      $finish;
    end

    // Test case 5: Four bits set (even number of 1s)
    in = 8'b00001111; #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 5 failed, expected parity 0 for input 00001111");
      $finish;
    end

    // Test case 6: Five bits set (odd number of 1s)
    in = 8'b00011111; #10;
    if (parity !== 1'b1) begin
      $display("FAIL: Test case 6 failed, expected parity 1 for input 00011111");
      $finish;
    end

    // Test case 7: All ones
    in = 8'b11111111; #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 7 failed, expected parity 0 for input 11111111");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule