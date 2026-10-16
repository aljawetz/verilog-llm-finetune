`timescale 1ns/1ps

module tb_compare;

    // Inputs
    reg [3:0] i_rddata;
    reg i_rddata_mark_row;
    reg i_rddata_mark_col;
    reg i_rddata_mark_matrix;

    // Outputs
    wire o_cmp;
    wire o_cmp_mark;

    // Instantiate the Unit Under Test (UUT)
    compare uut (
        .i_rddata(i_rddata),
        .i_rddata_mark_row(i_rddata_mark_row),
        .i_rddata_mark_col(i_rddata_mark_col),
        .i_rddata_mark_matrix(i_rddata_mark_matrix),
        .o_cmp(o_cmp),
        .o_cmp_mark(o_cmp_mark)
    );

    initial begin
        // Test case 1: All inputs low
        i_rddata = 4'b0000;
        i_rddata_mark_row = 0;
        i_rddata_mark_col = 0;
        i_rddata_mark_matrix = 0;
        #10;
        if (o_cmp !== 0 || o_cmp_mark !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: One bit high
        i_rddata = 4'b0001;
        i_rddata_mark_row = 0;
        i_rddata_mark_col = 0;
        i_rddata_mark_matrix = 0;
        #10;
        if (o_cmp !== 1 || o_cmp_mark !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Multiple bits high
        i_rddata = 4'b1010;
        i_rddata_mark_row = 1;
        i_rddata_mark_col = 0;
        i_rddata_mark_matrix = 0;
        #10;
        if (o_cmp !== 1 || o_cmp_mark !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: All bits high
        i_rddata = 4'b1111;
        i_rddata_mark_row = 1;
        i_rddata_mark_col = 1;
        i_rddata_mark_matrix = 1;
        #10;
        if (o_cmp !== 1 || o_cmp_mark !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: No marks
        i_rddata = 4'b1100;
        i_rddata_mark_row = 0;
        i_rddata_mark_col = 0;
        i_rddata_mark_matrix = 0;
        #10;
        if (o_cmp !== 1 || o_cmp_mark !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Mixed marks
        i_rddata = 4'b0011;
        i_rddata_mark_row = 1;
        i_rddata_mark_col = 1;
        i_rddata_mark_matrix = 0;
        #10;
        if (o_cmp !== 1 || o_cmp_mark !== 1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule