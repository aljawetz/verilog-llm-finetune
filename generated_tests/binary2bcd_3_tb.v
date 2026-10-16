`timescale 1ns/1ps

module tb_binary2bcd;

  reg [7:0] binary;
  wire [11:0] bcd;
  
  // Instantiate the module under test (uut)
  binary2bcd uut (
    .binary(binary),
    .bcd(bcd)
  );

  initial begin
    // Test cases
    binary = 8'd0;   // 0 in binary
    #10;
    if (bcd !== 12'd0) $display("FAIL: Expected BCD for 0 is 0000 0000 0000, got %b", bcd);
    
    binary = 8'd9;   // 9 in binary
    #10;
    if (bcd !== 12'd9) $display("FAIL: Expected BCD for 9 is 0000 0000 1001, got %b", bcd);
    
    binary = 8'd10;  // 10 in binary
    #10;
    if (bcd !== 12'd10) $display("FAIL: Expected BCD for 10 is 0000 0001 0000, got %b", bcd);
    
    binary = 8'd99;  // 99 in binary
    #10;
    if (bcd !== 12'd99) $display("FAIL: Expected BCD for 99 is 0000 0000 1001 1001, got %b", bcd);
    
    binary = 8'd100; // 100 in binary
    #10;
    if (bcd !== 12'd100) $display("FAIL: Expected BCD for 100 is 0000 0001 0000 0000, got %b", bcd);
    
    binary = 8'd255; // 255 in binary
    #10;
    if (bcd !== 12'd255) $display("FAIL: Expected BCD for 255 is 0000 0010 0101 0101, got %b", bcd);
    
    $display("PASS");
    $finish;
  end

endmodule