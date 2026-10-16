`timescale 1ns/1ps

module tb_ZRLEncoder;

  reg [15:0] isZeros_i;
  wire [79:0] sizelist_o;
  wire [271:0] codewords_o;

  // Instantiate the Unit Under Test (UUT)
  ZRLEncoder uut (
    .isZeros_i(isZeros_i),
    .sizelist_o(sizelist_o),
    .codewords_o(codewords_o)
  );

  initial begin
    // Test case 1: 16'b10??_????_????_????
    isZeros_i = 16'b1000_0000_0000_0000; // Expect sizelist[0] = 4, codewords[0] = 4'b0011 followed by 13'b0000000000000
    #10;
    if (sizelist_o[79:75] !== 5'd4 || codewords_o[271:255] !== {4'b0011, 13'b0000000000000}) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: 16'b110?_????_????_????
    isZeros_i = 16'b1100_0000_0000_0000; // Expect sizelist[0] = 7, codewords[0] = 3'b010 followed by 4'b0001 and 10'b0000000000
    #10;
    if (sizelist_o[79:75] !== 5'd7 || codewords_o[271:255] !== {3'b010, 4'b0001, 10'b0000000000}) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: 16'b1110_????_????_????
    isZeros_i = 16'b1110_0000_0000_0000; // Expect sizelist[0] = 7, codewords[0] = 3'b010 followed by 4'b0010 and 10'b0000000000
    #10;
    if (sizelist_o[79:75] !== 5'd7 || codewords_o[271:255] !== {3'b010, 4'b0010, 10'b0000000000}) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: 16'b1111_0???_????_????
    isZeros_i = 16'b1111_0000_0000_0000; // Expect sizelist[0] = 7, codewords[0] = 3'b010 followed by 4'b0011 and 10'b0000000000
    #10;
    if (sizelist_o[79:75] !== 5'd7 || codewords_o[271:255] !== {3'b010, 4'b0011, 10'b0000000000}) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: 16'b1111_1111_1111_1111
    isZeros_i = 16'b1111_1111_1111_1111; // Expect sizelist[0] = 5'b11111, codewords[0] = 17'h1ffff
    #10;
    if (sizelist_o[79:75] !== 5'b11111 || codewords_o[271:255] !== 17'h1ffff) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Additional test cases can be added here...

    $display("PASS");
    $finish;
  end

endmodule