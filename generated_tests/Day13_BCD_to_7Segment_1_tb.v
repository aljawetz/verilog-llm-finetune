`timescale 1ns/1ps

module tb_Day13_BCD_to_7Segment;

  reg [3:0] BCD_num;
  wire [6:0] ss_code;

  // Instantiate the module under test (uut)
  Day13_BCD_to_7Segment uut (
    .BCD_num(BCD_num),
    .ss_code(ss_code)
  );

  initial begin
    // Test valid BCD inputs
    BCD_num = 4'b0000; // 0
    #10;
    if (ss_code !== 7'b0000001) $display("FAIL: Expected 0 for BCD 0, got %b", ss_code);

    BCD_num = 4'b0001; // 1
    #10;
    if (ss_code !== 7'b1001111) $display("FAIL: Expected 1 for BCD 1, got %b", ss_code);

    BCD_num = 4'b0010; // 2
    #10;
    if (ss_code !== 7'b0010010) $display("FAIL: Expected 2 for BCD 2, got %b", ss_code);

    BCD_num = 4'b0011; // 3
    #10;
    if (ss_code !== 7'b0000110) $display("FAIL: Expected 3 for BCD 3, got %b", ss_code);

    BCD_num = 4'b0100; // 4
    #10;
    if (ss_code !== 7'b1001100) $display("FAIL: Expected 4 for BCD 4, got %b", ss_code);

    BCD_num = 4'b0101; // 5
    #10;
    if (ss_code !== 7'b0100100) $display("FAIL: Expected 5 for BCD 5, got %b", ss_code);

    BCD_num = 4'b0110; // 6
    #10;
    if (ss_code !== 7'b0100000) $display("FAIL: Expected 6 for BCD 6, got %b", ss_code);

    BCD_num = 4'b0111; // 7
    #10;
    if (ss_code !== 7'b0001111) $display("FAIL: Expected 7 for BCD 7, got %b", ss_code);

    BCD_num = 4'b1000; // 8
    #10;
    if (ss_code !== 7'b0000000) $display("FAIL: Expected 8 for BCD 8, got %b", ss_code);

    BCD_num = 4'b1001; // 9
    #10;
    if (ss_code !== 7'b0000100) $display("FAIL: Expected 9 for BCD 9, got %b", ss_code);

    // Test invalid BCD inputs
    BCD_num = 4'b1010; // 10 (invalid)
    #10;
    if (ss_code !== 7'b1111111) $display("FAIL: Expected all segments off for BCD 10, got %b", ss_code);

    BCD_num = 4'b1111; // 15 (invalid)
    #10;
    if (ss_code !== 7'b1111111) $display("FAIL: Expected all segments off for BCD 15, got %b", ss_code);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule