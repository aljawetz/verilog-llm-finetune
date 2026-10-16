`timescale 1ns/1ps

module tb_even_parity_checker;

  reg [7:0] data_in;
  reg parity_in;
  wire error;

  // Instantiate the module under test (uut)
  even_parity_checker uut (
    .data_in(data_in),
    .parity_in(parity_in),
    .error(error)
  );

  initial begin
    // Test case 1: Even parity (data = 8'b00000000, parity = 0)
    data_in = 8'b00000000; 
    parity_in = 1'b0; 
    #10;
    if (error !== 1'b0) $display("FAIL: Test case 1 failed (data = 0, parity = 0)");

    // Test case 2: Even parity (data = 8'b00000001, parity = 1)
    data_in = 8'b00000001; 
    parity_in = 1'b1; 
    #10;
    if (error !== 1'b0) $display("FAIL: Test case 2 failed (data = 1, parity = 1)");

    // Test case 3: Odd parity (data = 8'b00000001, parity = 0)
    data_in = 8'b00000001; 
    parity_in = 1'b0; 
    #10;
    if (error !== 1'b1) $display("FAIL: Test case 3 failed (data = 1, parity = 0)");

    // Test case 4: Even parity (data = 8'b11111111, parity = 1)
    data_in = 8'b11111111; 
    parity_in = 1'b1; 
    #10;
    if (error !== 1'b0) $display("FAIL: Test case 4 failed (data = 255, parity = 1)");

    // Test case 5: Odd parity (data = 8'b11111111, parity = 0)
    data_in = 8'b11111111; 
    parity_in = 1'b0; 
    #10;
    if (error !== 1'b1) $display("FAIL: Test case 5 failed (data = 255, parity = 0)");

    // Test case 6: Even parity (data = 8'b10101010, parity = 0)
    data_in = 8'b10101010; 
    parity_in = 1'b0; 
    #10;
    if (error !== 1'b0) $display("FAIL: Test case 6 failed (data = 170, parity = 0)");

    // Test case 7: Odd parity (data = 8'b10101010, parity = 1)
    data_in = 8'b10101010; 
    parity_in = 1'b1; 
    #10;
    if (error !== 1'b1) $display("FAIL: Test case 7 failed (data = 170, parity = 1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule