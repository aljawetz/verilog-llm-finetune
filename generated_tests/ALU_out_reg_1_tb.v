`timescale 1ns/1ps

module tb_ALU_out_reg;

    reg rst;
    reg clk;
    reg [31:0] ALUResult;
    wire [31:0] ALUOut;

    // Instantiate the module under test
    ALU_out_reg uut (
        .rst(rst),
        .clk(clk),
        .ALUResult(ALUResult),
        .ALUOut(ALUOut)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        ALUResult = 32'hA5A5A5A5; // Some test value

        // Test 1: Check reset functionality
        rst = 0; // Assert reset
        #10; // Wait for a clock edge
        if (ALUOut !== 32'h00000000) begin
            $display("FAIL: Reset did not set ALUOut to zero");
            $finish;
        end

        // Test 2: Check ALUResult loading
        rst = 1; // Deassert reset
        #10; // Wait for a clock edge
        ALUResult = 32'hDEADBEEF; // New test value
        #10; // Wait for another clock edge
        if (ALUOut !== 32'hDEADBEEF) begin
            $display("FAIL: ALUOut did not update to ALUResult");
            $finish;
        end

        // Test 3: Check multiple updates
        ALUResult = 32'h12345678; // Change ALUResult
        #10; // Wait for clock edge
        if (ALUOut !== 32'h12345678) begin
            $display("FAIL: ALUOut did not update to new ALUResult");
            $finish;
        end

        // Test 4: Check reset again
        rst = 0; // Assert reset
        #10; // Wait for a clock edge
        if (ALUOut !== 32'h00000000) begin
            $display("FAIL: Reset did not set ALUOut to zero again");
            $finish;
        end

        // Test 5: Final check after reset
        rst = 1; // Deassert reset
        ALUResult = 32'hFFFFFFFF; // Another test value
        #10; // Wait for clock edge
        if (ALUOut !== 32'hFFFFFFFF) begin
            $display("FAIL: ALUOut did not update to ALUResult after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule