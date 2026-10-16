`timescale 1ns/1ps

module tb_forwarding;

    // Inputs
    reg [15:0] EXDM_ALU;
    reg [15:0] EXDM_PC;
    reg [15:0] DMWB_PC;
    reg [15:0] DMWB_ALU;
    reg [15:0] DMWB_readData;
    reg [1:0] DMWB_RegSrc;
    reg [1:0] EXDM_RegSrc;
    reg [15:0] EXDM_RTData;
    reg takeRs_EXDM;
    reg takeRt_EXDM;
    reg takeRs_DMWB;
    reg takeRt_DMWB;

    // Outputs
    wire [1:0] A_Sel;
    wire [1:0] B_Sel;
    wire [15:0] EXDM_RD_Data;
    wire [15:0] DMWB_RD_Data;

    // Instantiate the Unit Under Test (UUT)
    forwarding uut (
        .EXDM_ALU(EXDM_ALU),
        .EXDM_PC(EXDM_PC),
        .DMWB_PC(DMWB_PC),
        .DMWB_ALU(DMWB_ALU),
        .DMWB_readData(DMWB_readData),
        .DMWB_RegSrc(DMWB_RegSrc),
        .EXDM_RegSrc(EXDM_RegSrc),
        .EXDM_RTData(EXDM_RTData),
        .takeRs_EXDM(takeRs_EXDM),
        .takeRt_EXDM(takeRt_EXDM),
        .takeRs_DMWB(takeRs_DMWB),
        .takeRt_DMWB(takeRt_DMWB),
        .A_Sel(A_Sel),
        .B_Sel(B_Sel),
        .EXDM_RD_Data(EXDM_RD_Data),
        .DMWB_RD_Data(DMWB_RD_Data)
    );

    initial begin
        // Test case 1: Forward EXDM_PC
        EXDM_ALU = 16'h0001; EXDM_PC = 16'h0002; DMWB_PC = 16'h0003; DMWB_ALU = 16'h0004; DMWB_readData = 16'h0005;
        EXDM_RegSrc = 2'b00; DMWB_RegSrc = 2'b00; takeRs_EXDM = 0; takeRt_EXDM = 0; takeRs_DMWB = 0; takeRt_DMWB = 0;
        #10;
        if (EXDM_RD_Data !== 16'h0002) $display("FAIL: Test case 1 failed for EXDM_RD_Data");
        if (DMWB_RD_Data !== 16'h0003) $display("FAIL: Test case 1 failed for DMWB_RD_Data");

        // Test case 2: Forward EXDM_ALU
        EXDM_RegSrc = 2'b10; DMWB_RegSrc = 2'b00; 
        #10;
        if (EXDM_RD_Data !== 16'h0001) $display("FAIL: Test case 2 failed for EXDM_RD_Data");
        if (DMWB_RD_Data !== 16'h0003) $display("FAIL: Test case 2 failed for DMWB_RD_Data");

        // Test case 3: Forward DMWB_readData
        EXDM_RegSrc = 2'b00; DMWB_RegSrc = 2'b01; 
        #10;
        if (EXDM_RD_Data !== 16'h0002) $display("FAIL: Test case 3 failed for EXDM_RD_Data");
        if (DMWB_RD_Data !== 16'h0005) $display("FAIL: Test case 3 failed for DMWB_RD_Data");

        // Test case 4: Select A_Sel and B_Sel
        takeRs_EXDM = 1; takeRt_EXDM = 0; takeRs_DMWB = 0; takeRt_DMWB = 0; 
        #10;
        if (A_Sel !== 2'b01) $display("FAIL: Test case 4 failed for A_Sel");
        if (B_Sel !== 2'b00) $display("FAIL: Test case 4 failed for B_Sel");

        // Test case 5: Select DMWB
        takeRs_EXDM = 0; takeRt_EXDM = 0; takeRs_DMWB = 1; takeRt_DMWB = 0; 
        #10;
        if (A_Sel !== 2'b00) $display("FAIL: Test case 5 failed for A_Sel");
        if (B_Sel !== 2'b10) $display("FAIL: Test case 5 failed for B_Sel");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule