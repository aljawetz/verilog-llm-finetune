`timescale 1ns/1ps

module tb_addRoundKey;

  parameter NK__KEY_LENGTH = 8;
  parameter NR__ROUNDS = 14;
  parameter NB__BLOCK_LENGTH_IN_TEXT = 4;

  reg [NB__BLOCK_LENGTH_IN_TEXT-1:0] round_number_in;
  reg [(NB__BLOCK_LENGTH_IN_TEXT*NK__KEY_LENGTH*4)-1:0] state_text_in;
  reg [(NB__BLOCK_LENGTH_IN_TEXT*NK__KEY_LENGTH*4)-1:0] key_schedule_in;
  wire [(NB__BLOCK_LENGTH_IN_TEXT*NK__KEY_LENGTH*4)-1:0] state_text_out;

  // Instantiate the module under test
  addRoundKey uut (
    .round_number_in(round_number_in),
    .state_text_in(state_text_in),
    .key_schedule_in(key_schedule_in),
    .state_text_out(state_text_out)
  );

  initial begin
    // Test Case 1
    round_number_in = 4'b0001;
    state_text_in = 32'hA5A5A5A5; // Example state text
    key_schedule_in = 32'h5A5A5A5A; // Example key schedule
    #10; // Wait for the output to stabilize
    if (state_text_out !== (state_text_in ^ key_schedule_in)) begin
      $display("FAIL: Test Case 1 failed");
      $finish;
    end

    // Test Case 2
    round_number_in = 4'b0010;
    state_text_in = 32'hFFFFFFFF; // Example state text
    key_schedule_in = 32'h00000000; // Example key schedule
    #10; // Wait for the output to stabilize
    if (state_text_out !== (state_text_in ^ key_schedule_in)) begin
      $display("FAIL: Test Case 2 failed");
      $finish;
    end

    // Test Case 3
    round_number_in = 4'b0011;
    state_text_in = 32'h12345678; // Example state text
    key_schedule_in = 32'h87654321; // Example key schedule
    #10; // Wait for the output to stabilize
    if (state_text_out !== (state_text_in ^ key_schedule_in)) begin
      $display("FAIL: Test Case 3 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule