`timescale 1ns/1ps

module tb_encoder8_3;

  reg [7:0] d;
  wire [2:0] y;

  // Instantiate the module under test (uut)
  encoder8_3 uut (
    .d(d),
    .y(y)
  );

  initial begin
    // Test case 1: Input 0000_0001 should output 000
    d = 8'b0000_0001; #10;
    if (y !== 3'b000) begin
      $display("FAIL: Expected y=000 for d=0000_0001, got y=%b", y);
      $finish;
    end

    // Test case 2: Input 0000_0010 should output 001
    d = 8'b0000_0010; #10;
    if (y !== 3'b001) begin
      $display("FAIL: Expected y=001 for d=0000_0010, got y=%b", y);
      $finish;
    end

    // Test case 3: Input 0000_0100 should output 010
    d = 8'b0000_0100; #10;
    if (y !== 3'b010) begin
      $display("FAIL: Expected y=010 for d=0000_0100, got y=%b", y);
      $finish;
    end

    // Test case 4: Input 0000_1000 should output 011
    d = 8'b0000_1000; #10;
    if (y !== 3'b011) begin
      $display("FAIL: Expected y=011 for d=0000_1000, got y=%b", y);
      $finish;
    end

    // Test case 5: Input 0001_0000 should output 100
    d = 8'b0001_0000; #10;
    if (y !== 3'b100) begin
      $display("FAIL: Expected y=100 for d=0001_0000, got y=%b", y);
      $finish;
    end

    // Test case 6: Input 0010_0000 should output 101
    d = 8'b0010_0000; #10;
    if (y !== 3'b101) begin
      $display("FAIL: Expected y=101 for d=0010_0000, got y=%b", y);
      $finish;
    end

    // Test case 7: Input 0100_0000 should output 110
    d = 8'b0100_0000; #10;
    if (y !== 3'b110) begin
      $display("FAIL: Expected y=110 for d=0100_0000, got y=%b", y);
      $finish;
    end

    // Test case 8: Input 1000_0000 should output 111
    d = 8'b1000_0000; #10;
    if (y !== 3'b111) begin
      $display("FAIL: Expected y=111 for d=1000_0000, got y=%b", y);
      $finish;
    end

    // Test case 9: Input 0000_0000 should output 000 (default case)
    d = 8'b0000_0000; #10;
    if (y !== 3'b000) begin
      $display("FAIL: Expected y=000 for d=0000_0000, got y=%b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule