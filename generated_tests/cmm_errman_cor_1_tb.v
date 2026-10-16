`timescale 1ns/1ps

module tb_cmm_errman_cor;

  // Parameters
  reg clk;
  reg rst;
  reg add_input_one;
  reg add_input_two_n;
  reg add_input_three_n;
  reg add_input_four_n;
  reg add_input_five_n;
  reg add_input_six_n;
  reg decr_cor;
  
  wire [2:0] cor_num;
  wire inc_dec_b;
  wire reg_decr_cor;

  // Instantiate the Unit Under Test (UUT)
  cmm_errman_cor uut (
    .cor_num(cor_num),
    .inc_dec_b(inc_dec_b),
    .reg_decr_cor(reg_decr_cor),
    .add_input_one(add_input_one),
    .add_input_two_n(add_input_two_n),
    .add_input_three_n(add_input_three_n),
    .add_input_four_n(add_input_four_n),
    .add_input_five_n(add_input_five_n),
    .add_input_six_n(add_input_six_n),
    .decr_cor(decr_cor),
    .rst(rst),
    .clk(clk)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1;
    add_input_one = 0;
    add_input_two_n = 1;
    add_input_three_n = 1;
    add_input_four_n = 1;
    add_input_five_n = 1;
    add_input_six_n = 1;
    decr_cor = 0;

    // Release reset
    #10;
    rst = 0;

    // Test case 1: All inputs low, expect cor_num = 3'b101
    #10;
    add_input_one = 0; add_input_two_n = 0; add_input_three_n = 1; 
    add_input_four_n = 1; add_input_five_n = 1; add_input_six_n = 1;
    #10;
    if (cor_num !== 3'b101) $display("FAIL: Test case 1 failed, expected cor_num = 3'b101, got %b", cor_num);

    // Test case 2: add_input_one high, expect cor_num = 3'b100
    #10;
    add_input_one = 1; add_input_two_n = 0; 
    #10;
    if (cor_num !== 3'b100) $display("FAIL: Test case 2 failed, expected cor_num = 3'b100, got %b", cor_num);

    // Test case 3: add_input_two_n low, expect cor_num = 3'b100
    #10;
    add_input_one = 0; add_input_two_n = 0; 
    #10;
    if (cor_num !== 3'b100) $display("FAIL: Test case 3 failed, expected cor_num = 3'b100, got %b", cor_num);

    // Test case 4: add_input_three_n low, expect cor_num = 3'b011
    #10;
    add_input_three_n = 0; 
    #10;
    if (cor_num !== 3'b011) $display("FAIL: Test case 4 failed, expected cor_num = 3'b011, got %b", cor_num);

    // Test case 5: add_input_four_n low, expect cor_num = 3'b100
    #10;
    add_input_three_n = 1; add_input_four_n = 0; 
    #10;
    if (cor_num !== 3'b100) $display("FAIL: Test case 5 failed, expected cor_num = 3'b100, got %b", cor_num);

    // Test case 6: add_input_five_n low, expect cor_num = 3'b100
    #10;
    add_input_four_n = 1; add_input_five_n = 0; 
    #10;
    if (cor_num !== 3'b100) $display("FAIL: Test case 6 failed, expected cor_num = 3'b100, got %b", cor_num);

    // Test case 7: add_input_six_n low, expect cor_num = 3'b100
    #10;
    add_input_five_n = 1; add_input_six_n = 0; 
    #10;
    if (cor_num !== 3'b100) $display("FAIL: Test case 7 failed, expected cor_num = 3'b100, got %b", cor_num);

    // Test case 8: decr_cor high, expect inc_dec_b = 0
    #10;
    decr_cor = 1; 
    #10;
    if (inc_dec_b !== 0) $display("FAIL: Test case 8 failed, expected inc_dec_b = 0, got %b", inc_dec_b);

    // Test case 9: Reset the module
    #10;
    rst = 1; 
    #10;
    rst = 0; 
    #10;
    if (cor_num !== 3'b000) $display("FAIL: Test case 9 failed, expected cor_num = 3'b000, got %b", cor_num);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule