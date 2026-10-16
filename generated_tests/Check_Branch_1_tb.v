`timescale 1ns/1ps

module tb_Check_Branch;

    reg [1:0] branch_type;
    reg is_eq;
    reg is_lt;
    reg is_branch;
    wire yes;

    // Instantiate the module under test
    Check_Branch uut (
        .branch_type(branch_type),
        .is_eq(is_eq),
        .is_lt(is_lt),
        .is_branch(is_branch),
        .yes(yes)
    );

    initial begin
        // Test case 1: BE (branch if equal)
        branch_type = 2'b00; is_eq = 1'b1; is_lt = 1'b0; is_branch = 1'b1;
        #10;
        if (yes !== 1'b1) $display("FAIL: Test case 1 failed (BE expected yes=1)");

        // Test case 2: BNE (branch if not equal)
        branch_type = 2'b01; is_eq = 1'b0; is_lt = 1'b0; is_branch = 1'b1;
        #10;
        if (yes !== 1'b1) $display("FAIL: Test case 2 failed (BNE expected yes=1)");

        // Test case 3: BLT (branch if less than)
        branch_type = 2'b10; is_eq = 1'b0; is_lt = 1'b1; is_branch = 1'b1;
        #10;
        if (yes !== 1'b1) $display("FAIL: Test case 3 failed (BLT expected yes=1)");

        // Test case 4: BGE (branch if greater than or equal)
        branch_type = 2'b11; is_eq = 1'b0; is_lt = 1'b0; is_branch = 1'b1;
        #10;
        if (yes !== 1'b1) $display("FAIL: Test case 4 failed (BGE expected yes=1)");

        // Test case 5: Branch disabled
        is_branch = 1'b0;
        #10;
        if (yes !== 1'b0) $display("FAIL: Test case 5 failed (Branch disabled expected yes=0)");

        // Test case 6: BE with is_eq false
        branch_type = 2'b00; is_eq = 1'b0; is_branch = 1'b1;
        #10;
        if (yes !== 1'b0) $display("FAIL: Test case 6 failed (BE expected yes=0)");

        // Test case 7: BNE with is_eq true
        branch_type = 2'b01; is_eq = 1'b1; is_branch = 1'b1;
        #10;
        if (yes !== 1'b0) $display("FAIL: Test case 7 failed (BNE expected yes=0)");

        // Test case 8: BLT with is_lt false
        branch_type = 2'b10; is_lt = 1'b0; is_branch = 1'b1;
        #10;
        if (yes !== 1'b0) $display("FAIL: Test case 8 failed (BLT expected yes=0)");

        // Test case 9: BGE with is_lt true
        branch_type = 2'b11; is_lt = 1'b1; is_branch = 1'b1;
        #10;
        if (yes !== 1'b0) $display("FAIL: Test case 9 failed (BGE expected yes=0)");

        $display("PASS");
        $finish;
    end

endmodule