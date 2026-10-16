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
    // Test case 1: All bits are 0
    data_in = 8'b00000000;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 1 failed (data_in = %b, parity = %b)", data_in, parity);
      $finish;
    end

    // Test case 2: One bit set (odd number of 1s)
    data_in = 8'b00000001;
    #10;
    if (parity !== 1'b1) begin
      $display("FAIL: Test case 2 failed (data_in = %b, parity = %b)", data_in, parity);
      $finish;
    end

    // Test case 3: Two bits set (even number of 1s)
    data_in = 8'b00000011;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 3 failed (data_in = %b, parity = %b)", data_in, parity);
      $finish;
    end

    // Test case 4: Three bits set (odd number of 1s)
    data_in = 8'b00000111;
    #10;
    if (parity !== 1'b1) begin
      $display("FAIL: Test case 4 failed (data_in = %b, parity = %b)", data_in, parity);
      $finish;
    end

    // Test case 5: Four bits set (even number of 1s)
    data_in = 8'b00001111;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 5 failed (data_in = %b, parity = %b)", data_in, parity);
      $finish;
    end

    // Test case 6: Five bits set (odd number of 1s)
    data_in = 8'b00011111;
    #10;
    if (parity !== 1'b1) begin
      $display("FAIL: Test case 6 failed (data_in = %b, parity = %b)", data_in, parity);
      $finish;
    end

    // Test case 7: All bits set (even number of 1s)
    data_in = 8'b11111111;
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 7 failed (data_in = %b, parity = %b)", data_in, parity);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule