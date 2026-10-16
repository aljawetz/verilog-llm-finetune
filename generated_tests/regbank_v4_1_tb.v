`timescale 1ns/1ps

module tb_regbank_v4;

    reg clk;
    reg write;
    reg reset;
    reg [4:0] sr1;
    reg [4:0] sr2;
    reg [4:0] dr;
    reg [31:0] wrData;
    wire [31:0] rdData1;
    wire [31:0] rdData2;

    // Instantiate the module under test (uut)
    regbank_v4 uut (
        .rdData1(rdData1),
        .rdData2(rdData2),
        .wrData(wrData),
        .sr1(sr1),
        .sr2(sr2),
        .dr(dr),
        .write(write),
        .reset(reset),
        .clk(clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        write = 0;
        sr1 = 5'b00000;
        sr2 = 5'b00000;
        dr = 5'b00000;
        wrData = 32'h00000000;

        // Wait for a clock cycle
        #10;

        // Release reset
        reset = 0;

        // Test writing to register 1
        dr = 5'b00001;
        wrData = 32'hDEADBEEF;
        write = 1;
        #10;
        write = 0;

        // Check if register 1 has the correct value
        sr1 = 5'b00001;
        #10;
        if (rdData1 !== 32'hDEADBEEF) begin
            $display("FAIL: Register 1 did not hold the expected value.");
            $finish;
        end

        // Test writing to register 2
        dr = 5'b00010;
        wrData = 32'hCAFEBABE;
        write = 1;
        #10;
        write = 0;

        // Check if register 2 has the correct value
        sr2 = 5'b00010;
        #10;
        if (rdData2 !== 32'hCAFEBABE) begin
            $display("FAIL: Register 2 did not hold the expected value.");
            $finish;
        end

        // Test reset functionality
        reset = 1;
        #10;
        reset = 0;

        // Check if registers are cleared
        sr1 = 5'b00001;
        sr2 = 5'b00010;
        #10;
        if (rdData1 !== 32'h00000000) begin
            $display("FAIL: Register 1 was not cleared on reset.");
            $finish;
        end
        if (rdData2 !== 32'h00000000) begin
            $display("FAIL: Register 2 was not cleared on reset.");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule