`timescale 1ns/1ps

module tb_xor_gate;

reg in_1;
reg in_2;
wire out;

// Instantiate the module under test
xor_gate uut (
    .in_1(in_1),
    .in_2(in_2),
    .out(out)
);

initial begin
    // Test case 1: in_1 = 0, in_2 = 0
    in_1 = 0; in_2 = 0;
    #10;
    if (out !== 0) begin
        $display("FAIL: Test case 1 failed (0, 0)");
        $finish;
    end

    // Test case 2: in_1 = 0, in_2 = 1
    in_1 = 0; in_2 = 1;
    #10;
    if (out !== 1) begin
        $display("FAIL: Test case 2 failed (0, 1)");
        $finish;
    end

    // Test case 3: in_1 = 1, in_2 = 0
    in_1 = 1; in_2 = 0;
    #10;
    if (out !== 1) begin
        $display("FAIL: Test case 3 failed (1, 0)");
        $finish;
    end

    // Test case 4: in_1 = 1, in_2 = 1
    in_1 = 1; in_2 = 1;
    #10;
    if (out !== 0) begin
        $display("FAIL: Test case 4 failed (1, 1)");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule