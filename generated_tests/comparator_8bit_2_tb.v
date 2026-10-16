`timescale 1ns/1ps

module tb_comparator_8bit;

reg [7:0] a;
reg [7:0] b;
wire lt;
wire gt;
wire eq;

// Instantiate the module under test (uut)
comparator_8bit uut (
    .a(a),
    .b(b),
    .lt(lt),
    .gt(gt),
    .eq(eq)
);

initial begin
    // Test case 1: a > b
    a = 8'd150; b = 8'd100; #10;
    if (lt !== 0 || gt !== 1 || eq !== 0) begin
        $display("FAIL: Test case 1 failed (a > b)");
        $finish;
    end

    // Test case 2: a < b
    a = 8'd50; b = 8'd100; #10;
    if (lt !== 1 || gt !== 0 || eq !== 0) begin
        $display("FAIL: Test case 2 failed (a < b)");
        $finish;
    end

    // Test case 3: a == b
    a = 8'd100; b = 8'd100; #10;
    if (lt !== 0 || gt !== 0 || eq !== 1) begin
        $display("FAIL: Test case 3 failed (a == b)");
        $finish;
    end

    // Test case 4: a > b (boundary case)
    a = 8'd255; b = 8'd0; #10;
    if (lt !== 0 || gt !== 1 || eq !== 0) begin
        $display("FAIL: Test case 4 failed (a > b boundary case)");
        $finish;
    end

    // Test case 5: a < b (boundary case)
    a = 8'd0; b = 8'd255; #10;
    if (lt !== 1 || gt !== 0 || eq !== 0) begin
        $display("FAIL: Test case 5 failed (a < b boundary case)");
        $finish;
    end

    // Test case 6: a == b (boundary case)
    a = 8'd128; b = 8'd128; #10;
    if (lt !== 0 || gt !== 0 || eq !== 1) begin
        $display("FAIL: Test case 6 failed (a == b boundary case)");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule