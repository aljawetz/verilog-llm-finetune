`timescale 1ns/1ps

module tb_add_8bit;

  reg [7:0] a;
  reg [7:0] b;
  wire [7:0] sum;

  // Instantiate the module under test (uut)
  add_8bit uut (
    .a(a),
    .b(b),
    .sum(sum)
  );

  initial begin
    // Test case 1: 0 + 0 = 0
    a = 8'b00000000; 
    b = 8'b00000000; 
    #10;
    if (sum !== 8'b00000000) begin
      $display("FAIL: Test case 1 failed (0 + 0)");
      $finish;
    end

    // Test case 2: 1 + 1 = 2
    a = 8'b00000001; 
    b = 8'b00000001; 
    #10;
    if (sum !== 8'b00000010) begin
      $display("FAIL: Test case 2 failed (1 + 1)");
      $finish;
    end

    // Test case 3: 255 + 1 = 0 (overflow)
    a = 8'b11111111; 
    b = 8'b00000001; 
    #10;
    if (sum !== 8'b00000000) begin
      $display("FAIL: Test case 3 failed (255 + 1)");
      $finish;
    end

    // Test case 4: 100 + 100 = 200
    a = 8'b01100100; 
    b = 8'b01100100; 
    #10;
    if (sum !== 8'b11001000) begin
      $display("FAIL: Test case 4 failed (100 + 100)");
      $finish;
    end

    // Test case 5: 50 + 50 = 100
    a = 8'b00110010; 
    b = 8'b00110010; 
    #10;
    if (sum !== 8'b01100100) begin
      $display("FAIL: Test case 5 failed (50 + 50)");
      $finish;
    end

    // Test case 6: 128 + 127 = 255
    a = 8'b10000000; 
    b = 8'b01111111; 
    #10;
    if (sum !== 8'b11111111) begin
      $display("FAIL: Test case 6 failed (128 + 127)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule