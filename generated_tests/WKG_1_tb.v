`timescale 1ns/1ps

module tb_WKG;

    // Parameters
    reg         i_op;
    reg         i_wf_post_pre;
    reg [31:0]  i_mk3to0;
    reg [31:0]  i_mk15to12;
    wire [7:0]  o_wk3_7;
    wire [7:0]  o_wk2_6;
    wire [7:0]  o_wk1_5;
    wire [7:0]  o_wk0_4;

    // Instantiate the Unit Under Test (UUT)
    WKG uut (
        .i_op(i_op),
        .i_wf_post_pre(i_wf_post_pre),
        .i_mk3to0(i_mk3to0),
        .i_mk15to12(i_mk15to12),
        .o_wk3_7(o_wk3_7),
        .o_wk2_6(o_wk2_6),
        .o_wk1_5(o_wk1_5),
        .o_wk0_4(o_wk0_4)
    );

    initial begin
        // Test Case 1: w_out_sel = 0 (i_op = 0, i_wf_post_pre = 0)
        i_op = 0; 
        i_wf_post_pre = 0; 
        i_mk3to0 = 32'hAABBCCDD; 
        i_mk15to12 = 32'h11223344; 
        #10;
        if (o_wk3_7 !== 8'h11 || o_wk2_6 !== 8'h22 || o_wk1_5 !== 8'h33 || o_wk0_4 !== 8'h44) begin
            $display("FAIL: Test Case 1 failed");
            $finish;
        end

        // Test Case 2: w_out_sel = 1 (i_op = 1, i_wf_post_pre = 0)
        i_op = 1; 
        i_wf_post_pre = 0; 
        i_mk3to0 = 32'hAABBCCDD; 
        i_mk15to12 = 32'h11223344; 
        #10;
        if (o_wk3_7 !== 8'hAA || o_wk2_6 !== 8'hBB || o_wk1_5 !== 8'hCC || o_wk0_4 !== 8'hDD) begin
            $display("FAIL: Test Case 2 failed");
            $finish;
        end

        // Test Case 3: w_out_sel = 1 (i_op = 0, i_wf_post_pre = 1)
        i_op = 0; 
        i_wf_post_pre = 1; 
        i_mk3to0 = 32'hAABBCCDD; 
        i_mk15to12 = 32'h11223344; 
        #10;
        if (o_wk3_7 !== 8'hAA || o_wk2_6 !== 8'hBB || o_wk1_5 !== 8'hCC || o_wk0_4 !== 8'hDD) begin
            $display("FAIL: Test Case 3 failed");
            $finish;
        end

        // Test Case 4: w_out_sel = 0 (i_op = 1, i_wf_post_pre = 1)
        i_op = 1; 
        i_wf_post_pre = 1; 
        i_mk3to0 = 32'hAABBCCDD; 
        i_mk15to12 = 32'h11223344; 
        #10;
        if (o_wk3_7 !== 8'h11 || o_wk2_6 !== 8'h22 || o_wk1_5 !== 8'h33 || o_wk0_4 !== 8'h44) begin
            $display("FAIL: Test Case 4 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule