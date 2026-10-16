`timescale 1ns/1ps

module tb_btg;

  reg [3:0] b;
  wire [3:0] g;

  // Instantiate the module under test (uut)
  btg uut (
    .b(b),
    .g(g)
  );

  initial begin
    // Test cases
    b = 4'b0000; #10;
    if (g !== 4'b0000) begin
      $display("FAIL: Test case b=0000 failed, got g=%b", g);
      $finish;
    end

    b = 4'b0001; #10;
    if (g !== 4'b0001) begin
      $display("FAIL: Test case b=0001 failed, got g=%b", g);
      $finish;
    end

    b = 4'b0010; #10;
    if (g !== 4'b0011) begin
      $display("FAIL: Test case b=0010 failed, got g=%b", g);
      $finish;
    end

    b = 4'b0011; #10;
    if (g !== 4'b0010) begin
      $display("FAIL: Test case b=0011 failed, got g=%b", g);
      $finish;
    end

    b = 4'b0100; #10;
    if (g !== 4'b0110) begin
      $display("FAIL: Test case b=0100 failed, got g=%b", g);
      $finish;
    end

    b = 4'b0101; #10;
    if (g !== 4'b0111) begin
      $display("FAIL: Test case b=0101 failed, got g=%b", g);
      $finish;
    end

    b = 4'b0110; #10;
    if (g !== 4'b0101) begin
      $display("FAIL: Test case b=0110 failed, got g=%b", g);
      $finish;
    end

    b = 4'b0111; #10;
    if (g !== 4'b0100) begin
      $display("FAIL: Test case b=0111 failed, got g=%b", g);
      $finish;
    end

    b = 4'b1000; #10;
    if (g !== 4'b1100) begin
      $display("FAIL: Test case b=1000 failed, got g=%b", g);
      $finish;
    end

    b = 4'b1001; #10;
    if (g !== 4'b1101) begin
      $display("FAIL: Test case b=1001 failed, got g=%b", g);
      $finish;
    end

    b = 4'b1010; #10;
    if (g !== 4'b1111) begin
      $display("FAIL: Test case b=1010 failed, got g=%b", g);
      $finish;
    end

    b = 4'b1011; #10;
    if (g !== 4'b1110) begin
      $display("FAIL: Test case b=1011 failed, got g=%b", g);
      $finish;
    end

    b = 4'b1100; #10;
    if (g !== 4'b1010) begin
      $display("FAIL: Test case b=1100 failed, got g=%b", g);
      $finish;
    end

    b = 4'b1101; #10;
    if (g !== 4'b1011) begin
      $display("FAIL: Test case b=1101 failed, got g=%b", g);
      $finish;
    end

    b = 4'b1110; #10;
    if (g !== 4'b1001) begin
      $display("FAIL: Test case b=1110 failed, got g=%b", g);
      $finish;
    end

    b = 4'b1111; #10;
    if (g !== 4'b1000) begin
      $display("FAIL: Test case b=1111 failed, got g=%b", g);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule