`timescale 1ns/1ps

module tb_and2_9bits;

  reg [8:0] a;
  reg [8:0] b;
  wire [8:0] c;

  // Instantiate the module under test (uut)
  and2_9bits uut (
    .a(a),
    .b(b),
    .c(c)
  );

  initial begin
    // Test case 1: Both inputs are zero
    a = 9'b000000000; 
    b = 9'b000000000; 
    #10;
    if (c !== 9'b000000000) $display("FAIL: Test case 1 failed");

    // Test case 2: One input is zero
    a = 9'b111111111; 
    b = 9'b000000000; 
    #10;
    if (c !== 9'b000000000) $display("FAIL: Test case 2 failed");

    // Test case 3: Both inputs are the same
    a = 9'b101010101; 
    b = 9'b101010101; 
    #10;
    if (c !== 9'b101010101) $display("FAIL: Test case 3 failed");

    // Test case 4: Different inputs
    a = 9'b110011001; 
    b = 9'b101010101; 
    #10;
    if (c !== 9'b100010001) $display("FAIL: Test case 4 failed");

    // Test case 5: All bits set
    a = 9'b111111111; 
    b = 9'b111111111; 
    #10;
    if (c !== 9'b111111111) $display("FAIL: Test case 5 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule