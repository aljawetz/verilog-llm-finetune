`timescale 1ns/1ps

module tb_evenparitychecker;

  reg [7:0] data_in;
  reg parity_in;
  wire error;

  // Instantiate the module under test (uut)
  evenparitychecker uut (
    .data_in(data_in),
    .parity_in(parity_in),
    .error(error)
  );

  initial begin
    // Test case 1: Even parity (data = 8'b00000000, parity = 0)
    data_in = 8'b00000000; 
    parity_in = 0; 
    #10;
    if (error !== 0) $display("FAIL: Test case 1 failed (Expected error = 0, got %b)", error);

    // Test case 2: Even parity (data = 8'b00000001, parity = 1)
    data_in = 8'b00000001; 
    parity_in = 1; 
    #10;
    if (error !== 0) $display("FAIL: Test case 2 failed (Expected error = 0, got %b)", error);

    // Test case 3: Odd parity (data = 8'b00000001, parity = 0)
    data_in = 8'b00000001; 
    parity_in = 0; 
    #10;
    if (error !== 1) $display("FAIL: Test case 3 failed (Expected error = 1, got %b)", error);

    // Test case 4: Even parity (data = 8'b11111111, parity = 1)
    data_in = 8'b11111111; 
    parity_in = 1; 
    #10;
    if (error !== 0) $display("FAIL: Test case 4 failed (Expected error = 0, got %b)", error);

    // Test case 5: Odd parity (data = 8'b11111111, parity = 0)
    data_in = 8'b11111111; 
    parity_in = 0; 
    #10;
    if (error !== 1) $display("FAIL: Test case 5 failed (Expected error = 1, got %b)", error);

    // Test case 6: Even parity (data = 8'b10101010, parity = 0)
    data_in = 8'b10101010; 
    parity_in = 0; 
    #10;
    if (error !== 0) $display("FAIL: Test case 6 failed (Expected error = 0, got %b)", error);

    // Test case 7: Odd parity (data = 8'b10101010, parity = 1)
    data_in = 8'b10101010; 
    parity_in = 1; 
    #10;
    if (error !== 1) $display("FAIL: Test case 7 failed (Expected error = 1, got %b)", error);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule