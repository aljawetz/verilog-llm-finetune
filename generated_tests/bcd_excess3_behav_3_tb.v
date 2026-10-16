`timescale 1ns/1ps

module tb_bcd_excess3_behav;

  reg [3:0] a;
  wire [3:0] y;

  // Instantiate the module under test (uut)
  bcd_excess3_behav uut (
    .a(a),
    .y(y)
  );

  initial begin
    // Test cases
    a = 4'b0000; #10; 
    if (y !== 4'b0011) begin
      $display("FAIL: Input 0000, expected 0011, got %b", y);
      $finish;
    end

    a = 4'b0001; #10; 
    if (y !== 4'b0100) begin
      $display("FAIL: Input 0001, expected 0100, got %b", y);
      $finish;
    end

    a = 4'b0010; #10; 
    if (y !== 4'b0101) begin
      $display("FAIL: Input 0010, expected 0101, got %b", y);
      $finish;
    end

    a = 4'b0011; #10; 
    if (y !== 4'b0110) begin
      $display("FAIL: Input 0011, expected 0110, got %b", y);
      $finish;
    end

    a = 4'b0100; #10; 
    if (y !== 4'b0111) begin
      $display("FAIL: Input 0100, expected 0111, got %b", y);
      $finish;
    end

    a = 4'b0101; #10; 
    if (y !== 4'b1000) begin
      $display("FAIL: Input 0101, expected 1000, got %b", y);
      $finish;
    end

    a = 4'b0110; #10; 
    if (y !== 4'b1001) begin
      $display("FAIL: Input 0110, expected 1001, got %b", y);
      $finish;
    end

    a = 4'b0111; #10; 
    if (y !== 4'b1010) begin
      $display("FAIL: Input 0111, expected 1010, got %b", y);
      $finish;
    end

    a = 4'b1000; #10; 
    if (y !== 4'b1011) begin
      $display("FAIL: Input 1000, expected 1011, got %b", y);
      $finish;
    end

    a = 4'b1001; #10; 
    if (y !== 4'b1100) begin
      $display("FAIL: Input 1001, expected 1100, got %b", y);
      $finish;
    end

    a = 4'b1010; #10; 
    if (y !== 4'bxxxx) begin
      $display("FAIL: Input 1010, expected xxxx, got %b", y);
      $finish;
    end

    a = 4'b1111; #10; 
    if (y !== 4'bxxxx) begin
      $display("FAIL: Input 1111, expected xxxx, got %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule