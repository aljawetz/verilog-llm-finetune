`timescale 1ns/1ps

module tb_Comparater_n_bit;

reg [31:0] a;
reg [31:0] b;
wire l, e, h;

Comparater_n_bit uut (
    .a(a),
    .b(b),
    .l(l),
    .e(e),
    .h(h)
);

initial begin
    // Test case 1: a > b
    a = 32'h00000005; // 5
    b = 32'h00000003; // 3
    #10;
    if (l !== 0 || e !== 0 || h !== 1) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a < b
    a = 32'h00000002; // 2
    b = 32'h00000004; // 4
    #10;
    if (l !== 1 || e !== 0 || h !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a == b
    a = 32'h00000007; // 7
    b = 32'h00000007; // 7
    #10;
    if (l !== 0 || e !== 1 || h !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a = 0, b = 0
    a = 32'h00000000; // 0
    b = 32'h00000000; // 0
    #10;
    if (l !== 0 || e !== 1 || h !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: a = max, b = min
    a = 32'hFFFFFFFF; // max
    b = 32'h00000000; // min
    #10;
    if (l !== 0 || e !== 0 || h !== 1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: a = min, b = max
    a = 32'h00000000; // min
    b = 32'hFFFFFFFF; // max
    #10;
    if (l !== 1 || e !== 0 || h !== 0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule