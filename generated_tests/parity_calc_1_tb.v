`timescale 1ns/1ps

module tb_parity_calc;

    parameter WIDTH = 8;
    reg [WIDTH-1:0] P_DATA;
    reg PAR_TYP;
    reg clk;
    reg rst;
    wire parity_bit;

    // Instantiate the module under test
    parity_calc #(.WIDTH(WIDTH)) uut (
        .P_DATA(P_DATA),
        .PAR_TYP(PAR_TYP),
        .clk(clk),
        .rst(rst),
        .parity_bit(parity_bit)
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
        P_DATA = 8'b00000000;
        PAR_TYP = 0;

        // Apply reset
        #10 rst = 0; // Deassert reset
        #10 rst = 1; // Assert reset again

        // Test case 1: P_DATA = 8'b00000000, PAR_TYP = 0 (even parity)
        P_DATA = 8'b00000000; PAR_TYP = 0; #10;
        if (parity_bit !== 1'b1) $display("FAIL: Test case 1 failed, expected parity_bit = 1, got %b", parity_bit);

        // Test case 2: P_DATA = 8'b00000001, PAR_TYP = 0 (even parity)
        P_DATA = 8'b00000001; PAR_TYP = 0; #10;
        if (parity_bit !== 1'b0) $display("FAIL: Test case 2 failed, expected parity_bit = 0, got %b", parity_bit);

        // Test case 3: P_DATA = 8'b00000011, PAR_TYP = 0 (even parity)
        P_DATA = 8'b00000011; PAR_TYP = 0; #10;
        if (parity_bit !== 1'b0) $display("FAIL: Test case 3 failed, expected parity_bit = 0, got %b", parity_bit);

        // Test case 4: P_DATA = 8'b00000011, PAR_TYP = 1 (odd parity)
        PAR_TYP = 1; #10;
        if (parity_bit !== 1'b1) $display("FAIL: Test case 4 failed, expected parity_bit = 1, got %b", parity_bit);

        // Test case 5: P_DATA = 8'b11111111, PAR_TYP = 0 (even parity)
        P_DATA = 8'b11111111; PAR_TYP = 0; #10;
        if (parity_bit !== 1'b0) $display("FAIL: Test case 5 failed, expected parity_bit = 0, got %b", parity_bit);

        // Test case 6: P_DATA = 8'b11111111, PAR_TYP = 1 (odd parity)
        PAR_TYP = 1; #10;
        if (parity_bit !== 1'b1) $display("FAIL: Test case 6 failed, expected parity_bit = 1, got %b", parity_bit);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule