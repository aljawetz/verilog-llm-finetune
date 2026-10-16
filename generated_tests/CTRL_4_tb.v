`timescale 1ns/1ps

module tb_CTRL;

    // Parameters
    reg CLK;
    reg RSTn;
    reg START;
    wire DONE;
    wire SEL_EXTN;
    wire SEL_ITR;
    wire [2:0] SEL_PERMW;
    wire [2:0] SEL_PERMR;
    wire [2:0] SEL_HRMF;
    wire WE_FSC;
    wire WE_IOBUF;
    wire [8:0] ADDR0_FSC;
    wire [8:0] ADDR1_FSC;
    wire [8:0] ADDR2_FSC;
    wire [8:0] ADDR3_FSC;
    wire [8:0] ADDR4_FSC;
    wire [8:0] ADDR5_FSC;
    wire [8:0] ADDR6_FSC;
    wire [8:0] ADDR7_FSC;
    wire [8:0] ADDR0_IOBUF;
    wire [8:0] ADDR1_IOBUF;
    wire [8:0] ADDR2_IOBUF;
    wire [8:0] ADDR3_IOBUF;
    wire [8:0] ADDR4_IOBUF;
    wire [8:0] ADDR5_IOBUF;
    wire [8:0] ADDR6_IOBUF;
    wire [8:0] ADDR7_IOBUF;
    wire [11:0] EXP0;
    wire [11:0] EXP1;
    wire [11:0] EXP2;
    wire [11:0] EXP3;
    wire [11:0] EXP4;
    wire [11:0] EXP5;
    wire [11:0] EXP6;
    wire [11:0] EXP7;

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
        .ADDR0_IOBUF(ADDR0_IOBUF),
        .ADDR1_IOBUF(ADDR1_IOBUF),
        .ADDR2_IOBUF(ADDR2_IOBUF),
        .ADDR3_IOBUF(ADDR3_IOBUF),
        .ADDR4_IOBUF(ADDR4_IOBUF),
        .ADDR5_IOBUF(ADDR5_IOBUF),
        .ADDR6_IOBUF(ADDR6_IOBUF),
        .ADDR7_IOBUF(ADDR7_IOBUF),
        .EXP0(EXP0),
        .EXP1(EXP1),
        .EXP2(EXP2),
        .EXP3(EXP3),
        .EXP4(EXP4),
        .EXP5(EXP5),
        .EXP6(EXP6),
        .EXP7(EXP7)
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

        if (ADDR0_FSC !== 9'd0) begin
            $display("FAIL: ADDR0_FSC should be 0 after DONE");
            $finish;
        end

        if (ADDR1_FSC !== 9'd0) begin
            $display("FAIL: ADDR1_FSC should be 0 after DONE");
            $finish;
        end

        if (EXP0 !== 12'd0) begin
            $display("FAIL: EXP0 should be 0 after DONE");
            $finish;
        end

        // Additional checks can be added here

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule