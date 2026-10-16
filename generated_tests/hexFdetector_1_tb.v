`timescale 1ns/1ps

module tb_hexFdetector;

  reg [3:0] hex_in;
  wire out_sigRed;
  wire out_sigGreen;

  // Instantiate the module under test (uut)
  hexFdetector uut (
    .hex_in(hex_in),
    .out_sigRed(out_sigRed),
    .out_sigGreen(out_sigGreen)
  );

  initial begin
    // Test case 1: Check for hex_in = 4'b1111
    hex_in = 4'b1111; 
    #10;
    if (out_sigRed !== 0 || out_sigGreen !== 1) begin
      $display("FAIL: Test case 1 failed for hex_in = 4'b1111");
      $finish;
    end

    // Test case 2: Check for hex_in = 4'b0000
    hex_in = 4'b0000; 
    #10;
    if (out_sigRed !== 1 || out_sigGreen !== 0) begin
      $display("FAIL: Test case 2 failed for hex_in = 4'b0000");
      $finish;
    end

    // Test case 3: Check for hex_in = 4'b0010
    hex_in = 4'b0010; 
    #10;
    if (out_sigRed !== 1 || out_sigGreen !== 0) begin
      $display("FAIL: Test case 3 failed for hex_in = 4'b0010");
      $finish;
    end

    // Test case 4: Check for hex_in = 4'b1110
    hex_in = 4'b1110; 
    #10;
    if (out_sigRed !== 1 || out_sigGreen !== 0) begin
      $display("FAIL: Test case 4 failed for hex_in = 4'b1110");
      $finish;
    end

    // Test case 5: Check for hex_in = 4'b1111 again
    hex_in = 4'b1111; 
    #10;
    if (out_sigRed !== 0 || out_sigGreen !== 1) begin
      $display("FAIL: Test case 5 failed for hex_in = 4'b1111");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule