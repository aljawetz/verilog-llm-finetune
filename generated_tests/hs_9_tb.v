`timescale 1ns/1ps

module tb_hs;

reg a;
reg b;
wire dif;
wire bor;

// Instantiate the half-subtractor module
hs uut (
    .a(a),
    .b(b),
    .dif(dif),
    .bor(bor)
);

initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (dif !== 0 || bor !== 0) begin
        $display("FAIL: Test case 1 failed (a=0, b=0)");
        $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (dif !== 1 || bor !== 1) begin
        $display("FAIL: Test case 2 failed (a=0, b=1)");
        $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (dif !== 1 || bor !== 0) begin
        $display("FAIL: Test case 3 failed (a=1, b=0)");
        $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (dif !== 0 || bor !== 0) begin
        $display("FAIL: Test case 4 failed (a=1, b=1)");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule