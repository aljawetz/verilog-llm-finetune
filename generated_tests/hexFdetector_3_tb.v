`timescale 1ns/1ps

module tb_hexFdetector;

reg [3:0] hex_in;
wire out_sigRed, out_sigGreen;

// Instantiate the module under test
hexFdetector uut (
    .hex_in(hex_in),
    .out_sigRed(out_sigRed),
    .out_sigGreen(out_sigGreen)
);

initial begin
    // Test case 1: Check when hex_in is F (1111)
    hex_in = 4'b1111; // Input F
    #10; // Wait for the output to settle
    if (out_sigRed !== 0 || out_sigGreen !== 1) begin
        $display("FAIL: Test case 1 failed for input F");
        $finish;
    end

    // Test case 2: Check when hex_in is 0 (0000)
    hex_in = 4'b0000; // Input 0
    #10; // Wait for the output to settle
    if (out_sigRed !== 1 || out_sigGreen !== 0) begin
        $display("FAIL: Test case 2 failed for input 0");
        $finish;
    end

    // Test case 3: Check when hex_in is A (1010)
    hex_in = 4'b1010; // Input A
    #10; // Wait for the output to settle
    if (out_sigRed !== 1 || out_sigGreen !== 0) begin
        $display("FAIL: Test case 3 failed for input A");
        $finish;
    end

    // Test case 4: Check when hex_in is F (1111) again
    hex_in = 4'b1111; // Input F
    #10; // Wait for the output to settle
    if (out_sigRed !== 0 || out_sigGreen !== 1) begin
        $display("FAIL: Test case 4 failed for input F");
        $finish;
    end

    // Test case 5: Check when hex_in is 5 (0101)
    hex_in = 4'b0101; // Input 5
    #10; // Wait for the output to settle
    if (out_sigRed !== 1 || out_sigGreen !== 0) begin
        $display("FAIL: Test case 5 failed for input 5");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule