`timescale 1ns/1ps

module tb_commutator;

reg [15:0] in1_r;
reg [15:0] in1_i;
reg [15:0] in2_r;
reg [15:0] in2_i;
reg swap;
wire [15:0] out1_r;
wire [15:0] out1_i;
wire [15:0] out2_r;
wire [15:0] out2_i;

commutator uut (
    .in1_r(in1_r),
    .in1_i(in1_i),
    .in2_r(in2_r),
    .in2_i(in2_i),
    .out1_r(out1_r),
    .out1_i(out1_i),
    .out2_r(out2_r),
    .out2_i(out2_i),
    .swap(swap)
);

initial begin
    // Test case 1: No swap
    in1_r = 16'h0001; in1_i = 16'h0002;
    in2_r = 16'h0003; in2_i = 16'h0004;
    swap = 0;
    #10;
    if (out1_r !== 16'h0001 || out1_i !== 16'h0002 || out2_r !== 16'h0003 || out2_i !== 16'h0004) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Swap
    swap = 1;
    #10;
    if (out1_r !== 16'h0003 || out1_i !== 16'h0004 || out2_r !== 16'h0001 || out2_i !== 16'h0002) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Negative values with no swap
    in1_r = 16'hFFFE; in1_i = 16'hFFFD; // -2, -3
    in2_r = 16'hFFFC; in2_i = 16'hFFFB; // -4, -5
    swap = 0;
    #10;
    if (out1_r !== 16'hFFFE || out1_i !== 16'hFFFD || out2_r !== 16'hFFFC || out2_i !== 16'hFFFB) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Negative values with swap
    swap = 1;
    #10;
    if (out1_r !== 16'hFFFC || out1_i !== 16'hFFFB || out2_r !== 16'hFFFE || out2_i !== 16'hFFFD) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Zero values
    in1_r = 16'h0000; in1_i = 16'h0000;
    in2_r = 16'h0000; in2_i = 16'h0000;
    swap = 0;
    #10;
    if (out1_r !== 16'h0000 || out1_i !== 16'h0000 || out2_r !== 16'h0000 || out2_i !== 16'h0000) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: Zero values with swap
    swap = 1;
    #10;
    if (out1_r !== 16'h0000 || out1_i !== 16'h0000 || out2_r !== 16'h0000 || out2_i !== 16'h0000) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule