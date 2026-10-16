`timescale 1ns/1ps

module tb_e203_ifu_minidec;

    // Parameters
    parameter E203_INSTR_SIZE = 32;
    parameter E203_RFIDX_WIDTH = 5;
    parameter E203_XLEN = 32;

    // Inputs
    reg [E203_INSTR_SIZE-1:0] instr;

    // Outputs
    wire dec_rs1en;
    wire dec_rs2en;
    wire [E203_RFIDX_WIDTH-1:0] dec_rs1idx;
    wire [E203_RFIDX_WIDTH-1:0] dec_rs2idx;
    wire dec_mul;
    wire dec_mulhsu;
    wire dec_div;
    wire dec_divu;
    wire dec_rem;
    wire dec_remu;
    wire dec_rv32;
    wire dec_bjp;
    wire dec_jal;
    wire dec_jalr;
    wire dec_bxx;
    wire [E203_RFIDX_WIDTH-1:0] dec_jalr_rs1idx;
    wire [E203_XLEN-1:0] dec_bjp_imm;

    // Instantiate the Unit Under Test (UUT)
    e203_ifu_minidec uut (
        .instr(instr),
        .dec_rs1en(dec_rs1en),
        .dec_rs2en(dec_rs2en),
        .dec_rs1idx(dec_rs1idx),
        .dec_rs2idx(dec_rs2idx),
        .dec_mul(dec_mul),
        .dec_mulhsu(dec_mulhsu),
        .dec_div(dec_div),
        .dec_divu(dec_divu),
        .dec_rem(dec_rem),
        .dec_remu(dec_remu),
        .dec_rv32(dec_rv32),
        .dec_bjp(dec_bjp),
        .dec_jal(dec_jal),
        .dec_jalr(dec_jalr),
        .dec_bxx(dec_bxx),
        .dec_jalr_rs1idx(dec_jalr_rs1idx),
        .dec_bjp_imm(dec_bjp_imm)
    );

    initial begin
        // Test sequence
        // Test case 1: Example instruction for a JAL
        instr = 32'b1101111_00000000000000000000000000; // JAL instruction
        #10;
        if (!dec_jal || dec_jalr || dec_bxx) begin
            $display("FAIL: JAL instruction decoding failed");
            $finish;
        end

        // Test case 2: Example instruction for a JALR
        instr = 32'b1100111_00000000000000000000000000; // JALR instruction
        #10;
        if (!dec_jalr || dec_jal || dec_bxx) begin
            $display("FAIL: JALR instruction decoding failed");
            $finish;
        end

        // Test case 3: Example instruction for a BXX
        instr = 32'b1100011_00000000000000000000000000; // BXX instruction
        #10;
        if (!dec_bxx || dec_jal || dec_jalr) begin
            $display("FAIL: BXX instruction decoding failed");
            $finish;
        end

        // Test case 4: Example instruction for a multiplication
        instr = 32'b0000001_00000000000000000000000000; // MUL instruction
        #10;
        if (!dec_mul) begin
            $display("FAIL: MUL instruction decoding failed");
            $finish;
        end

        // Test case 5: Example instruction for a division
        instr = 32'b0000001_00000000000000000000000001; // DIV instruction
        #10;
        if (!dec_div) begin
            $display("FAIL: DIV instruction decoding failed");
            $finish;
        end

        // Test case 6: Example instruction for RV32
        instr = 32'b0000000_00000000000000000000000000; // RV32 instruction
        #10;
        if (!dec_rv32) begin
            $display("FAIL: RV32 instruction decoding failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule