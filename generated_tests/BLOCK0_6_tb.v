`timescale 1ns/1ps

module tb_BLOCK0;

reg A;
reg B;
reg PHI;
wire POUT;
wire GOUT;

// Instantiate the module under test
BLOCK0 uut (
    .A(A),
    .B(B),
    .PHI(PHI),
    .POUT(POUT),
    .GOUT(GOUT)
);

initial begin
    // Test case 1: A = 0, B = 0
    A = 0; B = 0; PHI = 0;
    #10;
    if (POUT !== 1'b1 || GOUT !== 1'b1) begin
        $display("FAIL: Test case 1 failed (A=0, B=0)");
        $finish;
    end

    // Test case 2: A = 0, B = 1
    A = 0; B = 1; PHI = 0;
    #10;
    if (POUT !== 1'b0 || GOUT !== 1'b1) begin
        $display("FAIL: Test case 2 failed (A=0, B=1)");
        $finish;
    end

    // Test case 3: A = 1, B = 0
    A = 1; B = 0; PHI = 0;
    #10;
    if (POUT !== 1'b0 || GOUT !== 1'b1) begin
        $display("FAIL: Test case 3 failed (A=1, B=0)");
        $finish;
    end

    // Test case 4: A = 1, B = 1
    A = 1; B = 1; PHI = 0;
    #10;
    if (POUT !== 1'b0 || GOUT !== 1'b0) begin
        $display("FAIL: Test case 4 failed (A=1, B=1)");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule