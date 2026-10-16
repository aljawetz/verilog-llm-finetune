`timescale 1ns/1ps

module tb_ID_EX_Reg;

    // Parameters
    reg clk;
    reg resetn;
    reg [31:0] i_id_pc;
    reg [31:0] i_id_pc4;
    reg [31:0] i_id_rd1;
    reg [31:0] i_id_rd2;
    reg [31:0] i_id_imm;
    reg [4:0] i_id_alu_op;
    reg [4:0] i_id_rs1;
    reg [4:0] i_id_rs2;
    reg [4:0] i_id_rd;
    reg [1:0] i_id_select_data_wb;
    reg [1:0] i_id_branch_type;
    reg i_id_slt_instr;
    reg i_id_is_branch;
    reg i_id_reg_write;
    reg i_id_mem_write;
    reg i_id_jum;
    reg i_id_lsb;
    reg i_id_lsh;
    reg i_id_compare_signed;
    reg i_id_select_alu_a;
    reg i_id_select_alu_b;
    reg i_id_select_data_compare;
    reg i_id_load_signext;

    wire [31:0] o_ex_pc;
    wire [31:0] o_ex_pc4;
    wire [31:0] o_ex_rd1;
    wire [31:0] o_ex_rd2;
    wire [31:0] o_ex_imm;
    wire [4:0] o_ex_alu_op;
    wire [4:0] o_ex_rs1;
    wire [4:0] o_ex_rs2;
    wire [4:0] o_ex_rd;
    wire [1:0] o_ex_select_data_wb;
    wire [1:0] o_ex_branch_type;
    wire o_ex_slt_instr;
    wire o_ex_is_branch;
    wire o_ex_reg_write;
    wire o_ex_mem_write;
    wire o_ex_jum;
    wire o_ex_lsb;
    wire o_ex_lsh;
    wire o_ex_compare_signed;
    wire o_ex_select_alu_a;
    wire o_ex_select_alu_b;
    wire o_ex_select_data_compare;
    wire o_ex_load_signext;

    // Instantiate the Unit Under Test (UUT)
    ID_EX_Reg uut (
        .clk(clk),
        .resetn(resetn),
        .i_id_pc(i_id_pc),
        .i_id_pc4(i_id_pc4),
        .i_id_rd1(i_id_rd1),
        .i_id_rd2(i_id_rd2),
        .i_id_imm(i_id_imm),
        .i_id_alu_op(i_id_alu_op),
        .i_id_rs1(i_id_rs1),
        .i_id_rs2(i_id_rs2),
        .i_id_rd(i_id_rd),
        .i_id_select_data_wb(i_id_select_data_wb),
        .i_id_branch_type(i_id_branch_type),
        .i_id_slt_instr(i_id_slt_instr),
        .i_id_is_branch(i_id_is_branch),
        .i_id_reg_write(i_id_reg_write),
        .i_id_mem_write(i_id_mem_write),
        .i_id_jum(i_id_jum),
        .i_id_lsb(i_id_lsb),
        .i_id_lsh(i_id_lsh),
        .i_id_compare_signed(i_id_compare_signed),
        .i_id_select_alu_a(i_id_select_alu_a),
        .i_id_select_alu_b(i_id_select_alu_b),
        .i_id_select_data_compare(i_id_select_data_compare),
        .i_id_load_signext(i_id_load_signext),
        .o_ex_pc(o_ex_pc),
        .o_ex_pc4(o_ex_pc4),
        .o_ex_rd1(o_ex_rd1),
        .o_ex_rd2(o_ex_rd2),
        .o_ex_imm(o_ex_imm),
        .o_ex_alu_op(o_ex_alu_op),
        .o_ex_rs1(o_ex_rs1),
        .o_ex_rs2(o_ex_rs2),
        .o_ex_rd(o_ex_rd),
        .o_ex_select_data_wb(o_ex_select_data_wb),
        .o_ex_branch_type(o_ex_branch_type),
        .o_ex_slt_instr(o_ex_slt_instr),
        .o_ex_is_branch(o_ex_is_branch),
        .o_ex_reg_write(o_ex_reg_write),
        .o_ex_mem_write(o_ex_mem_write),
        .o_ex_jum(o_ex_jum),
        .o_ex_lsb(o_ex_lsb),
        .o_ex_lsh(o_ex_lsh),
        .o_ex_compare_signed(o_ex_compare_signed),
        .o_ex_select_alu_a(o_ex_select_alu_a),
        .o_ex_select_alu_b(o_ex_select_alu_b),
        .o_ex_select_data_compare(o_ex_select_data_compare),
        .o_ex_load_signext(o_ex_load_signext)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        resetn = 0;
        i_id_pc = 32'h00000000;
        i_id_pc4 = 32'h00000004;
        i_id_rd1 = 32'h00000010;
        i_id_rd2 = 32'h00000020;
        i_id_imm = 32'h00000030;
        i_id_alu_op = 5'b00001;
        i_id_rs1 = 5'b00010;
        i_id_rs2 = 5'b00011;
        i_id_rd = 5'b00100;
        i_id_select_data_wb = 2'b01;
        i_id_branch_type = 2'b10;
        i_id_slt_instr = 1'b1;
        i_id_is_branch = 1'b0;
        i_id_reg_write = 1'b1;
        i_id_mem_write = 1'b0;
        i_id_jum = 1'b0;
        i_id_lsb = 1'b0;
        i_id_lsh = 1'b0;
        i_id_compare_signed = 1'b0;
        i_id_select_alu_a = 1'b1;
        i_id_select_alu_b = 1'b0;
        i_id_select_data_compare = 1'b1;
        i_id_load_signext = 1'b0;

        // Apply reset
        #10 resetn = 1;

        // Wait for a clock cycle
        #10;

        // Check outputs after first clock cycle
        if (o_ex_pc !== i_id_pc) begin
            $display("FAIL: o_ex_pc mismatch");
            $finish;
        end
        if (o_ex_pc4 !== i_id_pc4) begin
            $display("FAIL: o_ex_pc4 mismatch");
            $finish;
        end
        if (o_ex_rd1 !== i_id_rd1) begin
            $display("FAIL: o_ex_rd1 mismatch");
            $finish;
        end
        if (o_ex_rd2 !== i_id_rd2) begin
            $display("FAIL: o_ex_rd2 mismatch");
            $finish;
        end
        if (o_ex_imm !== i_id_imm) begin
            $display("FAIL: o_ex_imm mismatch");
            $finish;
        end
        if (o_ex_alu_op !== i_id_alu_op) begin
            $display("FAIL: o_ex_alu_op mismatch");
            $finish;
        end
        if (o_ex_rs1 !== i_id_rs1) begin
            $display("FAIL: o_ex_rs1 mismatch");
            $finish;
        end
        if (o_ex_rs2 !== i_id_rs2) begin
            $display("FAIL: o_ex_rs2 mismatch");
            $finish;
        end
        if (o_ex_rd !== i_id_rd) begin
            $display("FAIL: o_ex_rd mismatch");
            $finish;
        end
        if (o_ex_select_data_wb !== i_id_select_data_wb) begin
            $display("FAIL: o_ex_select_data_wb mismatch");
            $finish;
        end
        if (o_ex_branch_type !== i_id_branch_type) begin
            $display("FAIL: o_ex_branch_type mismatch");
            $finish;
        end
        if (o_ex_slt_instr !== i_id_slt_instr) begin
            $display("FAIL: o_ex_slt_instr mismatch");
            $finish;
        end
        if (o_ex_is_branch !== i_id_is_branch) begin
            $display("FAIL: o_ex_is_branch mismatch");
            $finish;
        end
        if (o_ex_reg_write !== i_id_reg_write) begin
            $display("FAIL: o_ex_reg_write mismatch");
            $finish;
        end
        if (o_ex_mem_write !== i_id_mem_write) begin
            $display("FAIL: o_ex_mem_write mismatch");
            $finish;
        end
        if (o_ex_jum !== i_id_jum) begin
            $display("FAIL: o_ex_jum mismatch");
            $finish;
        end
        if (o_ex_lsb !== i_id_lsb) begin
            $display("FAIL: o_ex_lsb mismatch");
            $finish;
        end
        if (o_ex_lsh !== i_id_lsh) begin
            $display("FAIL: o_ex_lsh mismatch");
            $finish;
        end
        if (o_ex_compare_signed !== i_id_compare_signed) begin
            $display("FAIL: o_ex_compare_signed mismatch");
            $finish;
        end
        if (o_ex_select_alu_a !== i_id_select_alu_a) begin
            $display("FAIL: o_ex_select_alu_a mismatch");
            $finish;
        end
        if (o_ex_select_alu_b !== i_id_select_alu_b) begin
            $display("FAIL: o_ex_select_alu_b mismatch");
            $finish;
        end
        if (o_ex_select_data_compare !== i_id_select_data_compare) begin
            $display("FAIL: o_ex_select_data_compare mismatch");
            $finish;
        end
        if (o_ex_load_signext !== i_id_load_signext) begin
            $display("FAIL: o_ex_load_signext mismatch");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule