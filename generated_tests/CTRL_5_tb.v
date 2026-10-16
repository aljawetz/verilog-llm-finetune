`timescale 1ns/1ps

module tb_CTRL;

    // Parameters
    reg CLK;
    reg RSTn;
    reg START;
    wire DONE;
    wire SEL_EXTN;
    wire SEL_ITR;
    wire [3:0] SEL_PERMW;
    wire [3:0] SEL_PERMR;
    wire [3:0] SEL_HRMF;
    wire WE_FSC;
    wire WE_IOBUF;
    wire [11:0] ADDR0_FSC;
    wire [11:0] ADDR1_FSC;
    wire [11:0] ADDR2_FSC;
    wire [11:0] ADDR3_FSC;
    wire [11:0] ADDR4_FSC;
    wire [11:0] ADDR5_FSC;
    wire [11:0] ADDR6_FSC;
    wire [11:0] ADDR7_FSC;
    wire [11:0] ADDR8_FSC;
    wire [11:0] ADDR9_FSC;
    wire [11:0] ADDR10_FSC;
    wire [11:0] ADDR11_FSC;
    wire [11:0] ADDR12_FSC;
    wire [11:0] ADDR13_FSC;
    wire [11:0] ADDR14_FSC;
    wire [11:0] ADDR15_FSC;
    wire [11:0] ADDR0_IOBUF;
    wire [11:0] ADDR1_IOBUF;
    wire [11:0] ADDR2_IOBUF;
    wire [11:0] ADDR3_IOBUF;
    wire [11:0] ADDR4_IOBUF;
    wire [11:0] ADDR5_IOBUF;
    wire [11:0] ADDR6_IOBUF;
    wire [11:0] ADDR7_IOBUF;
    wire [11:0] ADDR8_IOBUF;
    wire [11:0] ADDR9_IOBUF;
    wire [11:0] ADDR10_IOBUF;
    wire [11:0] ADDR11_IOBUF;
    wire [11:0] ADDR12_IOBUF;
    wire [11:0] ADDR13_IOBUF;
    wire [11:0] ADDR14_IOBUF;
    wire [11:0] ADDR15_IOBUF;
    wire [15:0] EXP0;
    wire [15:0] EXP1;
    wire [15:0] EXP2;
    wire [15:0] EXP3;
    wire [15:0] EXP4;
    wire [15:0] EXP5;
    wire [15:0] EXP6;
    wire [15:0] EXP7;
    wire [15:0] EXP8;
    wire [15:0] EXP9;
    wire [15:0] EXP10;
    wire [15:0] EXP11;
    wire [15:0] EXP12;
    wire [15:0] EXP13;
    wire [15:0] EXP14;
    wire [15:0] EXP15;

    // Instantiate the module under test
    CTRL uut (
        .CLK(CLK),
        .RSTn(RSTn),
        .START(START),
        .DONE(DONE),
        .SEL_EXTN(SEL_EXTN),
        .SEL_ITR(SEL_ITR),
        .SEL_PERMW(SEL_PERMW),
        .SEL_PERMR(SEL_PERMR),
        .SEL_HRMF(SEL_HRMF),
        .WE_FSC(WE_FSC),
        .WE_IOBUF(WE_IOBUF),
        .ADDR0_FSC(ADDR0_FSC),
        .ADDR1_FSC(ADDR1_FSC),
        .ADDR2_FSC(ADDR2_FSC),
        .ADDR3_FSC(ADDR3_FSC),
        .ADDR4_FSC(ADDR4_FSC),
        .ADDR5_FSC(ADDR5_FSC),
        .ADDR6_FSC(ADDR6_FSC),
        .ADDR7_FSC(ADDR7_FSC),
        .ADDR8_FSC(ADDR8_FSC),
        .ADDR9_FSC(ADDR9_FSC),
        .ADDR10_FSC(ADDR10_FSC),
        .ADDR11_FSC(ADDR11_FSC),
        .ADDR12_FSC(ADDR12_FSC),
        .ADDR13_FSC(ADDR13_FSC),
        .ADDR14_FSC(ADDR14_FSC),
        .ADDR15_FSC(ADDR15_FSC),
        .ADDR0_IOBUF(ADDR0_IOBUF),
        .ADDR1_IOBUF(ADDR1_IOBUF),
        .ADDR2_IOBUF(ADDR2_IOBUF),
        .ADDR3_IOBUF(ADDR3_IOBUF),
        .ADDR4_IOBUF(ADDR4_IOBUF),
        .ADDR5_IOBUF(ADDR5_IOBUF),
        .ADDR6_IOBUF(ADDR6_IOBUF),
        .ADDR7_IOBUF(ADDR7_IOBUF),
        .ADDR8_IOBUF(ADDR8_IOBUF),
        .ADDR9_IOBUF(ADDR9_IOBUF),
        .ADDR10_IOBUF(ADDR10_IOBUF),
        .ADDR11_IOBUF(ADDR11_IOBUF),
        .ADDR12_IOBUF(ADDR12_IOBUF),
        .ADDR13_IOBUF(ADDR13_IOBUF),
        .ADDR14_IOBUF(ADDR14_IOBUF),
        .ADDR15_IOBUF(ADDR15_IOBUF),
        .EXP0(EXP0),
        .EXP1(EXP1),
        .EXP2(EXP2),
        .EXP3(EXP3),
        .EXP4(EXP4),
        .EXP5(EXP5),
        .EXP6(EXP6),
        .EXP7(EXP7),
        .EXP8(EXP8),
        .EXP9(EXP9),
        .EXP10(EXP10),
        .EXP11(EXP11),
        .EXP12(EXP12),
        .EXP13(EXP13),
        .EXP14(EXP14),
        .EXP15(EXP15)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize signals
        RSTn = 0;
        START = 0;

        // Release reset
        #10;
        RSTn = 1;

        // Start the FSM
        #10;
        START = 1;

        // Wait for DONE signal
        wait(DONE);
        #10;

        // Check outputs after DONE
        if (SEL_EXTN !== 1'b1) begin
            $display("FAIL: SEL_EXTN should be 1 after DONE");
            $finish;
        end

        if (SEL_ITR !== 1'b0) begin
            $display("FAIL: SEL_ITR should be 0 after DONE");
            $finish;
        end

        // Check if write enables are correct
        if (WE_FSC !== 1'b0) begin
            $display("FAIL: WE_FSC should be 0 after DONE");
            $finish;
        end

        if (WE_IOBUF !== 1'b0) begin
            $display("FAIL: WE_IOBUF should be 0 after DONE");
            $finish;
        end

        // Check address outputs
        if (ADDR0_FSC !== 12'b0) begin
            $display("FAIL: ADDR0_FSC should be 0 after DONE");
            $finish;
        end

        // Check exponent outputs
        if (EXP0 !== 16'b0) begin
            $display("FAIL: EXP0 should be 0 after DONE");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule