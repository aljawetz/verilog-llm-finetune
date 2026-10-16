`timescale 1ns/1ps

module tb_AND32_2x1;

  // Inputs
  reg [31:0] A;
  reg [31:0] B;

  // Outputs
  wire [31:0] Y;

  // Instantiate the Unit Under Test (UUT)
  AND32_2x1 uut (
    .Y(Y),
    .A(A),
    .B(B)
  );

  initial begin
    // Test case 1: A = 32'hFFFFFFFF, B = 32'hFFFFFFFF
    A = 32'hFFFFFFFF; 
    B = 32'hFFFFFFFF; 
    #10;
    if (Y !== 32'hFFFFFFFF) begin
      $display("FAIL: Test case 1 failed, expected 32'hFFFFFFFF, got %h", Y);
      $finish;
    end

    // Test case 2: A = 32'hFFFFFFFF, B = 32'h00000000
    A = 32'hFFFFFFFF; 
    B = 32'h00000000; 
    #10;
    if (Y !== 32'h00000000) begin
      $display("FAIL: Test case 2 failed, expected 32'h00000000, got %h", Y);
      $finish;
    end

    // Test case 3: A = 32'h00000000, B = 32'hFFFFFFFF
    A = 32'h00000000; 
    B = 32'hFFFFFFFF; 
    #10;
    if (Y !== 32'h00000000) begin
      $display("FAIL: Test case 3 failed, expected 32'h00000000, got %h", Y);
      $finish;
    end

    // Test case 4: A = 32'hA5A5A5A5, B = 32'h5A5A5A5A
    A = 32'hA5A5A5A5; 
    B = 32'h5A5A5A5A; 
    #10;
    if (Y !== 32'h00000000) begin
      $display("FAIL: Test case 4 failed, expected 32'h00000000, got %h", Y);
      $finish;
    end

    // Test case 5: A = 32'hFFFFFFFF, B = 32'hAAAAAAAA
    A = 32'hFFFFFFFF; 
    B = 32'hAAAAAAAA; 
    #10;
    if (Y !== 32'hAAAAAAAA) begin
      $display("FAIL: Test case 5 failed, expected 32'hAAAAAAAA, got %h", Y);
      $finish;
    end

    // Test case 6: A = 32'h00000000, B = 32'h00000000
    A = 32'h00000000; 
    B = 32'h00000000; 
    #10;
    if (Y !== 32'h00000000) begin
      $display("FAIL: Test case 6 failed, expected 32'h00000000, got %h", Y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule