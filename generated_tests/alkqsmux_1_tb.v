`timescale 1ns/1ps

module tb_alkqsmux;

    // Inputs
    reg dq_q_shl_l;
    reg dq_q_shr_l;
    reg alushf_dec_qsi1_l;
    reg alushf_dec_shf_h;
    reg alushf_dec_rot_h;
    reg alpctl_mul_l;
    reg alpctl_mul_group_h;
    reg alu_shift_op_l;
    reg alu_shl_op_h;
    reg alu_shr_op_h;
    reg c32_in_h;
    reg loopf_h;
    reg wb31_in_h;
    reg aq_sin_pslc_wb30_l;
    reg alu_sout_shl_h;
    reg alu_sout_shr_h;
    reg q_sout_shl_h;
    reg q_sout_shr_h;

    // Outputs
    wire q_sin_h;

    // Instantiate the Unit Under Test (UUT)
    alkqsmux uut (
        .dq_q_shl_l(dq_q_shl_l),
        .dq_q_shr_l(dq_q_shr_l),
        .alushf_dec_qsi1_l(alushf_dec_qsi1_l),
        .alushf_dec_shf_h(alushf_dec_shf_h),
        .alushf_dec_rot_h(alushf_dec_rot_h),
        .alpctl_mul_l(alpctl_mul_l),
        .alpctl_mul_group_h(alpctl_mul_group_h),
        .alu_shift_op_l(alu_shift_op_l),
        .alu_shl_op_h(alu_shl_op_h),
        .alu_shr_op_h(alu_shr_op_h),
        .c32_in_h(c32_in_h),
        .loopf_h(loopf_h),
        .wb31_in_h(wb31_in_h),
        .aq_sin_pslc_wb30_l(aq_sin_pslc_wb30_l),
        .alu_sout_shl_h(alu_sout_shl_h),
        .alu_sout_shr_h(alu_sout_shr_h),
        .q_sout_shl_h(q_sout_shl_h),
        .q_sout_shr_h(q_sout_shr_h),
        .q_sin_h(q_sin_h)
    );

    initial begin
        // Initialize Inputs
        dq_q_shl_l = 1;
        dq_q_shr_l = 1;
        alushf_dec_qsi1_l = 1;
        alushf_dec_shf_h = 0;
        alushf_dec_rot_h = 0;
        alpctl_mul_l = 1;
        alpctl_mul_group_h = 0;
        alu_shift_op_l = 1;
        alu_shl_op_h = 0;
        alu_shr_op_h = 0;
        c32_in_h = 0;
        loopf_h = 0;
        wb31_in_h = 0;
        aq_sin_pslc_wb30_l = 1;
        alu_sout_shl_h = 0;
        alu_sout_shr_h = 0;
        q_sout_shl_h = 0;
        q_sout_shr_h = 0;

        // Test Case 1: Check Q shift left
        dq_q_shl_l = 0; // Enable Q shift left
        alushf_dec_qsi1_l = 0; // Q shift in from ALUSHF
        #10;
        if (q_sin_h !== 1) begin
            $display("FAIL: Test Case 1 failed");
            $finish;
        end

        // Test Case 2: Check Q shift right
        dq_q_shr_l = 0; // Enable Q shift right
        alushf_dec_shf_h = 1; // Enable ALU shift
        #10;
        if (q_sin_h !== 1) begin
            $display("FAIL: Test Case 2 failed");
            $finish;
        end

        // Test Case 3: Check carry in for multiply
        c32_in_h = 1; // Enable carry in
        alpctl_mul_l = 0; // Enable multiply operation
        #10;
        if (q_sin_h !== 1) begin
            $display("FAIL: Test Case 3 failed");
            $finish;
        end

        // Test Case 4: Check WBUS[31] input
        wb31_in_h = 1; // Enable WBUS[31]
        alu_shift_op_l = 0; // Disable ALU shift
        #10;
        if (q_sin_h !== 1) begin
            $display("FAIL: Test Case 4 failed");
            $finish;
        end

        // Test Case 5: Check PSLC input
        aq_sin_pslc_wb30_l = 0; // Disable PSLC
        #10;
        if (q_sin_h !== 1) begin
            $display("FAIL: Test Case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule