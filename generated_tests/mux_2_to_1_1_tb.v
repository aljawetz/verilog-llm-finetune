`timescale 1ns/1ps

module tb_mux_2_to_1;

  reg [2:0] a;
  reg [2:0] b;
  reg sel;
  wire [2:0] y;

  // Instantiate the module under test (uut)
  mux_2_to_1 uut (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
  );

  initial begin
    // Test case 1: sel = 1, expect y = a
    a = 3'b101; b = 3'b010; sel = 1'b1;
    #10;
    if (y !== a) begin
      $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 2: sel = 0, expect y = b
    a = 3'b101; b = 3'b010; sel = 1'b0;
    #10;
    if (y !== b) begin
      $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    // Test case 3: sel = 1, different values for a
    a = 3'b111; b = 3'b000; sel = 1'b1;
    #10;
    if (y !== a) begin
      $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 4: sel = 0, different values for b
    a = 3'b111; b = 3'b001; sel = 1'b0;
    #10;
    if (y !== b) begin
      $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    // Test case 5: sel = 1, edge case
    a = 3'b000; b = 3'b111; sel = 1'b1;
    #10;
    if (y !== a) begin
      $display("FAIL: Test case 5 failed, expected y = %b, got y = %b", a, y);
      $finish;
    end

    // Test case 6: sel = 0, edge case
    a = 3'b000; b = 3'b111; sel = 1'b0;
    #10;
    if (y !== b) begin
      $display("FAIL: Test case 6 failed, expected y = %b, got y = %b", b, y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule