`timescale 1ns/1ps

module tb_encoder_behav;
  reg [7:0] y;
  wire [2:0] a;

  // Instantiate the module under test (uut)
  encoder_behav uut (
    .y(y),
    .a(a)
  );

  initial begin
    // Test case 1: Highest bit set (y = 8'b10000000)
    y = 8'b10000000; #10;
    if (a !== 3'b111) begin
      $display("FAIL: Expected a = 3'b111 for y = 8'b10000000, got a = %b", a);
      $finish;
    end

    // Test case 2: Second highest bit set (y = 8'b01000000)
    y = 8'b01000000; #10;
    if (a !== 3'b110) begin
      $display("FAIL: Expected a = 3'b110 for y = 8'b01000000, got a = %b", a);
      $finish;
    end

    // Test case 3: Middle bit set (y = 8'b00100000)
    y = 8'b00100000; #10;
    if (a !== 3'b101) begin
      $display("FAIL: Expected a = 3'b101 for y = 8'b00100000, got a = %b", a);
      $finish;
    end

    // Test case 4: Lower bit set (y = 8'b00000010)
    y = 8'b00000010; #10;
    if (a !== 3'b001) begin
      $display("FAIL: Expected a = 3'b001 for y = 8'b00000010, got a = %b", a);
      $finish;
    end

    // Test case 5: No bits set (y = 8'b00000000)
    y = 8'b00000000; #10;
    if (a !== 3'b000) begin
      $display("FAIL: Expected a = 3'b000 for y = 8'b00000000, got a = %b", a);
      $finish;
    end

    // Test case 6: Multiple bits set (y = 8'b11000000)
    y = 8'b11000000; #10;
    if (a !== 3'b111) begin
      $display("FAIL: Expected a = 3'b111 for y = 8'b11000000, got a = %b", a);
      $finish;
    end

    // Test case 7: Another multiple bits set (y = 8'b00110000)
    y = 8'b00110000; #10;
    if (a !== 3'b101) begin
      $display("FAIL: Expected a = 3'b101 for y = 8'b00110000, got a = %b", a);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule