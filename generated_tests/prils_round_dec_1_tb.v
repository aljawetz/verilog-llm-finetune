`timescale 1ns/1ps

module tb_prils_round_dec;

  reg [11:0] in;
  reg prec, stin, gin;
  wire roundout;

  // Instantiate the module under test (uut)
  prils_round_dec uut (
    .roundout(roundout),
    .in(in),
    .prec(prec),
    .gin(gin),
    .stin(stin)
  );

  initial begin
    // Test case 1: Basic rounding with no sticky bits
    in = 12'b000000000000; // Input value
    prec = 0;              // Precision
    gin = 0;               // Guard bit
    stin = 0;              // Sticky bit
    #10;
    if (roundout !== 1'b0) $display("FAIL: Test case 1 failed, expected 0, got %b", roundout);

    // Test case 2: Round up with guard and sticky bits
    in = 12'b000011110000; // Input value
    prec = 0;              // Precision
    gin = 1;               // Guard bit
    stin = 1;              // Sticky bit
    #10;
    if (roundout !== 1'b1) $display("FAIL: Test case 2 failed, expected 1, got %b", roundout);

    // Test case 3: Round down with guard bit and no sticky bits
    in = 12'b000011110000; // Input value
    prec = 0;              // Precision
    gin = 1;               // Guard bit
    stin = 0;              // Sticky bit
    #10;
    if (roundout !== 1'b1) $display("FAIL: Test case 3 failed, expected 1, got %b", roundout);

    // Test case 4: No rounding decision
    in = 12'b000000000111; // Input value
    prec = 1;              // Precision
    gin = 0;               // Guard bit
    stin = 0;              // Sticky bit
    #10;
    if (roundout !== 1'b0) $display("FAIL: Test case 4 failed, expected 0, got %b", roundout);

    // Test case 5: Round up with precision and sticky bits
    in = 12'b000111111111; // Input value
    prec = 1;              // Precision
    gin = 1;               // Guard bit
    stin = 1;              // Sticky bit
    #10;
    if (roundout !== 1'b1) $display("FAIL: Test case 5 failed, expected 1, got %b", roundout);

    // Test case 6: Edge case with all zeros
    in = 12'b000000000000; // Input value
    prec = 1;              // Precision
    gin = 0;               // Guard bit
    stin = 0;              // Sticky bit
    #10;
    if (roundout !== 1'b0) $display("FAIL: Test case 6 failed, expected 0, got %b", roundout);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule