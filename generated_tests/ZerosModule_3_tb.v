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
    // Test case 1: All zeros input
    data_i = 16'h0000; 
    #10;
    if (flag_o !== 1'b1 || codeword_o !== 17'h1ffff) begin
      $display("FAIL: Test case 1 failed (all zeros input)");
      $finish;
    end

    // Test case 2: Non-zero input
    data_i = 16'h1234; 
    #10;
    if (flag_o !== 1'b0 || codeword_o !== {1'b0, 16'h1234}) begin
      $display("FAIL: Test case 2 failed (non-zero input)");
      $finish;
    end

    // Test case 3: Another non-zero input
    data_i = 16'hFFFF; 
    #10;
    if (flag_o !== 1'b0 || codeword_o !== {1'b0, 16'hFFFF}) begin
      $display("FAIL: Test case 3 failed (another non-zero input)");
      $finish;
    end

    // Test case 4: Another all zeros input
    data_i = 16'h0000; 
    #10;
    if (flag_o !== 1'b1 || codeword_o !== 17'h1ffff) begin
      $display("FAIL: Test case 4 failed (all zeros input again)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule