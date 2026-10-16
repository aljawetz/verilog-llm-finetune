`timescale 1ns/1ps

module tb_Seven_segment_symbol;

  reg [3:0] Input_to_segment;
  reg Encrypt_on;
  wire [6:0] output_from_segment;

  // Instantiate the module under test (uut)
  Seven_segment_symbol uut (
    .Input_to_segment(Input_to_segment),
    .output_from_segment(output_from_segment),
    .Encrypt_on(Encrypt_on)
  );

  initial begin
    // Test case 1: Encrypt_on = 1
    Encrypt_on = 1;
    Input_to_segment = 4'b0000; #10;
    if (output_from_segment !== 7'b0101010) $display("FAIL: Test case 1 failed for Input 0");
    
    Input_to_segment = 4'b0001; #10;
    if (output_from_segment !== 7'b0001001) $display("FAIL: Test case 1 failed for Input 1");
    
    Input_to_segment = 4'b0010; #10;
    if (output_from_segment !== 7'b0110110) $display("FAIL: Test case 1 failed for Input 2");
    
    Input_to_segment = 4'b0011; #10;
    if (output_from_segment !== 7'b0110111) $display("FAIL: Test case 1 failed for Input 3");
    
    Input_to_segment = 4'b0100; #10;
    if (output_from_segment !== 7'b1100100) $display("FAIL: Test case 1 failed for Input 4");
    
    Input_to_segment = 4'b0101; #10;
    if (output_from_segment !== 7'b1000101) $display("FAIL: Test case 1 failed for Input 5");
    
    Input_to_segment = 4'b0110; #10;
    if (output_from_segment !== 7'b0010101) $display("FAIL: Test case 1 failed for Input 6");
    
    Input_to_segment = 4'b0111; #10;
    if (output_from_segment !== 7'b0111010) $display("FAIL: Test case 1 failed for Input 7");
    
    Input_to_segment = 4'b1000; #10;
    if (output_from_segment !== 7'b1000000) $display("FAIL: Test case 1 failed for Input 8");
    
    Input_to_segment = 4'b1001; #10;
    if (output_from_segment !== 7'b0000010) $display("FAIL: Test case 1 failed for Input 9");
    
    // Test case 2: Encrypt_on = 0
    Encrypt_on = 0;
    Input_to_segment = 4'b0000; #10;
    if (output_from_segment !== 7'b1000000) $display("FAIL: Test case 2 failed for Input 0");
    
    Input_to_segment = 4'b0001; #10;
    if (output_from_segment !== 7'b1001111) $display("FAIL: Test case 2 failed for Input 1");
    
    Input_to_segment = 4'b0010; #10;
    if (output_from_segment !== 7'b0100100) $display("FAIL: Test case 2 failed for Input 2");
    
    Input_to_segment = 4'b0011; #10;
    if (output_from_segment !== 7'b0110000) $display("FAIL: Test case 2 failed for Input 3");
    
    Input_to_segment = 4'b0100; #10;
    if (output_from_segment !== 7'b0011001) $display("FAIL: Test case 2 failed for Input 4");
    
    Input_to_segment = 4'b0101; #10;
    if (output_from_segment !== 7'b0010010) $display("FAIL: Test case 2 failed for Input 5");
    
    Input_to_segment = 4'b0110; #10;
    if (output_from_segment !== 7'b0000010) $display("FAIL: Test case 2 failed for Input 6");
    
    Input_to_segment = 4'b0111; #10;
    if (output_from_segment !== 7'b1111000) $display("FAIL: Test case 2 failed for Input 7");
    
    Input_to_segment = 4'b1000; #10;
    if (output_from_segment !== 7'b0000000) $display("FAIL: Test case 2 failed for Input 8");
    
    Input_to_segment = 4'b1001; #10;
    if (output_from_segment !== 7'b0010000) $display("FAIL: Test case 2 failed for Input 9");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule