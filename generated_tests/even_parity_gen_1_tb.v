`timescale 1ns/1ps

module tb_even_parity_gen;

  reg [7:0] data_in;
  wire parity;

  // Instantiate the module under test (uut)
  even_parity_gen uut (
    .data_in(data_in),
    .parity(parity)
  );

  initial begin
    // Test case 1: All bits are 0
    data_in = 8'b00000000; 
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected parity 0, got %b", parity);
      $finish;
    end

    // Test case 2: One bit is 1 (odd number of 1s)
    data_in = 8'b00000001; 
    #10;
    if (parity !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected parity 1, got %b", parity);
      $finish;
    end

    // Test case 3: Two bits are 1 (even number of 1s)
    data_in = 8'b00000011; 
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected parity 0, got %b", parity);
      $finish;
    end

    // Test case 4: Four bits are 1 (even number of 1s)
    data_in = 8'b11110000; 
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected parity 0, got %b", parity);
      $finish;
    end

    // Test case 5: Five bits are 1 (odd number of 1s)
    data_in = 8'b11111000; 
    #10;
    if (parity !== 1'b1) begin
      $display("FAIL: Test case 5 failed, expected parity 1, got %b", parity);
      $finish;
    end

    // Test case 6: All bits are 1
    data_in = 8'b11111111; 
    #10;
    if (parity !== 1'b0) begin
      $display("FAIL: Test case 6 failed, expected parity 0, got %b", parity);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule