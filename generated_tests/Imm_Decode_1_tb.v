`timescale 1ns/1ps

module tb_Imm_Decode;

    reg [31:0] instr;
    reg [6:0] opcode;
    wire [31:0] o_imm;

    // Instantiate the module under test (uut)
    Imm_Decode uut (
        .instr(instr),
        .opcode(opcode),
        .o_imm(o_imm)
    );

    initial begin
        // Test case 1: LW instruction
        instr = 32'b00000000000100000000000000110011; // ADDI x1, x0, 1
        opcode = 7'b0000011; // LW
        #10;
        if (o_imm !== 32'hFFFFFFF0) $display("FAIL: Test case 1 failed, expected 0xFFFFFFF0, got %h", o_imm);

        // Test case 2: SW instruction
        instr = 32'b00000000000100000000000000100011; // SW x1, 0(x0)
        opcode = 7'b0100011; // SW
        #10;
        if (o_imm !== 32'hFFFFFFF0) $display("FAIL: Test case 2 failed, expected 0xFFFFFFF0, got %h", o_imm);

        // Test case 3: JAL instruction
        instr = 32'b00000000000000000000000001101111; // JAL x1, 0
        opcode = 7'b1101111; // JAL
        #10;
        if (o_imm !== 32'h00000000) $display("FAIL: Test case 3 failed, expected 0x00000000, got %h", o_imm);

        // Test case 4: JALR instruction
        instr = 32'b00000000000100000000000001100111; // JALR x1, 0(x0)
        opcode = 7'b1100111; // JALR
        #10;
        if (o_imm !== 32'hFFFFFFF0) $display("FAIL: Test case 4 failed, expected 0xFFFFFFF0, got %h", o_imm);

        // Test case 5: Branch instruction
        instr = 32'b00000000000100000000000001100011; // BEQ x0, x1, 0
        opcode = 7'b1100011; // Branch
        #10;
        if (o_imm !== 32'hFFFFFFF0) $display("FAIL: Test case 5 failed, expected 0xFFFFFFF0, got %h", o_imm);

        // Test case 6: LUI instruction
        instr = 32'b00000000000100000000000001101111; // LUI x1, 1
        opcode = 7'b0110111; // LUI
        #10;
        if (o_imm !== 32'h00000001) $display("FAIL: Test case 6 failed, expected 0x00000001, got %h", o_imm);

        // Test case 7: ADDI instruction
        instr = 32'b00000000000100000000000000100111; // ADDI x1, x0, 1
        opcode = 7'b0010011; // ADDI
        #10;
        if (o_imm !== 32'hFFFFFFF0) $display("FAIL: Test case 7 failed, expected 0xFFFFFFF0, got %h", o_imm);

        // Test case 8: AUIPC instruction
        instr = 32'b00000000000100000000000000101111; // AUIPC x1, 1
        opcode = 7'b0010111; // AUIPC
        #10;
        if (o_imm !== 32'h00000001) $display("FAIL: Test case 8 failed, expected 0x00000001, got %h", o_imm);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule