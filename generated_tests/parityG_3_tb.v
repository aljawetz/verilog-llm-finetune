`timescale 1ns/1ps

module tb_parityG;

  reg [7:0] a;
  wire even_PG;

  // Instantiate the module under test (uut)
  parityG uut (
    .a(a),
    .even_PG(even_PG)
  );

  initial begin
    // Test case 1: All bits are 0 (even parity)
    a = 8'b00000000; #10;
    if (even_PG !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected even_PG = 0 for input 00000000");
      $finish;
    end

    // Test case 2: One bit set (odd parity)
    a = 8'b00000001; #10;
    if (even_PG !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected even_PG = 1 for input 00000001");
      $finish;
    end

    // Test case 3: Two bits set (even parity)
    a = 8'b00000011; #10;
    if (even_PG !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected even_PG = 0 for input 00000011");
      $finish;
    end

    // Test case 4: Three bits set (odd parity)
    a = 8'b00000111; #10;
    if (even_PG !== 1'b1) begin
      $display("FAIL: Test case 4 failed, expected even_PG = 1 for input 00000111");
      $finish;
    end

    // Test case 5: Four bits set (even parity)
    a = 8'b00001111; #10;
    if (even_PG !== 1'b0) begin
      $display("FAIL: Test case 5 failed, expected even_PG = 0 for input 00001111");
      $finish;
    end

    // Test case 6: Five bits set (odd parity)
    a = 8'b00011111; #10;
    if (even_PG !== 1'b1) begin
      $display("FAIL: Test case 6 failed, expected even_PG = 1 for input 00011111");
      $finish;
    end

    // Test case 7: Six bits set (even parity)
    a = 8'b00111111; #10;
    if (even_PG !== 1'b0) begin
      $display("FAIL: Test case 7 failed, expected even_PG = 0 for input 00111111");
      $finish;
    end

    // Test case 8: Seven bits set (odd parity)
    a = 8'b01111111; #10;
    if (even_PG !== 1'b1) begin
      $display("FAIL: Test case 8 failed, expected even_PG = 1 for input 01111111");
      $finish;
    end

    // Test case 9: All bits set (even parity)
    a = 8'b11111111; #10;
    if (even_PG !== 1'b0) begin
      $display("FAIL: Test case 9 failed, expected even_PG = 0 for input 11111111");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule