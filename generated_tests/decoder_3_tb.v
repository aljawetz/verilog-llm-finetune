`timescale 1ns/1ps

module tb_decoder;

  reg [2:0] a;
  wire [7:0] y;

  // Instantiate the module under test (uut)
  decoder uut (
    .a(a),
    .y(y)
  );

  initial begin
    // Test all possible inputs
    a = 3'b000; #10;
    if (y !== 8'b00000001) $display("FAIL: Test case a=000 failed, got y=%b", y);
    
    a = 3'b001; #10;
    if (y !== 8'b00000010) $display("FAIL: Test case a=001 failed, got y=%b", y);
    
    a = 3'b010; #10;
    if (y !== 8'b00000100) $display("FAIL: Test case a=010 failed, got y=%b", y);
    
    a = 3'b011; #10;
    if (y !== 8'b00001000) $display("FAIL: Test case a=011 failed, got y=%b", y);
    
    a = 3'b100; #10;
    if (y !== 8'b00010000) $display("FAIL: Test case a=100 failed, got y=%b", y);
    
    a = 3'b101; #10;
    if (y !== 8'b00100000) $display("FAIL: Test case a=101 failed, got y=%b", y);
    
    a = 3'b110; #10;
    if (y !== 8'b01000000) $display("FAIL: Test case a=110 failed, got y=%b", y);
    
    a = 3'b111; #10;
    if (y !== 8'b10000000) $display("FAIL: Test case a=111 failed, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule