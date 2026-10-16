`timescale 1ns/1ps

module tb_return_xy;

  reg [3:0] idx; // 4 bits to cover indices 0-8
  wire [1:0] x_coord;
  wire [1:0] y_coord;

  // Instantiate the module under test (uut)
  return_xy uut (
    .idx(idx),
    .x_coord(x_coord),
    .y_coord(y_coord)
  );

  initial begin
    // Test all indices from 0 to 8
    idx = 0; #10;
    if (x_coord !== 2'b00 || y_coord !== 2'b00) $display("FAIL: Test idx=0 failed");
    
    idx = 1; #10;
    if (x_coord !== 2'b01 || y_coord !== 2'b00) $display("FAIL: Test idx=1 failed");
    
    idx = 2; #10;
    if (x_coord !== 2'b10 || y_coord !== 2'b00) $display("FAIL: Test idx=2 failed");
    
    idx = 3; #10;
    if (x_coord !== 2'b00 || y_coord !== 2'b01) $display("FAIL: Test idx=3 failed");
    
    idx = 4; #10;
    if (x_coord !== 2'b01 || y_coord !== 2'b01) $display("FAIL: Test idx=4 failed");
    
    idx = 5; #10;
    if (x_coord !== 2'b10 || y_coord !== 2'b01) $display("FAIL: Test idx=5 failed");
    
    idx = 6; #10;
    if (x_coord !== 2'b00 || y_coord !== 2'b10) $display("FAIL: Test idx=6 failed");
    
    idx = 7; #10;
    if (x_coord !== 2'b01 || y_coord !== 2'b10) $display("FAIL: Test idx=7 failed");
    
    idx = 8; #10;
    if (x_coord !== 2'b10 || y_coord !== 2'b10) $display("FAIL: Test idx=8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule