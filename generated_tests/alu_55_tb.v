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
    if (z !== 16'h0002 || sign !== 1'b0 || zero !== 1'b0 || carry !== 1'b0 || par !== 1'b0 || over !== 1'b0) 
      $display("FAIL: Test case 1 failed");
    
    // Test case 2: Addition resulting in carry
    x = 16'hFFFF; 
    y = 16'h0001; 
    #10;
    if (z !== 16'h0000 || sign !== 1'b0 || zero !== 1'b1 || carry !== 1'b1 || par !== 1'b1 || over !== 1'b0) 
      $display("FAIL: Test case 2 failed");
    
    // Test case 3: Addition resulting in overflow
    x = 16'h7FFF; 
    y = 16'h0001; 
    #10;
    if (z !== 16'h8000 || sign !== 1'b1 || zero !== 1'b0 || carry !== 1'b0 || par !== 1'b1 || over !== 1'b1) 
      $display("FAIL: Test case 3 failed");
    
    // Test case 4: Addition resulting in zero
    x = 16'h0000; 
    y = 16'h0000; 
    #10;
    if (z !== 16'h0000 || sign !== 1'b0 || zero !== 1'b1 || carry !== 1'b0 || par !== 1'b0 || over !== 1'b0) 
      $display("FAIL: Test case 4 failed");
    
    // Test case 5: Parity check
    x = 16'hAAAA; 
    y = 16'h5555; 
    #10;
    if (z !== 16'hFFFF || sign !== 1'b0 || zero !== 1'b0 || carry !== 1'b0 || par !== 1'b0 || over !== 1'b0) 
      $display("FAIL: Test case 5 failed");

    $display("PASS");
    $finish;
  end
endmodule