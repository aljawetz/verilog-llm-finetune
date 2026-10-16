`timescale 1ns/1ps

module tb_ForwardingUnit;

    // Inputs
    reg MEMWB_RegWrite_out;
    reg IDEX_MemWrite_out;
    reg [4:0] IR_out_rs1;
    reg [4:0] IDEX_IW_out_rd;
    reg [4:0] IDEX_IW_out_rs1;
    reg [4:0] IDEX_IW_out_rs2;
    reg [4:0] IR_out_rs2;
    reg MEMWB_MemToReg_out;
    reg [4:0] MEMWB_RD;

    // Outputs
    wire [1:0] forwardA;
    wire [1:0] forwardB;

    // Instantiate the Unit Under Test (UUT)
    ForwardingUnit uut (
        .MEMWB_RegWrite_out(MEMWB_RegWrite_out),
        .IDEX_MemWrite_out(IDEX_MemWrite_out),
        .IR_out_rs1(IR_out_rs1),
        .IDEX_IW_out_rd(IDEX_IW_out_rd),
        .IDEX_IW_out_rs1(IDEX_IW_out_rs1),
        .IDEX_IW_out_rs2(IDEX_IW_out_rs2),
        .IR_out_rs2(IR_out_rs2),
        .MEMWB_MemToReg_out(MEMWB_MemToReg_out),
        .MEMWB_RD(MEMWB_RD),
        .forwardA(forwardA),
        .forwardB(forwardB)
    );

    // Clock generation
    reg clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test procedure
    initial begin
        // Initialize inputs
        MEMWB_RegWrite_out = 0;
        IDEX_MemWrite_out = 0;
        IR_out_rs1 = 0;
        IDEX_IW_out_rd = 0;
        IDEX_IW_out_rs1 = 0;
        IDEX_IW_out_rs2 = 0;
        IR_out_rs2 = 0;
        MEMWB_MemToReg_out = 0;
        MEMWB_RD = 0;

        // Test case 1: Forwarding from MEM to EX for rs1
        MEMWB_RegWrite_out = 1;
        MEMWB_RD = 5'b00001; // Assume rd is 1
        IDEX_IW_out_rd = 5'b00001; // Match with rs1
        IDEX_IW_out_rs1 = 5'b00001; // Match with rd
        #10;
        if (forwardA !== 2'b10) $display("FAIL: Test case 1 failed for forwardA");
        
        // Test case 2: Forwarding from MEM to EX for rs2
        IDEX_IW_out_rs2 = 5'b00001; // Match with rd
        #10;
        if (forwardB !== 2'b10) $display("FAIL: Test case 2 failed for forwardB");

        // Test case 3: Forwarding from MEM to EX for rs1 with MemToReg
        MEMWB_MemToReg_out = 1;
        #10;
        if (forwardA !== 2'b01) $display("FAIL: Test case 3 failed for forwardA with MemToReg");

        // Test case 4: Forwarding from MEM to EX for rs2 with MemToReg
        #10;
        if (forwardB !== 2'b01) $display("FAIL: Test case 4 failed for forwardB with MemToReg");

        // Test case 5: No forwarding
        MEMWB_RegWrite_out = 0;
        MEMWB_MemToReg_out = 0;
        IDEX_IW_out_rd = 5'b00010; // Different rd
        #10;
        if (forwardA !== 2'b00 || forwardB !== 2'b00) $display("FAIL: Test case 5 failed for no forwarding");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule