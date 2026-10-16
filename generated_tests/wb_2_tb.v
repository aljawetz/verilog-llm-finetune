`timescale 1ns/1ps

module tb_wb;

    reg [15:0] MemIn;
    reg [15:0] PcIn;
    reg [15:0] ALUIn;
    reg [1:0] RegSrc;
    reg FWB_err;
    reg DMWB_err;
    wire WB_err;
    wire [15:0] WB;

    // Instantiate the module under test
    wb uut (
        .MemIn(MemIn),
        .PcIn(PcIn),
        .ALUIn(ALUIn),
        .RegSrc(RegSrc),
        .WB(WB),
        .FWB_err(FWB_err),
        .DMWB_err(DMWB_err),
        .WB_err(WB_err)
    );

    initial begin
        // Initialize inputs
        MemIn = 16'h0000;
        PcIn = 16'h0000;
        ALUIn = 16'h0000;
        RegSrc = 2'b00;
        FWB_err = 0;
        DMWB_err = 0;

        // Test case 1: Select PcIn
        PcIn = 16'hAAAA;
        RegSrc = 2'b00;
        #10;
        if (WB !== 16'hAAAA) begin
            $display("FAIL: Test case 1 failed, expected WB = 16'hAAAA, got WB = %h", WB);
            $finish;
        end

        // Test case 2: Select MemIn
        MemIn = 16'h5555;
        RegSrc = 2'b01;
        #10;
        if (WB !== 16'h5555) begin
            $display("FAIL: Test case 2 failed, expected WB = 16'h5555, got WB = %h", WB);
            $finish;
        end

        // Test case 3: Select ALUIn
        ALUIn = 16'hFFFF;
        RegSrc = 2'b10;
        #10;
        if (WB !== 16'hFFFF) begin
            $display("FAIL: Test case 3 failed, expected WB = 16'hFFFF, got WB = %h", WB);
            $finish;
        end

        // Test case 4: Check WB_err with both errors low
        FWB_err = 0;
        DMWB_err = 0;
        #10;
        if (WB_err !== 0) begin
            $display("FAIL: Test case 4 failed, expected WB_err = 0, got WB_err = %b", WB_err);
            $finish;
        end

        // Test case 5: Check WB_err with FWB_err high
        FWB_err = 1;
        #10;
        if (WB_err !== 1) begin
            $display("FAIL: Test case 5 failed, expected WB_err = 1, got WB_err = %b", WB_err);
            $finish;
        end

        // Test case 6: Check WB_err with DMWB_err high
        FWB_err = 0;
        DMWB_err = 1;
        #10;
        if (WB_err !== 1) begin
            $display("FAIL: Test case 6 failed, expected WB_err = 1, got WB_err = %b", WB_err);
            $finish;
        end

        // Test case 7: Check WB_err with both errors high
        FWB_err = 1;
        DMWB_err = 1;
        #10;
        if (WB_err !== 1) begin
            $display("FAIL: Test case 7 failed, expected WB_err = 1, got WB_err = %b", WB_err);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule