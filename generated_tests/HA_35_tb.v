`timescale 1ns/1ps

module tb_HA;

reg a;
reg b;
wire Sum;
wire Cout;

// Instantiate the Half Adder
HA uut (
    .a(a),
    .b(b),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
    // Test case 1: a = 0, b = 0
    a = 0; b = 0;
    #10;
    if (Sum !== 0 || Cout !== 0) begin
        $display("FAIL: Test case 1 failed (a=0, b=0)");
        $finish;
    end

    // Test case 2: a = 0, b = 1
    a = 0; b = 1;
    #10;
    if (Sum !== 1 || Cout !== 0) begin
        $display("FAIL: Test case 2 failed (a=0, b=1)");
        $finish;
    end

    // Test case 3: a = 1, b = 0
    a = 1; b = 0;
    #10;
    if (Sum !== 1 || Cout !== 0) begin
        $display("FAIL: Test case 3 failed (a=1, b=0)");
        $finish;
    end

    // Test case 4: a = 1, b = 1
    a = 1; b = 1;
    #10;
    if (Sum !== 0 || Cout !== 1) begin
        $display("FAIL: Test case 4 failed (a=1, b=1)");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule