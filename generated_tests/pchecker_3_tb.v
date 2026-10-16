`timescale 1ns/1ps

module tb_pchecker;

  reg [7:0] a;
  reg parity_in;
  wire error;

  // Instantiate the module under test (uut)
  pchecker uut (
    .a(a),
    .parity_in(parity_in),
    .error(error)
  );

  initial begin
    // Test case 1: Even parity with parity_in = 0
    a = 8'b00000000; // 0 ones, even parity
    parity_in = 0;
    #10;
    if (error !== 0) begin
      $display("FAIL: Test case 1 failed, expected error = 0, got error = %b", error);
      $finish;
    end

    // Test case 2: Odd parity with parity_in = 0
    a = 8'b00000001; // 1 one, odd parity
    parity_in = 0;
    #10;
    if (error !== 1) begin
      $display("FAIL: Test case 2 failed, expected error = 1, got error = %b", error);
      $finish;
    end

    // Test case 3: Even parity with parity_in = 1
    a = 8'b00000010; // 1 one, odd parity + 1 from parity_in = 1, even parity
    parity_in = 1;
    #10;
    if (error !== 0) begin
      $display("FAIL: Test case 3 failed, expected error = 0, got error = %b", error);
      $finish;
    end

    // Test case 4: Odd parity with parity_in = 1
    a = 8'b00000011; // 2 ones, even parity + 1 from parity_in = 1, odd parity
    parity_in = 1;
    #10;
    if (error !== 1) begin
      $display("FAIL: Test case 4 failed, expected error = 1, got error = %b", error);
      $finish;
    end

    // Test case 5: All bits set, even parity with parity_in = 0
    a = 8'b11111111; // 8 ones, even parity
    parity_in = 0;
    #10;
    if (error !== 0) begin
      $display("FAIL: Test case 5 failed, expected error = 0, got error = %b", error);
      $finish;
    end

    // Test case 6: All bits set, odd parity with parity_in = 1
    a = 8'b11111111; // 8 ones, even parity + 1 from parity_in = 1, odd parity
    parity_in = 1;
    #10;
    if (error !== 1) begin
      $display("FAIL: Test case 6 failed, expected error = 1, got error = %b", error);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule