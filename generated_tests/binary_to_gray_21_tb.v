`timescale 1ns/1ps

module tb_binary_to_gray;

  reg [3:0] b;
  wire [3:0] g;
  
  // Instantiate the module under test (uut)
  binary_to_gray uut (
    .b(b),
    .g(g)
  );

  initial begin
    // Test case 1: 0000 -> 0000
    b = 4'b0000; #10;
    if (g !== 4'b0000) begin
      $display("FAIL: Test case 1 failed. Expected 0000, got %b", g);
      $finish;
    end

    // Test case 2: 0001 -> 0001
    b = 4'b0001; #10;
    if (g !== 4'b0001) begin
      $display("FAIL: Test case 2 failed. Expected 0001, got %b", g);
      $finish;
    end

    // Test case 3: 0010 -> 0011
    b = 4'b0010; #10;
    if (g !== 4'b0011) begin
      $display("FAIL: Test case 3 failed. Expected 0011, got %b", g);
      $finish;
    end

    // Test case 4: 0011 -> 0010
    b = 4'b0011; #10;
    if (g !== 4'b0010) begin
      $display("FAIL: Test case 4 failed. Expected 0010, got %b", g);
      $finish;
    end

    // Test case 5: 0100 -> 0110
    b = 4'b0100; #10;
    if (g !== 4'b0110) begin
      $display("FAIL: Test case 5 failed. Expected 0110, got %b", g);
      $finish;
    end

    // Test case 6: 0101 -> 0111
    b = 4'b0101; #10;
    if (g !== 4'b0111) begin
      $display("FAIL: Test case 6 failed. Expected 0111, got %b", g);
      $finish;
    end

    // Test case 7: 0110 -> 0101
    b = 4'b0110; #10;
    if (g !== 4'b0101) begin
      $display("FAIL: Test case 7 failed. Expected 0101, got %b", g);
      $finish;
    end

    // Test case 8: 0111 -> 0100
    b = 4'b0111; #10;
    if (g !== 4'b0100) begin
      $display("FAIL: Test case 8 failed. Expected 0100, got %b", g);
      $finish;
    end

    // Test case 9: 1000 -> 1100
    b = 4'b1000; #10;
    if (g !== 4'b1100) begin
      $display("FAIL: Test case 9 failed. Expected 1100, got %b", g);
      $finish;
    end

    // Test case 10: 1111 -> 1000
    b = 4'b1111; #10;
    if (g !== 4'b1000) begin
      $display("FAIL: Test case 10 failed. Expected 1000, got %b", g);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule