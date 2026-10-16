`timescale 1ns/1ps

module tb_MUX_Control;

    // Inputs
    reg Hazard_i;
    reg [4:0] RegDst_i;
    reg [1:0] ALUOp_i;
    reg ALUSrc_i;
    reg RegWrite_i;
    reg MemToReg_i;
    reg MemRead_i;
    reg MemWrite_i;

    // Outputs
    wire [4:0] RegDst_o;
    wire [1:0] ALUOp_o;
    wire ALUSrc_o;
    wire RegWrite_o;
    wire MemToReg_o;
    wire MemRead_o;
    wire MemWrite_o;

    // Instantiate the Unit Under Test (UUT)
    MUX_Control uut (
        .Hazard_i(Hazard_i), 
        .RegDst_i(RegDst_i),  
        .ALUOp_i(ALUOp_i), 
        .ALUSrc_i(ALUSrc_i),  
        .RegWrite_i(RegWrite_i), 
        .MemToReg_i(MemToReg_i), 
        .MemRead_i(MemRead_i),
        .MemWrite_i(MemWrite_i),
        .RegDst_o(RegDst_o),  
        .ALUOp_o(ALUOp_o), 
        .ALUSrc_o(ALUSrc_o),  
        .RegWrite_o(RegWrite_o), 
        .MemToReg_o(MemToReg_o), 
        .MemRead_o(MemRead_o),
        .MemWrite_o(MemWrite_o)  
    );

    initial begin
        // Initialize Inputs
        Hazard_i = 0;
        RegDst_i = 5'b10101;
        ALUOp_i = 2'b11;
        ALUSrc_i = 1;
        RegWrite_i = 1;
        MemToReg_i = 1;
        MemRead_i = 1;
        MemWrite_i = 1;

        // Wait for global reset to finish
        #10;

        // Test case 1: No hazard
        Hazard_i = 0;
        #10;
        if (RegDst_o !== RegDst_i) $display("FAIL: RegDst_o mismatch on no hazard");
        if (ALUOp_o !== ALUOp_i) $display("FAIL: ALUOp_o mismatch on no hazard");
        if (ALUSrc_o !== ALUSrc_i) $display("FAIL: ALUSrc_o mismatch on no hazard");
        if (RegWrite_o !== RegWrite_i) $display("FAIL: RegWrite_o mismatch on no hazard");
        if (MemToReg_o !== MemToReg_i) $display("FAIL: MemToReg_o mismatch on no hazard");
        if (MemRead_o !== MemRead_i) $display("FAIL: MemRead_o mismatch on no hazard");
        if (MemWrite_o !== MemWrite_i) $display("FAIL: MemWrite_o mismatch on no hazard");

        // Test case 2: Hazard detected
        Hazard_i = 1;
        #10;
        if (RegDst_o !== 5'b00000) $display("FAIL: RegDst_o mismatch on hazard");
        if (ALUOp_o !== 2'b00) $display("FAIL: ALUOp_o mismatch on hazard");
        if (ALUSrc_o !== 1'b0) $display("FAIL: ALUSrc_o mismatch on hazard");
        if (RegWrite_o !== 1'b0) $display("FAIL: RegWrite_o mismatch on hazard");
        if (MemToReg_o !== 1'b0) $display("FAIL: MemToReg_o mismatch on hazard");
        if (MemRead_o !== 1'b0) $display("FAIL: MemRead_o mismatch on hazard");
        if (MemWrite_o !== 1'b0) $display("FAIL: MemWrite_o mismatch on hazard");

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule