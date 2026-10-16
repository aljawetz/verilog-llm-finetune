`timescale 1ns/1ps

module tb_enc4to2;

  reg [3:0] in;
  reg en;
  wire [1:0] y;

  // Instantiate the module under test
  enc4to2 uut (
    .in(in),
    .en(en),
    .y(y)
  );

  initial begin
    // Test case 1: Enable with valid input
    en = 1;
    in = 4'b0001; #10;
    if (y !== 2'b00) begin
      $display("FAIL: Expected y = 00 for in = 0001 when en = 1, got y = %b", y);
      $finish;
    end

    in = 4'b0010; #10;
    if (y !== 2'b01) begin
      $display("FAIL: Expected y = 01 for in = 0010 when en = 1, got y = %b", y);
      $finish;
    end

    in = 4'b0100; #10;
    if (y !== 2'b10) begin
      $display("FAIL: Expected y = 10 for in = 0100 when en = 1, got y = %b", y);
      $finish;
    end

    in = 4'b1000; #10;
    if (y !== 2'b11) begin
      $display("FAIL: Expected y = 11 for in = 1000 when en = 1, got y = %b", y);
      $finish;
    end

    // Test case 2: Enable with invalid input
    in = 4'b0011; #10; // Invalid one-hot input
    if (y !== 2'bzz) begin
      $display("FAIL: Expected y = zz for invalid one-hot input when en = 1, got y = %b", y);
      $finish;
    end

    // Test case 3: Disable the encoder
    en = 0; #10;
    if (y !== 2'bxx) begin
      $display("FAIL: Expected y = xx when en = 0, got y = %b", y);
      $finish;
    end

    // Test case 4: Enable again with valid input
    en = 1;
    in = 4'b0001; #10;
    if (y !== 2'b00) begin
      $display("FAIL: Expected y = 00 for in = 0001 when en = 1, got y = %b", y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule