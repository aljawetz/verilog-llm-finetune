`timescale 1ns/1ps

module tb_barrel_shifter;

  reg [3:0] in;
  reg [1:0] shift;
  wire [3:0] out;

  // Instantiate the barrel shifter module
  barrel_shifter uut (
    .in(in),
    .shift(shift),
    .out(out)
  );

  initial begin
    // Test case 1: No shift
    in = 4'b1010; shift = 2'b00; #10;
    if (out !== 4'b1010) $display("FAIL: Test case 1 failed, expected 1010, got %b", out);

    // Test case 2: Shift right by 1
    in = 4'b1010; shift = 2'b01; #10;
    if (out !== 4'b0101) $display("FAIL: Test case 2 failed, expected 0101, got %b", out);

    // Test case 3: Shift right by 2
    in = 4'b1010; shift = 2'b10; #10;
    if (out !== 4'b1010) $display("FAIL: Test case 3 failed, expected 1010, got %b", out);

    // Test case 4: Shift right by 3
    in = 4'b1010; shift = 2'b11; #10;
    if (out !== 4'b0101) $display("FAIL: Test case 4 failed, expected 0101, got %b", out);

    // Test case 5: Different input
    in = 4'b1100; shift = 2'b00; #10;
    if (out !== 4'b1100) $display("FAIL: Test case 5 failed, expected 1100, got %b", out);
    
    // Test case 6: Shift right by 1
    in = 4'b1100; shift = 2'b01; #10;
    if (out !== 4'b0110) $display("FAIL: Test case 6 failed, expected 0110, got %b", out);
    
    // Test case 7: Shift right by 2
    in = 4'b1100; shift = 2'b10; #10;
    if (out !== 4'b0011) $display("FAIL: Test case 7 failed, expected 0011, got %b", out);
    
    // Test case 8: Shift right by 3
    in = 4'b1100; shift = 2'b11; #10;
    if (out !== 4'b1001) $display("FAIL: Test case 8 failed, expected 1001, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule