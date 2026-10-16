`timescale 1ns/1ps

module tb_bcd_to_excess3;

  // Inputs
  reg [3:0] in;

  // Outputs
  wire [3:0] out;

  // Instantiate the Unit Under Test (UUT)
  bcd_to_excess3 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: BCD input 0
    in = 4'b0000; // 0 in BCD
    #10;
    if (out !== 4'b0011) begin
      $display("FAIL: Expected 0011 for input 0000, got %b", out);
      $finish;
    end

    // Test case 2: BCD input 1
    in = 4'b0001; // 1 in BCD
    #10;
    if (out !== 4'b0100) begin
      $display("FAIL: Expected 0100 for input 0001, got %b", out);
      $finish;
    end

    // Test case 3: BCD input 2
    in = 4'b0010; // 2 in BCD
    #10;
    if (out !== 4'b0101) begin
      $display("FAIL: Expected 0101 for input 0010, got %b", out);
      $finish;
    end

    // Test case 4: BCD input 3
    in = 4'b0011; // 3 in BCD
    #10;
    if (out !== 4'b0110) begin
      $display("FAIL: Expected 0110 for input 0011, got %b", out);
      $finish;
    end

    // Test case 5: BCD input 4
    in = 4'b0100; // 4 in BCD
    #10;
    if (out !== 4'b0111) begin
      $display("FAIL: Expected 0111 for input 0100, got %b", out);
      $finish;
    end

    // Test case 6: BCD input 5
    in = 4'b0101; // 5 in BCD
    #10;
    if (out !== 4'b1000) begin
      $display("FAIL: Expected 1000 for input 0101, got %b", out);
      $finish;
    end

    // Test case 7: BCD input 6
    in = 4'b0110; // 6 in BCD
    #10;
    if (out !== 4'b1001) begin
      $display("FAIL: Expected 1001 for input 0110, got %b", out);
      $finish;
    end

    // Test case 8: BCD input 7
    in = 4'b0111; // 7 in BCD
    #10;
    if (out !== 4'b1010) begin
      $display("FAIL: Expected 1010 for input 0111, got %b", out);
      $finish;
    end

    // Test case 9: BCD input 8
    in = 4'b1000; // 8 in BCD
    #10;
    if (out !== 4'b1011) begin
      $display("FAIL: Expected 1011 for input 1000, got %b", out);
      $finish;
    end

    // Test case 10: BCD input 9
    in = 4'b1001; // 9 in BCD
    #10;
    if (out !== 4'b1100) begin
      $display("FAIL: Expected 1100 for input 1001, got %b", out);
      $finish;
    end

    // Test case 11: BCD input 10 (invalid)
    in = 4'b1010; // 10 in BCD
    #10;
    if (out !== 4'bzzzz) begin
      $display("FAIL: Expected zzzz for input 1010, got %b", out);
      $finish;
    end

    // Test case 12: BCD input 15 (invalid)
    in = 4'b1111; // 15 in BCD
    #10;
    if (out !== 4'bzzzz) begin
      $display("FAIL: Expected zzzz for input 1111, got %b", out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule