`timescale 1ns/1ps

module tb_aes_compare;

  reg [127:0] encipher_input;
  reg [127:0] decipher_output;
  wire outputs_comp_result;

  // Instantiate the module under test
  aes_compare uut (
    .encipher_input(encipher_input),
    .decipher_output(decipher_output),
    .outputs_comp_result(outputs_comp_result)
  );

  initial begin
    // Test case 1: Identical inputs
    encipher_input = 128'h0123456789abcdef0123456789abcdef;
    decipher_output = 128'h0123456789abcdef0123456789abcdef;
    #10;
    if (outputs_comp_result !== 1'b1) begin
      $display("FAIL: Test case 1 failed, expected 1 but got %b", outputs_comp_result);
      $finish;
    end

    // Test case 2: Different inputs
    encipher_input = 128'h0123456789abcdef0123456789abcdef;
    decipher_output = 128'hfedcba9876543210fedcba9876543210;
    #10;
    if (outputs_comp_result !== 1'b0) begin
      $display("FAIL: Test case 2 failed, expected 0 but got %b", outputs_comp_result);
      $finish;
    end

    // Test case 3: All zeros
    encipher_input = 128'h00000000000000000000000000000000;
    decipher_output = 128'h00000000000000000000000000000000;
    #10;
    if (outputs_comp_result !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected 1 but got %b", outputs_comp_result);
      $finish;
    end

    // Test case 4: One input zero, one input non-zero
    encipher_input = 128'h00000000000000000000000000000000;
    decipher_output = 128'hffffffffffffffffffffffffffffffff;
    #10;
    if (outputs_comp_result !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected 0 but got %b", outputs_comp_result);
      $finish;
    end

    // Test case 5: Random values
    encipher_input = 128'habcdefabcdefabcdefabcdefabcdefab;
    decipher_output = 128'habcdefabcdefabcdefabcdefabcdefab;
    #10;
    if (outputs_comp_result !== 1'b1) begin
      $display("FAIL: Test case 5 failed, expected 1 but got %b", outputs_comp_result);
      $finish;
    end

    // Test case 6: Random values, different
    encipher_input = 128'habcdefabcdefabcdefabcdefabcdefab;
    decipher_output = 128'h1234567890abcdef1234567890abcdef;
    #10;
    if (outputs_comp_result !== 1'b0) begin
      $display("FAIL: Test case 6 failed, expected 0 but got %b", outputs_comp_result);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule