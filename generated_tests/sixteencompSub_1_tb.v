`timescale 1ns/1ps

module tb_sixteencompSub;

reg [15:0] A;
reg [15:0] B;
wire [15:0] Diff;
wire Sign;

sixteencompSub uut (
    .A(A),
    .B(B),
    .Diff(Diff),
    .Sign(Sign)
);

initial begin
    // Test case 1: A = 10, B = 5 (Positive result)
    A = 16'd10; B = 16'd5;
    #10;
    if (Diff !== 16'd5 || Sign !== 1'b0) $display("FAIL: Test case 1 failed");

    // Test case 2: A = 5, B = 10 (Negative result)
    A = 16'd5; B = 16'd10;
    #10;
    if (Diff !== 16'd5 || Sign !== 1'b1) $display("FAIL: Test case 2 failed");

    // Test case 3: A = 0, B = 0 (Zero result)
    A = 16'd0; B = 16'd0;
    #10;
    if (Diff !== 16'd0 || Sign !== 1'b0) $display("FAIL: Test case 3 failed");

    // Test case 4: A = 32767, B = 1 (Positive result)
    A = 16'd32767; B = 16'd1;
    #10;
    if (Diff !== 16'd32766 || Sign !== 1'b0) $display("FAIL: Test case 4 failed");

    // Test case 5: A = 1, B = 32767 (Negative result)
    A = 16'd1; B = 16'd32767;
    #10;
    if (Diff !== 16'd32766 || Sign !== 1'b1) $display("FAIL: Test case 5 failed");

    // Test case 6: A = 12345, B = 12345 (Zero result)
    A = 16'd12345; B = 16'd12345;
    #10;
    if (Diff !== 16'd0 || Sign !== 1'b0) $display("FAIL: Test case 6 failed");

    // Test case 7: A = 16'hFFFF, B = 16'h0001 (Negative result)
    A = 16'hFFFF; B = 16'h0001;
    #10;
    if (Diff !== 16'h0000 || Sign !== 1'b1) $display("FAIL: Test case 7 failed");

    // Test case 8: A = 16'h0001, B = 16'hFFFF (Positive result)
    A = 16'h0001; B = 16'hFFFF;
    #10;
    if (Diff !== 16'h0000 || Sign !== 1'b0) $display("FAIL: Test case 8 failed");

    $display("PASS");
    $finish;
end

endmodule