`timescale 1ns/1ps

module tb_bin_onehot;

  reg [3:0] bin;
  wire [7:0] onehot;

  // Instantiate the module under test (uut)
  bin_onehot uut (
    .bin(bin),
    .onehot(onehot)
  );

  initial begin
    // Test case 1: bin = 0
    bin = 4'b0000; #10;
    if (onehot !== 8'b00000001) begin
      $display("FAIL: Expected onehot = 00000001 for bin = 0000, got %b", onehot);
      $finish;
    end

    // Test case 2: bin = 1
    bin = 4'b0001; #10;
    if (onehot !== 8'b00000010) begin
      $display("FAIL: Expected onehot = 00000010 for bin = 0001, got %b", onehot);
      $finish;
    end

    // Test case 3: bin = 2
    bin = 4'b0010; #10;
    if (onehot !== 8'b00000100) begin
      $display("FAIL: Expected onehot = 00000100 for bin = 0010, got %b", onehot);
      $finish;
    end

    // Test case 4: bin = 3
    bin = 4'b0011; #10;
    if (onehot !== 8'b00001000) begin
      $display("FAIL: Expected onehot = 00001000 for bin = 0011, got %b", onehot);
      $finish;
    end

    // Test case 5: bin = 4
    bin = 4'b0100; #10;
    if (onehot !== 8'b00010000) begin
      $display("FAIL: Expected onehot = 00010000 for bin = 0100, got %b", onehot);
      $finish;
    end

    // Test case 6: bin = 5
    bin = 4'b0101; #10;
    if (onehot !== 8'b00100000) begin
      $display("FAIL: Expected onehot = 00100000 for bin = 0101, got %b", onehot);
      $finish;
    end

    // Test case 7: bin = 6
    bin = 4'b0110; #10;
    if (onehot !== 8'b01000000) begin
      $display("FAIL: Expected onehot = 01000000 for bin = 0110, got %b", onehot);
      $finish;
    end

    // Test case 8: bin = 7
    bin = 4'b0111; #10;
    if (onehot !== 8'b10000000) begin
      $display("FAIL: Expected onehot = 10000000 for bin = 0111, got %b", onehot);
      $finish;
    end

    // Test case 9: bin = 8 (should be 0 since only 0-7 are valid)
    bin = 4'b1000; #10;
    if (onehot !== 8'b00000000) begin
      $display("FAIL: Expected onehot = 00000000 for bin = 1000, got %b", onehot);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule