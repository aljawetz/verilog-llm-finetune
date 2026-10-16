`timescale 1ns/1ps

module tb_ctl1;

// Inputs
reg i_inverse;
reg i_valid;

// Outputs
wire o_valid0;
wire o_valid1;

// Instantiate the Unit Under Test (UUT)
ctl1 uut (
    .i_inverse(i_inverse),
    .i_valid(i_valid),
    .o_valid0(o_valid0),
    .o_valid1(o_valid1)
);

// Test procedure
initial begin
    // Test case 1: i_inverse = 1, i_valid = 1
    i_inverse = 1;
    i_valid = 1;
    #10;
    if (o_valid0 !== 1'b1 || o_valid1 !== 1'b0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: i_inverse = 1, i_valid = 0
    i_inverse = 1;
    i_valid = 0;
    #10;
    if (o_valid0 !== 1'b0 || o_valid1 !== 1'b0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: i_inverse = 0, i_valid = 1
    i_inverse = 0;
    i_valid = 1;
    #10;
    if (o_valid0 !== 1'b0 || o_valid1 !== 1'b1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: i_inverse = 0, i_valid = 0
    i_inverse = 0;
    i_valid = 0;
    #10;
    if (o_valid0 !== 1'b0 || o_valid1 !== 1'b0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule