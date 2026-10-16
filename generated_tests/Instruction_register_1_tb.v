`timescale 1ns/1ps

module tb_Instruction_register;

    reg rst;
    reg clk;
    reg IRWrite;
    reg [31:0] mem_data;
    reg [31:0] PC;
    wire [31:0] OldPC;
    wire [31:0] Instr;

    // Instantiate the module under test (uut)
    Instruction_register uut (
        .rst(rst),
        .clk(clk),
        .IRWrite(IRWrite),
        .mem_data(mem_data),
        .PC(PC),
        .OldPC(OldPC),
        .Instr(Instr)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        IRWrite = 0;
        mem_data = 32'h00000000;
        PC = 32'h00000000;

        // Apply reset
        #10 rst = 0; // Assert reset
        #10 rst = 1; // Deassert reset

        // Check initial values after reset
        if (OldPC !== 32'h00000000 || Instr !== 32'h00000000) begin
            $display("FAIL: Initial values after reset are incorrect");
            $finish;
        end

        // Test writing to the instruction register
        PC = 32'h00000001;
        mem_data = 32'hDEADBEEF;
        IRWrite = 1; // Enable write
        #10; // Wait for clock edge

        if (OldPC !== 32'h00000001 || Instr !== 32'hDEADBEEF) begin
            $display("FAIL: Values after write are incorrect");
            $finish;
        end

        // Test with IRWrite inactive
        IRWrite = 0;
        PC = 32'h00000002;
        mem_data = 32'hCAFEBABE;
        #10; // Wait for clock edge

        if (OldPC !== 32'h00000001 || Instr !== 32'hDEADBEEF) begin
            $display("FAIL: Values should not change when IRWrite is inactive");
            $finish;
        end

        // Test another write
        IRWrite = 1; // Enable write
        PC = 32'h00000003;
        mem_data = 32'h12345678;
        #10; // Wait for clock edge

        if (OldPC !== 32'h00000003 || Instr !== 32'h12345678) begin
            $display("FAIL: Values after second write are incorrect");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule