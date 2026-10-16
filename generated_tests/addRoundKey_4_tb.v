`timescale 1ns/1ps

module tb_addRoundKey;

    // Parameters
    parameter NK__KEY_LENGTH = 8;
    parameter NR__ROUNDS = 14;
    parameter NB__BLOCK_LENGTH_IN_TEXT = 4;

    // Inputs
    reg [NB__BLOCK_LENGTH_IN_TEXT-1:0] round_number_in;
    reg [(NB__BLOCK_LENGTH_IN_TEXT*NK__KEY_LENGTH*4)-1:0] state_text_in;
    reg [(NB__BLOCK_LENGTH_IN_TEXT*NK__KEY_LENGTH*4)-1:0] key_schedule_in;

    // Outputs
    wire [(NB__BLOCK_LENGTH_IN_TEXT*NK__KEY_LENGTH*4)-1:0] state_text_out;

    // Instantiate the Unit Under Test (UUT)
    addRoundKey uut (
        .round_number_in(round_number_in),
        .state_text_in(state_text_in),
        .key_schedule_in(key_schedule_in),
        .state_text_out(state_text_out)
    );

    initial begin
        // Initialize Inputs
        round_number_in = 0;
        state_text_in = 0;
        key_schedule_in = 0;

        // Test Case 1: Basic XOR operation
        round_number_in = 4'b0001; // Round 1
        state_text_in = 32'hA5A5A5A5; // Example state text
        key_schedule_in = 32'h5A5A5A5A; // Example key schedule
        #10; // Wait for the operation to complete
        if (state_text_out !== (state_text_in ^ key_schedule_in)) begin
            $display("FAIL: Test Case 1 failed");
            $finish;
        end

        // Test Case 2: Check with different inputs
        round_number_in = 4'b0010; // Round 2
        state_text_in = 32'hFFFFFFFF; // All bits set
        key_schedule_in = 32'h00000000; // All bits clear
        #10; // Wait for the operation to complete
        if (state_text_out !== (state_text_in ^ key_schedule_in)) begin
            $display("FAIL: Test Case 2 failed");
            $finish;
        end

        // Test Case 3: Check with all bits set in key
        round_number_in = 4'b0011; // Round 3
        state_text_in = 32'h12345678; // Example state text
        key_schedule_in = 32'hFFFFFFFF; // All bits set
        #10; // Wait for the operation to complete
        if (state_text_out !== (state_text_in ^ key_schedule_in)) begin
            $display("FAIL: Test Case 3 failed");
            $finish;
        end

        // Test Case 4: Check with all bits clear in state
        round_number_in = 4'b0100; // Round 4
        state_text_in = 32'h00000000; // All bits clear
        key_schedule_in = 32'hFFFFFFFF; // All bits set
        #10; // Wait for the operation to complete
        if (state_text_out !== (state_text_in ^ key_schedule_in)) begin
            $display("FAIL: Test Case 4 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule