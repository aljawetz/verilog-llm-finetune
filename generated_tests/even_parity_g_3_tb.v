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
    // Test case 1: All zeros (even number of 1s)
    in = 8'b00000000;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected parity 0 for input 00000000");
      $finish;
    end

    // Test case 2: One 1 (odd number of 1s)
    in = 8'b00000001;
    #10;
    if (parity !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected parity 1 for input 00000001");
      $finish;
    end

    // Test case 3: Two 1s (even number of 1s)
    in = 8'b00000011;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected parity 0 for input 00000011");
      $finish;
    end

    // Test case 4: Three 1s (odd number of 1s)
    in = 8'b00000111;
    #10;
    if (parity !== 1'b1) begin
      $display("FAIL: Test case 4 failed, expected parity 1 for input 00000111");
      $finish;
    end

    // Test case 5: Four 1s (even number of 1s)
    in = 8'b11110000;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 5 failed, expected parity 0 for input 11110000");
      $finish;
    end

    // Test case 6: Five 1s (odd number of 1s)
    in = 8'b11111000;
    #10;
    if (parity !== 1'b1) begin
      $display("FAIL: Test case 6 failed, expected parity 1 for input 11111000");
      $finish;
    end

    // Test case 7: Six 1s (even number of 1s)
    in = 8'b11111100;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 7 failed, expected parity 0 for input 11111100");
      $finish;
    end

    // Test case 8: Seven 1s (odd number of 1s)
    in = 8'b11111110;
    #10;
    if (parity !== 1'b1) begin
      $display("FAIL: Test case 8 failed, expected parity 1 for input 11111110");
      $finish;
    end

    // Test case 9: All ones (even number of 1s)
    in = 8'b11111111;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 9 failed, expected parity 0 for input 11111111");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule