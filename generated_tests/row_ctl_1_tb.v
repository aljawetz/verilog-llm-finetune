`timescale 1ns/1ps

module tb_row_ctl;

reg clk;
reg rst_n;
reg i_valid0;
reg i_valid1;
wire o_row;

// Instantiate the module under test
row_ctl uut (
    .clk(clk),
    .rst_n(rst_n),
    .i_valid0(i_valid0),
    .i_valid1(i_valid1),
    .o_row(o_row)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    rst_n = 0;
    i_valid0 = 0;
    i_valid1 = 0;

    // Apply reset
    #10;
    rst_n = 1; // Release reset

    // Test case 1: Check reset state
    #10;
    if (o_row !== 1'b0) begin
        $display("FAIL: o_row should be 0 after reset");
        $finish;
    end

    // Test case 2: Set i_valid1 high
    #10;
    i_valid1 = 1;
    #10;
    if (o_row !== 1'b1) begin
        $display("FAIL: o_row should be 1 when i_valid1 is high");
        $finish;
    end
    i_valid1 = 0; // Clear i_valid1

    // Test case 3: Set i_valid0 high
    #10;
    i_valid0 = 1;
    #10;
    if (o_row !== 1'b0) begin
        $display("FAIL: o_row should be 0 when i_valid0 is high");
        $finish;
    end
    i_valid0 = 0; // Clear i_valid0

    // Test case 4: Check priority of i_valid1 over i_valid0
    #10;
    i_valid1 = 1;
    i_valid0 = 1; // Both valid signals high
    #10;
    if (o_row !== 1'b1) begin
        $display("FAIL: o_row should be 1 when both i_valid1 and i_valid0 are high, priority to i_valid1");
        $finish;
    end

    // Test case 5: Clear i_valid1 and set i_valid0
    #10;
    i_valid1 = 0;
    #10;
    i_valid0 = 1;
    #10;
    if (o_row !== 1'b0) begin
        $display("FAIL: o_row should be 0 when only i_valid0 is high");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule