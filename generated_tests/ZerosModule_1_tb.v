`timescale 1ns/1ps

module tb_ZerosModule;

  reg [15:0] data_i;
  wire flag_o;
  wire [16:0] codeword_o;

  // Instantiate the module under test (uut)
  ZerosModule uut (
    .data_i(data_i),
    .flag_o(flag_o),
    .codeword_o(codeword_o)
  );

  initial begin
    // Test case 1: Check when data_i is zero
    data_i = 16'h0000;
    #10;
    if (flag_o !== 1'b1) begin
      $display("FAIL: Expected flag_o to be 1'b1 when data_i is 0");
      $finish;
    end
    if (codeword_o !== 17'h1ffff) begin
      $display("FAIL: Expected codeword_o to be 17'h1ffff when data_i is 0");
      $finish;
    end

    // Test case 2: Check when data_i is non-zero
    data_i = 16'h1234;
    #10;
    if (flag_o !== 1'b0) begin
      $display("FAIL: Expected flag_o to be 1'b0 when data_i is non-zero");
      $finish;
    end
    if (codeword_o !== {1'b0, data_i}) begin
      $display("FAIL: Expected codeword_o to be {1'b0, data_i} when data_i is non-zero");
      $finish;
    end

    // Test case 3: Check another non-zero value
    data_i = 16'hFFFF;
    #10;
    if (flag_o !== 1'b0) begin
      $display("FAIL: Expected flag_o to be 1'b0 when data_i is non-zero");
      $finish;
    end
    if (codeword_o !== {1'b0, data_i}) begin
      $display("FAIL: Expected codeword_o to be {1'b0, data_i} when data_i is non-zero");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule