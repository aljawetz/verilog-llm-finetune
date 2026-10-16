`timescale 1ns/1ps

module tb_ADD32;

reg [31:0] D0;
reg [31:0] D1;
wire [31:0] Q;

// Instantiate the module under test (uut)
ADD32 uut (
    .D0(D0),
    .D1(D1),
    .Q(Q)
);

initial begin
    // Test case 1: Simple addition
    D0 = 32'h00000001; // 1
    D1 = 32'h00000001; // 1
    #10;
    if (Q !== 32'h00000002) $display("FAIL: Test case 1 failed, expected 2 but got %h", Q);

    // Test case 2: Adding zero
    D0 = 32'h00000000; // 0
    D1 = 32'h00000001; // 1
    #10;
    if (Q !== 32'h00000001) $display("FAIL: Test case 2 failed, expected 1 but got %h", Q);

    // Test case 3: Maximum values
    D0 = 32'hFFFFFFFF; // Max value
    D1 = 32'h00000001; // 1
    #10;
    if (Q !== 32'h00000000) $display("FAIL: Test case 3 failed, expected 0 but got %h", Q); // Overflow case

    // Test case 4: Random values
    D0 = 32'h12345678; // Random value
    D1 = 32'h87654321; // Random value
    #10;
    if (Q !== 32'h99999999) $display("FAIL: Test case 4 failed, expected 99999999 but got %h", Q);

    // Test case 5: Negative values (two's complement)
    D0 = 32'hFFFFFFFF; // -1
    D1 = 32'hFFFFFFFF; // -1
    #10;
    if (Q !== 32'hFFFFFFFE) $display("FAIL: Test case 5 failed, expected FFFFFFFE but got %h", Q);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule