`timescale 1ns/1ps

module tb_half_sub;

reg a_in;
reg b_in;
wire d_out;
wire borrow;

// Instantiate the half_sub module
half_sub uut (
    .a_in(a_in),
    .b_in(b_in),
    .d_out(d_out),
    .borrow(borrow)
);

initial begin
    // Test case 1: a_in = 0, b_in = 0
    a_in = 0; b_in = 0;
    #10;
    if (d_out !== 0 || borrow !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a_in = 0, b_in = 1
    a_in = 0; b_in = 1;
    #10;
    if (d_out !== 1 || borrow !== 1) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a_in = 1, b_in = 0
    a_in = 1; b_in = 0;
    #10;
    if (d_out !== 1 || borrow !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a_in = 1, b_in = 1
    a_in = 1; b_in = 1;
    #10;
    if (d_out !== 0 || borrow !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule