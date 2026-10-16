`timescale 1ns/1ps

module tb_FA1;

reg cin;
reg ain;
reg bin;
wire sout;
wire cout;

// Instantiate the module under test
FA1 uut (
    .cin(cin),
    .ain(ain),
    .bin(bin),
    .sout(sout),
    .cout(cout)
);

initial begin
    // Test case 1: 0 + 0 + 0 = 0, carry = 0
    cin = 0; ain = 0; bin = 0;
    #10;
    if (sout !== 0 || cout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 + 0 + 1 = 1, carry = 0
    cin = 1; ain = 0; bin = 0;
    #10;
    if (sout !== 1 || cout !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 + 1 + 0 = 1, carry = 0
    cin = 0; ain = 1; bin = 0;
    #10;
    if (sout !== 1 || cout !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: 1 + 0 + 0 = 1, carry = 0
    cin = 0; ain = 0; bin = 1;
    #10;
    if (sout !== 1 || cout !== 0) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 1 + 0 = 0, carry = 1
    cin = 0; ain = 1; bin = 1;
    #10;
    if (sout !== 0 || cout !== 1) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 0 + 1 = 0, carry = 1
    cin = 1; ain = 1; bin = 0;
    #10;
    if (sout !== 0 || cout !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: 0 + 1 + 1 = 0, carry = 1
    cin = 1; ain = 0; bin = 1;
    #10;
    if (sout !== 0 || cout !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 + 1 + 1 = 1, carry = 1
    cin = 1; ain = 1; bin = 1;
    #10;
    if (sout !== 1 || cout !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule