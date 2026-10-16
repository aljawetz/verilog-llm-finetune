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
    a = 8'b00000000;
    #10;
    if (even_PG !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected even_PG = 0, got %b", even_PG);
      $finish;
    end

    // Test case 2: One bit set (odd parity)
    a = 8'b00000001;
    #10;
    if (even_PG !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected even_PG = 1, got %b", even_PG);
      $finish;
    end

    // Test case 3: Two bits set (even parity)
    a = 8'b00000011;
    #10;
    if (even_PG !== 1'b0) begin
      $display("FAIL: Test case 3 failed, expected even_PG = 0, got %b", even_PG);
      $finish;
    end

    // Test case 4: Three bits set (odd parity)
    a = 8'b00000111;
    #10;
    if (even_PG !== 1'b1) begin
      $display("FAIL: Test case 4 failed, expected even_PG = 1, got %b", even_PG);
      $finish;
    end

    // Test case 5: Four bits set (even parity)
    a = 8'b00001111;
    #10;
    if (even_PG !== 1'b0) begin
      $display("FAIL: Test case 5 failed, expected even_PG = 0, got %b", even_PG);
      $finish;
    end

    // Test case 6: Five bits set (odd parity)
    a = 8'b00011111;
    #10;
    if (even_PG !== 1'b1) begin
      $display("FAIL: Test case 6 failed, expected even_PG = 1, got %b", even_PG);
      $finish;
    end

    // Test case 7: All bits set (even parity)
    a = 8'b11111111;
    #10;
    if (even_PG !== 1'b0) begin
      $display("FAIL: Test case 7 failed, expected even_PG = 0, got %b", even_PG);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule