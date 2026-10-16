`timescale 1ns/1ps

module tb_encoder4_2;

  reg [3:0] d;
  wire a, b;

  // Instantiate the module under test
  encoder4_2 uut (
    .d(d),
    .a(a),
    .b(b)
  );

  initial begin
    // Test case 1: Input = 0001 (d = 4'b0001)
    d = 4'b0001; #10;
    if (a !== 1'b0 || b !== 1'b0) begin
      $display("FAIL: Test case 1 failed (input: 0001, output: %b%b)", a, b);
      $finish;
    end

    // Test case 2: Input = 0010 (d = 4'b0010)
    d = 4'b0010; #10;
    if (a !== 1'b0 || b !== 1'b1) begin
      $display("FAIL: Test case 2 failed (input: 0010, output: %b%b)", a, b);
      $finish;
    end

    // Test case 3: Input = 0100 (d = 4'b0100)
    d = 4'b0100; #10;
    if (a !== 1'b1 || b !== 1'b0) begin
      $display("FAIL: Test case 3 failed (input: 0100, output: %b%b)", a, b);
      $finish;
    end

    // Test case 4: Input = 1000 (d = 4'b1000)
    d = 4'b1000; #10;
    if (a !== 1'b1 || b !== 1'b1) begin
      $display("FAIL: Test case 4 failed (input: 1000, output: %b%b)", a, b);
      $finish;
    end

    // Test case 5: Input = 0000 (d = 4'b0000)
    d = 4'b0000; #10;
    if (a !== 1'b0 || b !== 1'b0) begin
      $display("FAIL: Test case 5 failed (input: 0000, output: %b%b)", a, b);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule