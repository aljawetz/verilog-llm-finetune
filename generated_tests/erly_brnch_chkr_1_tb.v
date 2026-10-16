`timescale 1ns/1ps

module tb_erly_brnch_chkr;

    // Inputs
    reg [15:0] reg_to_check;
    reg [4:0] branch_opcode;

    // Output
    wire take_branch;

    // Instantiate the Unit Under Test (UUT)
    erly_brnch_chkr uut (
        .reg_to_check(reg_to_check),
        .branch_opcode(branch_opcode),
        .take_branch(take_branch)
    );

    initial begin
        // Test case 1: Check for zero branch (opcode 01100)
        reg_to_check = 16'b0;
        branch_opcode = 5'b01100; // BEQZ
        #10;
        if (take_branch !== 1'b1) begin
            $display("FAIL: Test case 1 failed (expected take_branch = 1)");
            $finish;
        end

        // Test case 2: Check for non-zero branch (opcode 01101)
        reg_to_check = 16'b0001;
        branch_opcode = 5'b01101; // BNEZ
        #10;
        if (take_branch !== 1'b1) begin
            $display("FAIL: Test case 2 failed (expected take_branch = 1)");
            $finish;
        end

        // Test case 3: Check for negative branch (opcode 01110)
        reg_to_check = 16'b1000_0000_0000_0000; // Negative value
        branch_opcode = 5'b01110; // BLTZ
        #10;
        if (take_branch !== 1'b1) begin
            $display("FAIL: Test case 3 failed (expected take_branch = 1)");
            $finish;
        end

        // Test case 4: Check for non-negative branch (opcode 01111)
        reg_to_check = 16'b0111_1111_1111_1111; // Non-negative value
        branch_opcode = 5'b01111; // BGEZ
        #10;
        if (take_branch !== 1'b1) begin
            $display("FAIL: Test case 4 failed (expected take_branch = 1)");
            $finish;
        end

        // Test case 5: Check for non-negative branch with zero value (opcode 01111)
        reg_to_check = 16'b0;
        branch_opcode = 5'b01111; // BGEZ
        #10;
        if (take_branch !== 1'b1) begin
            $display("FAIL: Test case 5 failed (expected take_branch = 1)");
            $finish;
        end

        // Test case 6: Check for non-zero branch with zero value (opcode 01101)
        reg_to_check = 16'b0;
        branch_opcode = 5'b01101; // BNEZ
        #10;
        if (take_branch !== 1'b0) begin
            $display("FAIL: Test case 6 failed (expected take_branch = 0)");
            $finish;
        end

        // Test case 7: Check for negative branch with positive value (opcode 01110)
        reg_to_check = 16'b0001; // Positive value
        branch_opcode = 5'b01110; // BLTZ
        #10;
        if (take_branch !== 1'b0) begin
            $display("FAIL: Test case 7 failed (expected take_branch = 0)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule