`timescale 1ns/1ps

module tb_control;

    reg [15:0] instr;
    wire nHaltSig;
    wire RegWrt;
    wire ZeroExt;
    wire MemRead;
    wire ImmSrc;
    wire ALUSign;
    wire ALUJmp;
    wire MemWrt;
    wire err;
    wire [5:0] ALUOpr;
    wire [1:0] RegSrc;
    wire [1:0] BSrc;
    wire [1:0] RegDst;
    wire [3:0] BranchTaken;
    wire NOP;

    control uut (
        .instr(instr),
        .nHaltSig(nHaltSig),
        .RegWrt(RegWrt),
        .ZeroExt(ZeroExt),
        .MemRead(MemRead),
        .ImmSrc(ImmSrc),
        .ALUSign(ALUSign),
        .ALUJmp(ALUJmp),
        .MemWrt(MemWrt),
        .err(err),
        .ALUOpr(ALUOpr),
        .RegSrc(RegSrc),
        .BSrc(BSrc),
        .RegDst(RegDst),
        .BranchTaken(BranchTaken),
        .NOP(NOP)
    );

    initial begin
        // Test HALT instruction
        instr = 16'b0000000000000000; // HALT
        #10;
        if (nHaltSig !== 1'b1) $display("FAIL: HALT instruction failed");
        
        // Test NOP instruction
        instr = 16'b0000100000000000; // NOP
        #10;
        if (NOP !== 1'b1) $display("FAIL: NOP instruction failed");

        // Test ADDI instruction
        instr = 16'b0100000000000000; // ADDI
        #10;
        if (RegWrt !== 1'b1 || RegSrc !== 2'b10 || ALUOpr !== 6'b000000) $display("FAIL: ADDI instruction failed");

        // Test LD instruction
        instr = 16'b1000100000000000; // LD
        #10;
        if (RegWrt !== 1'b1 || MemRead !== 1'b1 || RegSrc !== 2'b01) $display("FAIL: LD instruction failed");

        // Test ST instruction
        instr = 16'b1001000000000000; // ST
        #10;
        if (MemWrt !== 1'b1 || RegWrt !== 1'b0) $display("FAIL: ST instruction failed");

        // Test invalid opcode
        instr = 16'b1111100000000000; // Invalid opcode
        #10;
        if (err !== 1'b1) $display("FAIL: Invalid opcode did not signal error");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule