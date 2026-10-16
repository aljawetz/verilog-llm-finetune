`timescale 1ns/1ps

module tb_LOGIC_UNIT;

    reg [15:0] A;
    reg [15:0] B;
    reg [1:0] ALU_FUN;
    reg CLK;
    reg RST;
    reg Logic_Enable;
    wire [15:0] Logic_OUT;
    wire Logic_Flag;

    // Instantiate the module under test (uut)
    LOGIC_UNIT uut (
        .A(A),
        .B(B),
        .ALU_FUN(ALU_FUN),
        .CLK(CLK),
        .RST(RST),
        .Logic_Enable(Logic_Enable),
        .Logic_OUT(Logic_OUT),
        .Logic_Flag(Logic_Flag)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        RST = 0;
        Logic_Enable = 0;
        A = 16'h0000;
        B = 16'h0000;
        ALU_FUN = 2'b00;

        // Apply reset
        #10 RST = 1; // Release reset
        #10;

        // Test AND operation
        A = 16'hF0F0; B = 16'h0F0F; ALU_FUN = 2'b00; Logic_Enable = 1;
        #10;
        if (Logic_OUT !== (A & B) || Logic_Flag !== 1) begin
            $display("FAIL: AND operation failed");
            $finish;
        end

        // Test OR operation
        A = 16'hF0F0; B = 16'h0F0F; ALU_FUN = 2'b01;
        #10;
        if (Logic_OUT !== (A | B) || Logic_Flag !== 1) begin
            $display("FAIL: OR operation failed");
            $finish;
        end

        // Test NAND operation
        A = 16'hF0F0; B = 16'h0F0F; ALU_FUN = 2'b10;
        #10;
        if (Logic_OUT !== ~(A & B) || Logic_Flag !== 1) begin
            $display("FAIL: NAND operation failed");
            $finish;
        end

        // Test NOR operation
        A = 16'hF0F0; B = 16'h0F0F; ALU_FUN = 2'b11;
        #10;
        if (Logic_OUT !== ~(A | B) || Logic_Flag !== 1) begin
            $display("FAIL: NOR operation failed");
            $finish;
        end

        // Test with Logic_Enable = 0
        Logic_Enable = 0;
        #10;
        if (Logic_OUT !== 16'b0 || Logic_Flag !== 0) begin
            $display("FAIL: Logic_Enable = 0 failed");
            $finish;
        end

        // Test reset functionality
        RST = 0;
        #10;
        if (Logic_OUT !== 16'b0 || Logic_Flag !== 0) begin
            $display("FAIL: Reset functionality failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule