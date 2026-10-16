`timescale 1ns/1ps

module tb_not_op_7;
  reg [31:0] A;
  wire [31:0] Z;

  // Instantiate the module under test (uut)
  not_op_7 uut (
    .A(A),
    .Z(Z)
  );

  initial begin
    // Test case 1: All bits set to 0
    A = 32'h00000000; 
    #10;
    if (Z !== 32'hFFFFFFFF) begin
      $display("FAIL: Test case 1 failed. Expected Z = 32'hFFFFFFFF, got Z = %h", Z);
      $finish;
    end

    // Test case 2: All bits set to 1
    A = 32'hFFFFFFFF; 
    #10;
    if (Z !== 32'h00000000) begin
      $display("FAIL: Test case 2 failed. Expected Z = 32'h00000000, got Z = %h", Z);
      $finish;
    end

    // Test case 3: Alternating bits
    A = 32'hAAAAAAAA; 
    #10;
    if (Z !== 32'h55555555) begin
      $display("FAIL: Test case 3 failed. Expected Z = 32'h55555555, got Z = %h", Z);
      $finish;
    end

    // Test case 4: Random pattern
    A = 32'h12345678; 
    #10;
    if (Z !== 32'hEDCBA987) begin
      $display("FAIL: Test case 4 failed. Expected Z = 32'hEDCBA987, got Z = %h", Z);
      $finish;
    end

    // Test case 5: All bits set to 0x5A
    A = 32'h5A5A5A5A; 
    #10;
    if (Z !== 32'hA5A5A5A5) begin
      $display("FAIL: Test case 5 failed. Expected Z = 32'hA5A5A5A5, got Z = %h", Z);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule