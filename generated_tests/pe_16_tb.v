`timescale 1ns/1ps

module tb_pe;

    parameter FEATURE_WD = 8;
    parameter WEIGHT_WD = 8;
    parameter PE_OUTPUT_WD = 18;

    reg clk;
    reg rstn;
    reg clr_i;
    reg signed [FEATURE_WD-1:0] pe_row_input;
    reg signed [WEIGHT_WD-1:0] pe_row_weight;
    wire [PE_OUTPUT_WD-1:0] pe_row_output;
    reg [1:0] pe_col_vld;
    reg [1:0] pe_row_vld;
    reg [1:0] pe_array_vld;

    // Instantiate the module under test
    pe #(
        .FEATURE_WD(FEATURE_WD),
        .WEIGHT_WD(WEIGHT_WD),
        .PE_OUTPUT_WD(PE_OUTPUT_WD)
    ) uut (
        .clk(clk),
        .rstn(rstn),
        .clr_i(clr_i),
        .pe_row_input(pe_row_input),
        .pe_row_weight(pe_row_weight),
        .pe_row_output(pe_row_output),
        .pe_col_vld(pe_col_vld),
        .pe_row_vld(pe_row_vld),
        .pe_array_vld(pe_array_vld)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rstn = 0;
        clr_i = 0;
        pe_row_input = 0;
        pe_row_weight = 0;
        pe_col_vld = 2'b00;
        pe_row_vld = 2'b00;
        pe_array_vld = 2'b00;

        // Reset the module
        #10;
        rstn = 1;

        // Test case 1: Normal operation
        pe_row_input = 8'sd3; // Input feature
        pe_row_weight = 8'sd2; // Weight
        pe_col_vld = 2'b11; // Valid
        pe_row_vld = 2'b11; // Valid
        pe_array_vld = 2'b11; // Valid
        #10; // Wait for one clock cycle
        if (pe_row_output !== 18'sd6) begin
            $display("FAIL: Expected output 6, got %d", pe_row_output);
            $finish;
        end

        // Test case 2: Accumulation
        pe_row_input = 8'sd1; // New input feature
        pe_row_weight = 8'sd4; // New weight
        #10; // Wait for one clock cycle
        if (pe_row_output !== 18'sd10) begin
            $display("FAIL: Expected output 10, got %d", pe_row_output);
            $finish;
        end

        // Test case 3: Clear operation
        clr_i = 1; // Trigger clear
        #10; // Wait for one clock cycle
        clr_i = 0; // Release clear
        if (pe_row_output !== 18'sd0) begin
            $display("FAIL: Expected output 0 after clear, got %d", pe_row_output);
            $finish;
        end

        // Test case 4: Reset operation
        rstn = 0; // Trigger reset
        #10; // Wait for one clock cycle
        rstn = 1; // Release reset
        if (pe_row_output !== 18'sd0) begin
            $display("FAIL: Expected output 0 after reset, got %d", pe_row_output);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule