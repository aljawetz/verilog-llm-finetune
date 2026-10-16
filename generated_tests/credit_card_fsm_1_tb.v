`timescale 1ns/1ps

module tb_credit_card_fsm;

  reg clk;
  reg reset;
  reg swipe_card;
  reg valid_data;
  reg sufficient_fund;
  wire transaction_status;

  // Instantiate the Unit Under Test (UUT)
  credit_card_fsm uut (
    .clk(clk),
    .reset(reset),
    .swipe_card(swipe_card),
    .valid_data(valid_data),
    .sufficient_fund(sufficient_fund),
    .transaction_status(transaction_status)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    swipe_card = 0;
    valid_data = 0;
    sufficient_fund = 0;

    // Release reset
    #10 reset = 0;

    // Test Case 1: Successful transaction
    #10 swipe_card = 1; // Swipe card
    #10 swipe_card = 0; // Release card
    #10 valid_data = 1; // Valid data
    sufficient_fund = 1; // Sufficient funds
    #10; // Wait for processing
    if (transaction_status !== 1) begin
      $display("FAIL: Expected transaction_status = 1, got %b", transaction_status);
      $finish;
    end

    // Test Case 2: Declined transaction due to insufficient funds
    #10 swipe_card = 1; // Swipe card
    #10 swipe_card = 0; // Release card
    #10 valid_data = 1; // Valid data
    sufficient_fund = 0; // Insufficient funds
    #10; // Wait for processing
    if (transaction_status !== 0) begin
      $display("FAIL: Expected transaction_status = 0, got %b", transaction_status);
      $finish;
    end

    // Test Case 3: Invalid data
    #10 swipe_card = 1; // Swipe card
    #10 swipe_card = 0; // Release card
    #10 valid_data = 0; // Invalid data
    sufficient_fund = 1; // Sufficient funds
    #10; // Wait for processing
    if (transaction_status !== 0) begin
      $display("FAIL: Expected transaction_status = 0, got %b", transaction_status);
      $finish;
    end

    // Test Case 4: Reset functionality
    #10 reset = 1; // Assert reset
    #10 reset = 0; // Release reset
    if (transaction_status !== 0) begin
      $display("FAIL: Expected transaction_status = 0 after reset, got %b", transaction_status);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule