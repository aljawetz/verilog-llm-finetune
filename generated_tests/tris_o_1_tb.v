`timescale 1ns/1ps

module tb_tris_o;

  reg [7:0] in;
  reg [7:0] en;
  wire [7:0] out;

  // Instantiate the module under test (uut)
  tris_o uut (
    .in(in),
    .en(en),
    .out(out)
  );

  initial begin
    // Test case 1: Basic AND operation
    in = 8'b10101010; 
    en = 8'b11110000; 
    #10;
    if (out !== 8'b10100000) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: All bits enabled
    in = 8'b11111111; 
    en = 8'b11111111; 
    #10;
    if (out !== 8'b11111111) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: No bits enabled
    in = 8'b10101010; 
    en = 8'b00000000; 
    #10;
    if (out !== 8'b00000000) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Mixed bits
    in = 8'b11001100; 
    en = 8'b10101010; 
    #10;
    if (out !== 8'b10001000) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Edge case with all zeros
    in = 8'b00000000; 
    en = 8'b11111111; 
    #10;
    if (out !== 8'b00000000) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Edge case with all ones
    in = 8'b11111111; 
    en = 8'b00000000; 
    #10;
    if (out !== 8'b00000000) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule