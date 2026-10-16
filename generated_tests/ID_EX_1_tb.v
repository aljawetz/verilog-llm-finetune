`timescale 1ns/1ps

module tb_ID_EX;

    reg clk_i;
    reg ALUSrc_i;
    reg RegWrite_i;
    reg MemToReg_i;
    reg MemRead_i;
    reg MemWrite_i;
    reg start_i;
    reg [31:0] inst_i;
    reg [31:0] pc_i;
    reg [31:0] RDData0_i;
    reg [31:0] RDData1_i;
    reg [31:0] SignExtended_i;
    reg [1:0] ALUOp_i;
    reg [4:0] RegDst_i;
    reg [4:0] RSaddr_i;
    reg [4:0] RTaddr_i;
    reg [31:0] pcEx_i;
    reg PC_branch_select_i;

    wire ALUSrc_o;
    wire RegWrite_o;
    wire MemToReg_o;
    wire MemRead_o;
    wire MemWrite_o;
    wire [31:0] inst_o;
    wire [31:0] pc_o;
    wire [31:0] RDData0_o;
    wire [31:0] RDData1_o;
    wire [31:0] SignExtended_o;
    wire [1:0] ALUOp_o;
    wire [4:0] RegDst_o;
    wire [4:0] RSaddr_o;
    wire [4:0] RTaddr_o;
    wire [31:0] pcEx_o;
    wire PC_branch_select_o;

    ID_EX uut (
        .clk_i(clk_i),
        .start_i(start_i),
        .inst_i(inst_i),
        .pc_i(pc_i),
        .pcEx_i(pcEx_i),
        .RDData0_i(RDData0_i),
        .RDData1_i(RDData1_i),
        .SignExtended_i(SignExtended_i),
        .RegDst_i(RegDst_i),
        .ALUOp_i(ALUOp_i),
        .ALUSrc_i(ALUSrc_i),
        .RegWrite_i(RegWrite_i),
        .MemToReg_i(MemToReg_i),
        .MemRead_i(MemRead_i),
        .MemWrite_i(MemWrite_i),
        .PC_branch_select_i(PC_branch_select_i),
        .RSaddr_i(RSaddr_i),
        .RTaddr_i(RTaddr_i),
        .inst_o(inst_o),
        .pc_o(pc_o),
        .pcEx_o(pcEx_o),
        .RDData0_o(RDData0_o),
        .RDData1_o(RDData1_o),
        .SignExtended_o(SignExtended_o),
        .RegDst_o(RegDst_o),
        .ALUOp_o(ALUOp_o),
        .ALUSrc_o(ALUSrc_o),
        .RegWrite_o(RegWrite_o),
        .MemToReg_o(MemToReg_o),
        .MemRead_o(MemRead_o),
        .MemWrite_o(MemWrite_o),
        .PC_branch_select_o(PC_branch_select_o),
        .RSaddr_o(RSaddr_o),
        .RTaddr_o(RTaddr_o)
    );

    initial begin
        // Initialize inputs
        clk_i = 0;
        start_i = 0;
        inst_i = 32'hDEADBEEF;
        pc_i = 32'h00000001;
        RDData0_i = 32'h00000002;
        RDData1_i = 32'h00000003;
        SignExtended_i = 32'h00000004;
        RegDst_i = 5'b00001;
        ALUOp_i = 2'b01;
        ALUSrc_i = 1;
        RegWrite_i = 1;
        MemToReg_i = 0;
        MemRead_i = 1;
        MemWrite_i = 0;
        pcEx_i = 32'h00000005;
        PC_branch_select_i = 1;
        RSaddr_i = 5'b00010;
        RTaddr_i = 5'b00011;

        // Apply reset
        #5 start_i = 1; // Release reset
        #5;

        // Check outputs after first clock cycle
        clk_i = 1; #5;
        if (inst_o !== inst_i) $display("FAIL: inst_o mismatch");
        if (pc_o !== pc_i) $display("FAIL: pc_o mismatch");
        if (RDData0_o !== RDData0_i) $display("FAIL: RDData0_o mismatch");
        if (RDData1_o !== RDData1_i) $display("FAIL: RDData1_o mismatch");
        if (SignExtended_o !== SignExtended_i) $display("FAIL: SignExtended_o mismatch");
        if (RegDst_o !== RegDst_i) $display("FAIL: RegDst_o mismatch");
        if (ALUOp_o !== ALUOp_i) $display("FAIL: ALUOp_o mismatch");
        if (ALUSrc_o !== ALUSrc_i) $display("FAIL: ALUSrc_o mismatch");
        if (RegWrite_o !== RegWrite_i) $display("FAIL: RegWrite_o mismatch");
        if (MemToReg_o !== MemToReg_i) $display("FAIL: MemToReg_o mismatch");
        if (MemRead_o !== MemRead_i) $display("FAIL: MemRead_o mismatch");
        if (MemWrite_o !== MemWrite_i) $display("FAIL: MemWrite_o mismatch");
        if (pcEx_o !== pcEx_i) $display("FAIL: pcEx_o mismatch");
        if (PC_branch_select_o !== PC_branch_select_i) $display("FAIL: PC_branch_select_o mismatch");
        if (RSaddr_o !== RSaddr_i) $display("FAIL: RSaddr_o mismatch");
        if (RTaddr_o !== RTaddr_i) $display("FAIL: RTaddr_o mismatch");

        // Check outputs after second clock cycle
        clk_i = 0; #5;
        clk_i = 1; #5;
        if (inst_o !== inst_i) $display("FAIL: inst_o mismatch on second cycle");
        
        // Reset the module
        start_i = 0; #5;
        clk_i = 1; #5;

        // Check outputs after reset
        if (inst_o !== 0) $display("FAIL: inst_o should be 0 after reset");
        if (pc_o !== 0) $display("FAIL: pc_o should be 0 after reset");
        if (RDData0_o !== 0) $display("FAIL: RDData0_o should be 0 after reset");
        if (RDData1_o !== 0) $display("FAIL: RDData1_o should be 0 after reset");
        if (SignExtended_o !== 0) $display("FAIL: SignExtended_o should be 0 after reset");
        if (RegDst_o !== 0) $display("FAIL: RegDst_o should be 0 after reset");
        if (ALUOp_o !== 0) $display("FAIL: ALUOp_o should be 0 after reset");
        if (ALUSrc_o !== 0) $display("FAIL: ALUSrc_o should be 0 after reset");
        if (RegWrite_o !== 0) $display("FAIL: RegWrite_o should be 0 after reset");
        if (MemToReg_o !== 0) $display("FAIL: MemToReg_o should be 0 after reset");
        if (MemRead_o !== 0) $display("FAIL: MemRead_o should be 0 after reset");
        if (MemWrite_o !== 0) $display("FAIL: MemWrite_o should be 0 after reset");
        if (pcEx_o !== 0) $display("FAIL: pcEx_o should be 0 after reset");
        if (PC_branch_select_o !== 0) $display("FAIL: PC_branch_select_o should be 0 after reset");
        if (RSaddr_o !== 0) $display("FAIL: RSaddr_o should be 0 after reset");
        if (RTaddr_o !== 0) $display("FAIL: RTaddr_o should be 0 after reset");

        $display("PASS");
        $finish;
    end

    always #5 clk_i = ~clk_i;

endmodule