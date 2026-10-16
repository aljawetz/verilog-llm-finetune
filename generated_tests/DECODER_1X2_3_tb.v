`timescale 1ns/1ps

module tb_DECODER_1X2;

reg I;
wire O1, O2;

// Instantiate the module under test (uut)
DECODER_1X2 uut (
    .I(I),
    .O1(O1),
    .O2(O2)
);

initial begin
    // Test case 1: Input is 0
    I = 1'b0;
    #10; // Wait for 10 time units
    if (O1 !== 1'b1 || O2 !== 1'b0) begin
        $display("FAIL: Test case 1 failed (I=0)");
        $finish;
    end

    // Test case 2: Input is 1
    I = 1'b1;
    #10; // Wait for 10 time units
    if (O1 !== 1'b0 || O2 !== 1'b1) begin
        $display("FAIL: Test case 2 failed (I=1)");
        $finish;
    end

    // Test case 3: Invalid input (should not happen in this design, but testing for robustness)
    I = 1'bx; // Invalid input
    #10; // Wait for 10 time units
    if (O1 !== 1'bx || O2 !== 1'bx) begin
        $display("FAIL: Test case 3 failed (Invalid input)");
        $finish;
    end

    // Test case 4: Another invalid input (should not happen in this design, but testing for robustness)
    I = 1'bz; // Invalid input
    #10; // Wait for 10 time units
    if (O1 !== 1'bx || O2 !== 1'bx) begin
        $display("FAIL: Test case 4 failed (Invalid input)");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule