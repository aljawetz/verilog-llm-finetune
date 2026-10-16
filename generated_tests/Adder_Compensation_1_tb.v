`timescale 1ns/1ps

module tb_Adder_Compensation;

parameter DataIN_width = 16;
parameter truncation_width = 6;
parameter DataK_width = 4;

reg [DataK_width+truncation_width:0] AC_OP1;
reg [DataK_width+truncation_width:0] AC_OP2;
wire [DataK_width+truncation_width+1:0] AC_L;

Adder_Compensation #(DataIN_width, truncation_width, DataK_width) uut (
    .AC_OP1(AC_OP1),
    .AC_OP2(AC_OP2),
    .AC_L(AC_L)
);

initial begin
    // Test case 1: Simple addition without overflow
    AC_OP1 = 8; // 0000 1000
    AC_OP2 = 5; // 0000 0101
    #10;
    if (AC_L !== 14) begin
        $display("FAIL: Test case 1 failed, expected 14 but got %d", AC_L);
        $finish;
    end

    // Test case 2: Addition resulting in overflow
    AC_OP1 = 15; // 0000 1111
    AC_OP2 = 15; // 0000 1111
    #10;
    if (AC_L !== 31) begin
        $display("FAIL: Test case 2 failed, expected 31 but got %d", AC_L);
        $finish;
    end

    // Test case 3: Zero inputs
    AC_OP1 = 0; // 0000 0000
    AC_OP2 = 0; // 0000 0000
    #10;
    if (AC_L !== 1) begin
        $display("FAIL: Test case 3 failed, expected 1 but got %d", AC_L);
        $finish;
    end

    // Test case 4: Maximum values for inputs
    AC_OP1 = {1'b1, {DataK_width+truncation_width{1'b0}}}; // 1000 0000 0000 0000
    AC_OP2 = {1'b1, {DataK_width+truncation_width{1'b0}}}; // 1000 0000 0000 0000
    #10;
    if (AC_L !== {1'b1, {DataK_width+truncation_width{1'b0}}} + {1'b1, {DataK_width+truncation_width{1'b0}}} + 1) begin
        $display("FAIL: Test case 4 failed, expected %d but got %d", {1'b1, {DataK_width+truncation_width{1'b0}}} + {1'b1, {DataK_width+truncation_width{1'b0}}} + 1, AC_L);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule