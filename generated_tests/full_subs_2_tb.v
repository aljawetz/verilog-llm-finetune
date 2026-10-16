`timescale 1ns/1ps

module tb_full_subs;

reg a, b, brow_in;
wire diff_out, brow_out;

// Instantiate the full_subs module
full_subs uut (
    .a(a),
    .b(b),
    .brow_in(brow_in),
    .diff_out(diff_out),
    .brow_out(brow_out)
);

initial begin
    // Test case 1: a = 0, b = 0, brow_in = 0
    a = 0; b = 0; brow_in = 0;
    #10;
    if (diff_out !== 0 || brow_out !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a = 0, b = 1, brow_in = 0
    a = 0; b = 1; brow_in = 0;
    #10;
    if (diff_out !== 1 || brow_out !== 1) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a = 1, b = 0, brow_in = 0
    a = 1; b = 0; brow_in = 0;
    #10;
    if (diff_out !== 1 || brow_out !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a = 1, b = 1, brow_in = 0
    a = 1; b = 1; brow_in = 0;
    #10;
    if (diff_out !== 0 || brow_out !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: a = 0, b = 0, brow_in = 1
    a = 0; b = 0; brow_in = 1;
    #10;
    if (diff_out !== 1 || brow_out !== 1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: a = 0, b = 1, brow_in = 1
    a = 0; b = 1; brow_in = 1;
    #10;
    if (diff_out !== 0 || brow_out !== 1) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // Test case 7: a = 1, b = 0, brow_in = 1
    a = 1; b = 0; brow_in = 1;
    #10;
    if (diff_out !== 0 || brow_out !== 0) begin
        $display("FAIL: Test case 7 failed");
        $finish;
    end

    // Test case 8: a = 1, b = 1, brow_in = 1
    a = 1; b = 1; brow_in = 1;
    #10;
    if (diff_out !== 1 || brow_out !== 1) begin
        $display("FAIL: Test case 8 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule