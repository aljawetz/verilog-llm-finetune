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
    parity_in = 0; 
    #10;
    if (error !== 0) $display("FAIL: Test case 1 failed"); 

    // Test case 2: Even parity (data = 8'b00000001, parity = 1)
    data_in = 8'b00000001; 
    parity_in = 1; 
    #10;
    if (error !== 0) $display("FAIL: Test case 2 failed"); 

    // Test case 3: Odd parity (data = 8'b00000001, parity = 0)
    data_in = 8'b00000001; 
    parity_in = 0; 
    #10;
    if (error !== 1) $display("FAIL: Test case 3 failed"); 

    // Test case 4: Even parity (data = 8'b11111111, parity = 1)
    data_in = 8'b11111111; 
    parity_in = 1; 
    #10;
    if (error !== 0) $display("FAIL: Test case 4 failed"); 

    // Test case 5: Odd parity (data = 8'b11111111, parity = 0)
    data_in = 8'b11111111; 
    parity_in = 0; 
    #10;
    if (error !== 1) $display("FAIL: Test case 5 failed"); 

    // Test case 6: Even parity (data = 8'b10101010, parity = 0)
    data_in = 8'b10101010; 
    parity_in = 0; 
    #10;
    if (error !== 0) $display("FAIL: Test case 6 failed"); 

    // Test case 7: Odd parity (data = 8'b10101010, parity = 1)
    data_in = 8'b10101010; 
    parity_in = 1; 
    #10;
    if (error !== 1) $display("FAIL: Test case 7 failed"); 

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule