`timescale 1ns/1ps

module tb_comp;

reg a;
reg b;
reg e;
wire lt;
wire eq;
wire gt;

// Instantiate the module under test
comp uut (
    .a(a),
    .b(b),
    .e(e),
    .lt(lt),
    .eq(eq),
    .gt(gt)
);

initial begin
    // Test case 1: a = 0, b = 0, e = 1 (equal case)
    a = 0; b = 0; e = 1;
    #10;
    if (lt !== 0 || eq !== 1 || gt !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a = 0, b = 1, e = 1 (less than case)
    a = 0; b = 1; e = 1;
    #10;
    if (lt !== 1 || eq !== 0 || gt !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a = 1, b = 0, e = 1 (greater than case)
    a = 1; b = 0; e = 1;
    #10;
    if (lt !== 0 || eq !== 0 || gt !== 1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a = 1, b = 1, e = 1 (equal case)
    a = 1; b = 1; e = 1;
    #10;
    if (lt !== 0 || eq !== 1 || gt !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: a = 0, b = 1, e = 0 (disabled case)
    a = 0; b = 1; e = 0;
    #10;
    if (lt !== 0 || eq !== 0 || gt !== 0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: a = 1, b = 0, e = 0 (disabled case)
    a = 1; b = 0; e = 0;
    #10;
    if (lt !== 0 || eq !== 0 || gt !== 0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // Test case 7: a = 0, b = 0, e = 0 (disabled case)
    a = 0; b = 0; e = 0;
    #10;
    if (lt !== 0 || eq !== 0 || gt !== 0) begin
        $display("FAIL: Test case 7 failed");
        $finish;
    end

    // Test case 8: a = 1, b = 1, e = 0 (disabled case)
    a = 1; b = 1; e = 0;
    #10;
    if (lt !== 0 || eq !== 0 || gt !== 0) begin
        $display("FAIL: Test case 8 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule