`timescale 1ns/1ps

module tb_priority_encoder;

  reg [7:0] in;
  wire [2:0] out;

  // Instantiate the Unit Under Test (UUT)
  priority_encoder uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: Only the highest bit is set
    in = 8'b10000000; // Expect out = 3'b111
    #10;
    if (out !== 3'b111) begin
      $display("FAIL: Test case 1 failed, expected 3'b111, got %b", out);
      $finish;
    end

    // Test case 2: Second highest bit is set
    in = 8'b01000000; // Expect out = 3'b110
    #10;
    if (out !== 3'b110) begin
      $display("FAIL: Test case 2 failed, expected 3'b110, got %b", out);
      $finish;
    end

    // Test case 3: Middle bit is set
    in = 8'b00100000; // Expect out = 3'b101
    #10;
    if (out !== 3'b101) begin
      $display("FAIL: Test case 3 failed, expected 3'b101, got %b", out);
      $finish;
    end

    // Test case 4: Lower bit is set
    in = 8'b00000010; // Expect out = 3'b001
    #10;
    if (out !== 3'b001) begin
      $display("FAIL: Test case 4 failed, expected 3'b001, got %b", out);
      $finish;
    end

    // Test case 5: No bits are set
    in = 8'b00000000; // Expect out = 3'b000
    #10;
    if (out !== 3'b000) begin
      $display("FAIL: Test case 5 failed, expected 3'b000, got %b", out);
      $finish;
    end

    // Test case 6: Multiple bits set, highest priority should be taken
    in = 8'b11000000; // Expect out = 3'b111
    #10;
    if (out !== 3'b111) begin
      $display("FAIL: Test case 6 failed, expected 3'b111, got %b", out);
      $finish;
    end

    // Test case 7: Another multiple bits set
    in = 8'b00110000; // Expect out = 3'b101
    #10;
    if (out !== 3'b101) begin
      $display("FAIL: Test case 7 failed, expected 3'b101, got %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule