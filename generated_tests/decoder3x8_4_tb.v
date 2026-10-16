`timescale 1ns/1ps

module tb_decoder3x8;

  reg [2:0] in;
  wire [7:0] out;

  // Instantiate the module under test (uut)
  decoder3x8 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test all possible input combinations
    in = 3'b000; #10;
    if (out !== 8'b00000001) $display("FAIL: Test case in=000 failed");
    
    in = 3'b001; #10;
    if (out !== 8'b00000010) $display("FAIL: Test case in=001 failed");
    
    in = 3'b010; #10;
    if (out !== 8'b00000100) $display("FAIL: Test case in=010 failed");
    
    in = 3'b011; #10;
    if (out !== 8'b00001000) $display("FAIL: Test case in=011 failed");
    
    in = 3'b100; #10;
    if (out !== 8'b00010000) $display("FAIL: Test case in=100 failed");
    
    in = 3'b101; #10;
    if (out !== 8'b00100000) $display("FAIL: Test case in=101 failed");
    
    in = 3'b110; #10;
    if (out !== 8'b01000000) $display("FAIL: Test case in=110 failed");
    
    in = 3'b111; #10;
    if (out !== 8'b10000000) $display("FAIL: Test case in=111 failed");

    // If all tests passed
    $display("PASS");
    $finish;
  end

endmodule