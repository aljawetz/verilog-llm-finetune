`timescale 1ns/1ps

module tb_barrel_shifter;

  reg [3:0] data;
  reg [1:0] shift_amt;
  reg dir;
  wire [3:0] shifted_output;

  // Instantiate the barrel shifter
  barrel_shifter uut (
    .data(data),
    .shift_amt(shift_amt),
    .dir(dir),
    .shifted_output(shifted_output)
  );

  initial begin
    // Test case 1: Shift left by 1
    data = 4'b1010; shift_amt = 2'b01; dir = 1'b0; #10;
    if (shifted_output !== 4'b0100) $display("FAIL: Test case 1 failed");
    
    // Test case 2: Shift left by 2
    data = 4'b1010; shift_amt = 2'b10; dir = 1'b0; #10;
    if (shifted_output !== 4'b1000) $display("FAIL: Test case 2 failed");
    
    // Test case 3: Shift left by 3
    data = 4'b1010; shift_amt = 2'b11; dir = 1'b0; #10;
    if (shifted_output !== 4'b0000) $display("FAIL: Test case 3 failed");
    
    // Test case 4: Shift right by 1
    data = 4'b1010; shift_amt = 2'b01; dir = 1'b1; #10;
    if (shifted_output !== 4'b0101) $display("FAIL: Test case 4 failed");
    
    // Test case 5: Shift right by 2
    data = 4'b1010; shift_amt = 2'b10; dir = 1'b1; #10;
    if (shifted_output !== 4'b0010) $display("FAIL: Test case 5 failed");
    
    // Test case 6: Shift right by 3
    data = 4'b1010; shift_amt = 2'b11; dir = 1'b1; #10;
    if (shifted_output !== 4'b0001) $display("FAIL: Test case 6 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule