`timescale 1ns/1ps

module tb_AN2D4PO4;

reg A1;
reg A2;
wire Z;

// Instantiate the module under test
AN2D4PO4 uut (
    .A1(A1),
    .A2(A2),
    .Z(Z)
);

initial begin
    // Test case 1: A1 = 0, A2 = 0
    A1 = 0; A2 = 0;
    #10;
    if (Z !== 0) begin
        $display("FAIL: Test case 1 failed (A1=0, A2=0, Z=%b)", Z);
        $finish;
    end

    // Test case 2: A1 = 0, A2 = 1
    A1 = 0; A2 = 1;
    #10;
    if (Z !== 0) begin
        $display("FAIL: Test case 2 failed (A1=0, A2=1, Z=%b)", Z);
        $finish;
    end

    // Test case 3: A1 = 1, A2 = 0
    A1 = 1; A2 = 0;
    #10;
    if (Z !== 0) begin
        $display("FAIL: Test case 3 failed (A1=1, A2=0, Z=%b)", Z);
        $finish;
    end

    // Test case 4: A1 = 1, A2 = 1
    A1 = 1; A2 = 1;
    #10;
    if (Z !== 1) begin
        $display("FAIL: Test case 4 failed (A1=1, A2=1, Z=%b)", Z);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule