`timescale 1ns/1ps

module tb_mux_2x1_nbit;

  parameter n = 3;
  reg [n-1:0] x0;
  reg [n-1:0] x1;
  reg s;
  wire [n-1:0] y;

  // Instantiate the module under test
  mux_2x1_nbit #(n) uut (
    .x0(x0),
    .x1(x1),
    .s(s),
    .y(y)
  );

  initial begin
    // Test case 1: Select x0
    x0 = 3'b000; x1 = 3'b111; s = 0; 
    #10;
    if (y !== x0) begin
      $display("FAIL: Test case 1 failed, expected %b, got %b", x0, y);
      $finish;
    end

    // Test case 2: Select x1
    x0 = 3'b000; x1 = 3'b111; s = 1; 
    #10;
    if (y !== x1) begin
      $display("FAIL: Test case 2 failed, expected %b, got %b", x1, y);
      $finish;
    end

    // Test case 3: Select x0 with different values
    x0 = 3'b101; x1 = 3'b010; s = 0; 
    #10;
    if (y !== x0) begin
      $display("FAIL: Test case 3 failed, expected %b, got %b", x0, y);
      $finish;
    end

    // Test case 4: Select x1 with different values
    x0 = 3'b101; x1 = 3'b010; s = 1; 
    #10;
    if (y !== x1) begin
      $display("FAIL: Test case 4 failed, expected %b, got %b", x1, y);
      $finish;
    end

    // Test case 5: Select x0 with all bits set
    x0 = 3'b111; x1 = 3'b000; s = 0; 
    #10;
    if (y !== x0) begin
      $display("FAIL: Test case 5 failed, expected %b, got %b", x0, y);
      $finish;
    end

    // Test case 6: Select x1 with all bits set
    x0 = 3'b111; x1 = 3'b000; s = 1; 
    #10;
    if (y !== x1) begin
      $display("FAIL: Test case 6 failed, expected %b, got %b", x1, y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule