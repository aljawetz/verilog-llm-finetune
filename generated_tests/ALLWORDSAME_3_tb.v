`timescale 1ns/1ps

module tb_ALLWORDSAME;

  reg [255:0] data_i;
  wire isAllWordSame_o;

  // Instantiate the module under test
  ALLWORDSAME uut (
    .data_i(data_i),
    .isAllWordSame_o(isAllWordSame_o)
  );

  initial begin
    // Test case 1: All words are the same
    data_i = {8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA,
               8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA,
               8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA,
               8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA};
    #10;
    if (isAllWordSame_o !== 1'b1) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: One group is different
    data_i = {8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hBB, 8'hAA, 8'hAA, 8'hAA,
               8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA,
               8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA,
               8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA};
    #10;
    if (isAllWordSame_o !== 1'b0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: All groups are different
    data_i = {8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hBB, 8'hBB, 8'hBB, 8'hBB,
               8'hCC, 8'hCC, 8'hCC, 8'hCC, 8'hDD, 8'hDD, 8'hDD, 8'hDD,
               8'hEE, 8'hEE, 8'hEE, 8'hEE, 8'hFF, 8'hFF, 8'hFF, 8'hFF,
               8'h00, 8'h00, 8'h00, 8'h00, 8'h11, 8'h11, 8'h11, 8'h11};
    #10;
    if (isAllWordSame_o !== 1'b0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Mixed uniform groups
    data_i = {8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA, 8'hAA,
               8'hBB, 8'hBB, 8'hBB, 8'hBB, 8'hBB, 8'hBB, 8'hBB, 8'hBB,
               8'hCC, 8'hCC, 8'hCC, 8'hCC, 8'hCC, 8'hCC, 8'hCC, 8'hCC,
               8'hDD, 8'hDD, 8'hDD, 8'hDD, 8'hDD, 8'hDD, 8'hDD, 8'hDD};
    #10;
    if (isAllWordSame_o !== 1'b0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: All words are different
    data_i = {8'h01, 8'h02, 8'h03, 8'h04, 8'h05, 8'h06, 8'h07, 8'h08,
               8'h09, 8'h0A, 8'h0B, 8'h0C, 8'h0D, 8'h0E, 8'h0F, 8'h10,
               8'h11, 8'h12, 8'h13, 8'h14, 8'h15, 8'h16, 8'h17, 8'h18,
               8'h19, 8'h1A, 8'h1B, 8'h1C, 8'h1D, 8'h1E, 8'h1F, 8'h20};
    #10;
    if (isAllWordSame_o !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule