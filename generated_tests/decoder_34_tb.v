`timescale 1ns/1ps

module tb_decoder;

  reg [2:0] i;
  wire [7:0] out;
  
  // Instantiate the decoder module
  decoder uut (
    .i(i),
    .out(out)
  );

  initial begin
    // Test case 1: Input 000
    i = 3'b000; #10;
    if (out !== 8'b00000001) begin
      $display("FAIL: Test case 1 failed for input 000");
      $finish;
    end

    // Test case 2: Input 001
    i = 3'b001; #10;
    if (out !== 8'b00000010) begin
      $display("FAIL: Test case 2 failed for input 001");
      $finish;
    end

    // Test case 3: Input 010
    i = 3'b010; #10;
    if (out !== 8'b00000100) begin
      $display("FAIL: Test case 3 failed for input 010");
      $finish;
    end

    // Test case 4: Input 011
    i = 3'b011; #10;
    if (out !== 8'b00001000) begin
      $display("FAIL: Test case 4 failed for input 011");
      $finish;
    end

    // Test case 5: Input 100
    i = 3'b100; #10;
    if (out !== 8'b00010000) begin
      $display("FAIL: Test case 5 failed for input 100");
      $finish;
    end

    // Test case 6: Input 101
    i = 3'b101; #10;
    if (out !== 8'b00100000) begin
      $display("FAIL: Test case 6 failed for input 101");
      $finish;
    end

    // Test case 7: Input 110
    i = 3'b110; #10;
    if (out !== 8'b01000000) begin
      $display("FAIL: Test case 7 failed for input 110");
      $finish;
    end

    // Test case 8: Input 111
    i = 3'b111; #10;
    if (out !== 8'b10000000) begin
      $display("FAIL: Test case 8 failed for input 111");
      $finish;
    end

    // Test case 9: Default case (not a valid input)
    i = 3'bxxx; #10;
    if (out !== 8'b00000000) begin
      $display("FAIL: Default case failed for input xxx");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule