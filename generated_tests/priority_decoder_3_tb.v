`timescale 1ns/1ps

module tb_priority_decoder;
  reg [2:0] i;
  wire [7:0] y;
  wire valid;

  // Instantiate the module under test (uut)
  priority_decoder uut (
    .i(i),
    .y(y),
    .valid(valid)
  );

  initial begin
    // Test case 1: Input 3'b111
    i = 3'b111; #10;
    if (y !== 8'b10000000 || valid !== 1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Input 3'b110
    i = 3'b110; #10;
    if (y !== 8'b01000000 || valid !== 1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Input 3'b101
    i = 3'b101; #10;
    if (y !== 8'b00100000 || valid !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Input 3'b100
    i = 3'b100; #10;
    if (y !== 8'b00010000 || valid !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Input 3'b011
    i = 3'b011; #10;
    if (y !== 8'b00001000 || valid !== 1) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Input 3'b010
    i = 3'b010; #10;
    if (y !== 8'b00000100 || valid !== 1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: Input 3'b001
    i = 3'b001; #10;
    if (y !== 8'b00000010 || valid !== 1) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: Input 3'b000
    i = 3'b000; #10;
    if (y !== 8'b00000001 || valid !== 1) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    // Test case 9: Input invalid case (default)
    i = 3'bxxx; #10; // Invalid input
    if (y !== 8'b00000000 || valid !== 0) begin
      $display("FAIL: Test case 9 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule