`timescale 1ns/1ps

module tb_priorityencoder_8to3;

  // Inputs
  reg en;
  reg [7:0] i;

  // Outputs
  wire [2:0] y;

  // Instantiate the Unit Under Test (UUT)
  priorityencoder_8to3 uut (
    .en(en),
    .i(i),
    .y(y)
  );

  initial begin
    // Initialize Inputs
    en = 0;
    i = 8'b00000000;

    // Wait for global reset
    #10;

    // Test case 1: Enable with no active inputs
    en = 1; i = 8'b00000000; #10;
    if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected y=000, got y=%b", y);

    // Test case 2: Enable with the highest active input at position 7
    i = 8'b10000000; #10;
    if (y !== 3'b111) $display("FAIL: Test case 2 failed, expected y=111, got y=%b", y);

    // Test case 3: Enable with the highest active input at position 5
    i = 8'b00100000; #10;
    if (y !== 3'b101) $display("FAIL: Test case 3 failed, expected y=101, got y=%b", y);

    // Test case 4: Enable with the highest active input at position 2
    i = 8'b00000100; #10;
    if (y !== 3'b010) $display("FAIL: Test case 4 failed, expected y=010, got y=%b", y);

    // Test case 5: Disable the encoder
    en = 0; i = 8'b11111111; #10;
    if (y !== 3'bzzz) $display("FAIL: Test case 5 failed, expected y=zzz, got y=%b", y);

    // Test case 6: Enable with the highest active input at position 1
    en = 1; i = 8'b00000010; #10;
    if (y !== 3'b001) $display("FAIL: Test case 6 failed, expected y=001, got y=%b", y);

    // Test case 7: Enable with the highest active input at position 3
    i = 8'b00001000; #10;
    if (y !== 3'b011) $display("FAIL: Test case 7 failed, expected y=011, got y=%b", y);

    // Test case 8: Enable with all inputs active
    i = 8'b11111111; #10;
    if (y !== 3'b111) $display("FAIL: Test case 8 failed, expected y=111, got y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule