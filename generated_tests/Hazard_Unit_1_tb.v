`timescale 1ns/1ps

module tb_Hazard_Unit;

    reg [4:0] ex_rs1;
    reg [4:0] ex_rs2;
    reg [4:0] mem_rd;
    reg [4:0] wb_rd;
    reg mem_reg_write;
    reg wb_reg_write;
    reg is_branch;
    reg jum;
    wire [1:0] fwda_select;
    wire [1:0] fwdb_select;
    wire flush;

    // Instantiate the Unit Under Test (UUT)
    Hazard_Unit uut (
        .ex_rs1(ex_rs1),
        .ex_rs2(ex_rs2),
        .mem_rd(mem_rd),
        .wb_rd(wb_rd),
        .mem_reg_write(mem_reg_write),
        .wb_reg_write(wb_reg_write),
        .is_branch(is_branch),
        .jum(jum),
        .fwda_select(fwda_select),
        .fwdb_select(fwdb_select),
        .flush(flush)
    );

    initial begin
        // Initialize inputs
        ex_rs1 = 5'd0;
        ex_rs2 = 5'd0;
        mem_rd = 5'd0;
        wb_rd = 5'd0;
        mem_reg_write = 1'b0;
        wb_reg_write = 1'b0;
        is_branch = 1'b0;
        jum = 1'b0;

        // Test Case 1: No forwarding, no flush
        #10;
        ex_rs1 = 5'd1; ex_rs2 = 5'd2; mem_rd = 5'd3; wb_rd = 5'd4;
        mem_reg_write = 1'b0; wb_reg_write = 1'b0; is_branch = 1'b0; jum = 1'b0;
        #10;
        if (fwda_select !== 2'b00 || fwdb_select !== 2'b00 || flush !== 1'b0) begin
            $display("FAIL: Test Case 1 failed");
            $finish;
        end

        // Test Case 2: Forwarding from memory
        #10;
        ex_rs1 = 5'd1; ex_rs2 = 5'd2; mem_rd = 5'd1; wb_rd = 5'd4;
        mem_reg_write = 1'b1; wb_reg_write = 1'b0; is_branch = 1'b0; jum = 1'b0;
        #10;
        if (fwda_select !== 2'b01 || fwdb_select !== 2'b00 || flush !== 1'b0) begin
            $display("FAIL: Test Case 2 failed");
            $finish;
        end

        // Test Case 3: Forwarding from write-back
        #10;
        ex_rs1 = 5'd1; ex_rs2 = 5'd2; mem_rd = 5'd3; wb_rd = 5'd2;
        mem_reg_write = 1'b0; wb_reg_write = 1'b1; is_branch = 1'b0; jum = 1'b0;
        #10;
        if (fwda_select !== 2'b00 || fwdb_select !== 2'b10 || flush !== 1'b0) begin
            $display("FAIL: Test Case 3 failed");
            $finish;
        end

        // Test Case 4: Branch detected, should flush
        #10;
        ex_rs1 = 5'd1; ex_rs2 = 5'd2; mem_rd = 5'd3; wb_rd = 5'd4;
        mem_reg_write = 1'b0; wb_reg_write = 1'b0; is_branch = 1'b1; jum = 1'b0;
        #10;
        if (fwda_select !== 2'b00 || fwdb_select !== 2'b00 || flush !== 1'b1) begin
            $display("FAIL: Test Case 4 failed");
            $finish;
        end

        // Test Case 5: Jump detected, should flush
        #10;
        ex_rs1 = 5'd1; ex_rs2 = 5'd2; mem_rd = 5'd3; wb_rd = 5'd4;
        mem_reg_write = 1'b0; wb_reg_write = 1'b0; is_branch = 1'b0; jum = 1'b1;
        #10;
        if (fwda_select !== 2'b00 || fwdb_select !== 2'b00 || flush !== 1'b1) begin
            $display("FAIL: Test Case 5 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule