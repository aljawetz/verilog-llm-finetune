`timescale 1ns/1ps

module tb_alu;
  reg [15:0] x;
  reg [15:0] y;
  wire [15:0] z;
  wire sign;
  wire zero;
  wire carry;
  wire par;
  wire over;

  // Instantiate the ALU module
  alu uut (
    .x(x),
    .y(y),
    .z(z),
    .sign(sign),
    .zero(zero),
    .carry(carry),
    .par(par),
    .over(over)
  );

  initial begin
    // Test case 1: Simple addition without carry
    x = 16'h0001; 
    y = 16'h0001; 
    #10;
    if (z !== 16'h0002 || carry !== 1'b0 || sign !== 1'b0 || zero !== 1'b0 || par !== 1'b0 || over !== 1'b0) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: Addition resulting in carry
    x = 16'hFFFF; 
    y = 16'h0001; 
    #10;
    if (z !== 16'h0000 || carry !== 1'b1 || sign !== 1'b0 || zero !== 1'b1 || par !== 1'b1 || over !== 1'b0) 
      $display("FAIL: Test case 2 failed");
    
    // Test case 3: Addition resulting in overflow
    x = 16'h7FFF; 
    y = 16'h0001; 
    #10;
    if (z !== 16'h8000 || carry !== 1'b0 || sign !== 1'b1 || zero !== 1'b0 || par !== 1'b0 || over !== 1'b1) 
      $display("FAIL: Test case 3 failed");
    
    // Test case 4: Addition resulting in zero
    x = 16'h0000; 
    y = 16'h0000; 
    #10;
    if (z !== 16'h0000 || carry !== 1'b0 || sign !== 1'b0 || zero !== 1'b1 || par !== 1'b1 || over !== 1'b0) 
      $display("FAIL: Test case 4 failed");
    
    // Test case 5: Random values
    x = 16'h1234; 
    y = 16'h4321; 
    #10;
    if (z !== 16'h5555 || carry !== 1'b0 || sign !== 1'b0 || zero !== 1'b0 || par !== 1'b1 || over !== 1'b0) 
      $display("FAIL: Test case 5 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule