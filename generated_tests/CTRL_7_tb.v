`timescale 1ns/1ps

module tb_CTRL;

    // Parameters
    reg CLK;
    reg RSTn;
    reg START;
    wire DONE;
    wire SEL_EXTN;
    wire SEL_ITR;
    wire SEL_PERMW;
    wire SEL_PERMR;
    wire [1:0] SEL_ROT0;
    wire SEL_MDC0;
    wire SEL_ROT1;
    wire SEL_MDC1;
    wire WE_FSC;
    wire WE_IOBUF;
    wire [4:0] ADDR0_FSC;
    wire [4:0] ADDR1_FSC;
    wire [4:0] ADDR0_IOBUF;
    wire [4:0] ADDR1_IOBUF;
    wire [5:0] EXP0;
    wire [5:0] EXP1;

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
        .SEL_ROT0(SEL_ROT0),
        .SEL_MDC0(SEL_MDC0),
        .SEL_ROT1(SEL_ROT1),
        .SEL_MDC1(SEL_MDC1),
        .WE_FSC(WE_FSC),
        .WE_IOBUF(WE_IOBUF),
        .ADDR0_FSC(ADDR0_FSC),
        .ADDR1_FSC(ADDR1_FSC),
        .ADDR0_IOBUF(ADDR0_IOBUF),
        .ADDR1_IOBUF(ADDR1_IOBUF),
        .EXP0(EXP0),
        .EXP1(EXP1)
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
        #10 RSTn = 1;

        // Test 1: Start the FSM
        #10 START = 1; // Start the process
        #10 START = 0; // Release start signal

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

        if (WE_FSC !== 1'b0) begin
            $display("FAIL: WE_FSC should be 0 after DONE");
            $finish;
        end

        if (WE_IOBUF !== 1'b0) begin
            $display("FAIL: WE_IOBUF should be 0 after DONE");
            $finish;
        end

        // Test 2: Check address outputs
        #10;
        if (ADDR0_FSC !== 5'b00000 || ADDR1_FSC !== 5'b00000) begin
            $display("FAIL: ADDR0_FSC and ADDR1_FSC should be 0 after DONE");
            $finish;
        end

        // Test 3: Check exponent outputs
        if (EXP0 !== 6'b000000 || EXP1 !== 6'b000000) begin
            $display("FAIL: EXP0 and EXP1 should be 0 after DONE");
            $finish;
        end

        // Test 4: Reset functionality
        #10 RSTn = 0; // Assert reset
        #10 RSTn = 1; // Release reset

        // Check outputs after reset
        if (DONE !== 1'b0) begin
            $display("FAIL: DONE should be 0 after reset");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule