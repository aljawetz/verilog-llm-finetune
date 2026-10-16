`timescale 1ns/1ps

module tb_round_dec;

  reg [11:0] in;
  reg prec, stin, gin;
  wire roundout;

  // Instantiate the module under test
  round_dec uut (
    .roundout(roundout),
    .in(in),
    .prec(prec),
    .stin(stin),
    .gin(gin)
  );

  initial begin
    // Test case 1: Check rounding with guard bit set and sticky bit set
    in = 12'b000011111111; // g = 1, l = 1, sticky = 1
    prec = 0; 
    stin = 1; 
    gin = 1; 
    #10;
    if (roundout !== 1'b1) $display("FAIL: Test case 1 failed");

    // Test case 2: Check rounding with guard bit set and sticky bit not set
    in = 12'b000011111100; // g = 1, l = 1, sticky = 0
    prec = 0; 
    stin = 0; 
    gin = 1; 
    #10;
    if (roundout !== 1'b1) $display("FAIL: Test case 2 failed");

    // Test case 3: Check rounding with guard bit not set
    in = 12'b000011110000; // g = 0, l = 1, sticky = 0
    prec = 0; 
    stin = 0; 
    gin = 0; 
    #10;
    if (roundout !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: Check rounding with precision mode set
    in = 12'b111100000000; // g = 1, l = 0, sticky = 1
    prec = 1; 
    stin = 1; 
    gin = 0; 
    #10;
    if (roundout !== 1'b1) $display("FAIL: Test case 4 failed");

    // Test case 5: Check no rounding when all bits are zero
    in = 12'b000000000000; // g = 0, l = 0, sticky = 0
    prec = 0; 
    stin = 0; 
    gin = 0; 
    #10;
    if (roundout !== 1'b0) $display("FAIL: Test case 5 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule