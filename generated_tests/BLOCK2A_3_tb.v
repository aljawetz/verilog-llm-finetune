`timescale 1ns/1ps

module tb_BLOCK2A;

reg PIN2;
reg GIN1;
reg GIN2;
reg PHI;
wire GOUT;

// Instantiate the module under test
BLOCK2A uut (
    .PIN2(PIN2),
    .GIN1(GIN1),
    .GIN2(GIN2),
    .PHI(PHI),
    .GOUT(GOUT)
);

initial begin
    // Test case 1: All inputs low
    PIN2 = 0; GIN1 = 0; GIN2 = 0; PHI = 0;
    #10;
    if (GOUT !== 1) $display("FAIL: Test case 1 failed, expected GOUT = 1, got GOUT = %b", GOUT);

    // Test case 2: GIN2 high
    PIN2 = 0; GIN1 = 0; GIN2 = 1; PHI = 0;
    #10;
    if (GOUT !== 0) $display("FAIL: Test case 2 failed, expected GOUT = 0, got GOUT = %b", GOUT);

    // Test case 3: PIN2 high, GIN1 low, GIN2 low
    PIN2 = 1; GIN1 = 0; GIN2 = 0; PHI = 0;
    #10;
    if (GOUT !== 0) $display("FAIL: Test case 3 failed, expected GOUT = 0, got GOUT = %b", GOUT);

    // Test case 4: PIN2 high, GIN1 high, GIN2 low
    PIN2 = 1; GIN1 = 1; GIN2 = 0; PHI = 0;
    #10;
    if (GOUT !== 0) $display("FAIL: Test case 4 failed, expected GOUT = 0, got GOUT = %b", GOUT);

    // Test case 5: PIN2 low, GIN1 high, GIN2 low
    PIN2 = 0; GIN1 = 1; GIN2 = 0; PHI = 0;
    #10;
    if (GOUT !== 1) $display("FAIL: Test case 5 failed, expected GOUT = 1, got GOUT = %b", GOUT);

    // Test case 6: PIN2 high, GIN1 high, GIN2 high
    PIN2 = 1; GIN1 = 1; GIN2 = 1; PHI = 0;
    #10;
    if (GOUT !== 0) $display("FAIL: Test case 6 failed, expected GOUT = 0, got GOUT = %b", GOUT);

    // Test case 7: PIN2 low, GIN1 low, GIN2 high
    PIN2 = 0; GIN1 = 0; GIN2 = 1; PHI = 0;
    #10;
    if (GOUT !== 0) $display("FAIL: Test case 7 failed, expected GOUT = 0, got GOUT = %b", GOUT);

    // Test case 8: PIN2 high, GIN1 low, GIN2 high
    PIN2 = 1; GIN1 = 0; GIN2 = 1; PHI = 0;
    #10;
    if (GOUT !== 0) $display("FAIL: Test case 8 failed, expected GOUT = 0, got GOUT = %b", GOUT);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule