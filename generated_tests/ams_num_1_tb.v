`timescale 1ns/1ps

module tb_ams_num;

reg [9:0] n;
wire ams_out;

// Instantiate the module under test
ams_num uut (
    .n(n),
    .ams_out(ams_out)
);

initial begin
    // Test cases for Armstrong numbers
    n = 0; #10; // 0^3 + 0^3 + 0^3 = 0
    if (ams_out !== 1) $display("FAIL: Test case n=0 failed");

    n = 1; #10; // 1^3 + 0^3 + 0^3 = 1
    if (ams_out !== 1) $display("FAIL: Test case n=1 failed");

    n = 153; #10; // 1^3 + 5^3 + 3^3 = 153
    if (ams_out !== 1) $display("FAIL: Test case n=153 failed");

    n = 370; #10; // 3^3 + 7^3 + 0^3 = 370
    if (ams_out !== 1) $display("FAIL: Test case n=370 failed");

    n = 371; #10; // 3^3 + 7^3 + 1^3 = 371
    if (ams_out !== 1) $display("FAIL: Test case n=371 failed");

    n = 407; #10; // 4^3 + 0^3 + 7^3 = 407
    if (ams_out !== 1) $display("FAIL: Test case n=407 failed");

    // Test cases for non-Armstrong numbers
    n = 2; #10; // 2^3 + 0^3 + 0^3 = 8 != 2
    if (ams_out !== 0) $display("FAIL: Test case n=2 failed");

    n = 10; #10; // 1^3 + 0^3 + 0^3 = 1 != 10
    if (ams_out !== 0) $display("FAIL: Test case n=10 failed");

    n = 100; #10; // 1^3 + 0^3 + 0^3 = 1 != 100
    if (ams_out !== 0) $display("FAIL: Test case n=100 failed");

    n = 200; #10; // 2^3 + 0^3 + 0^3 = 8 != 200
    if (ams_out !== 0) $display("FAIL: Test case n=200 failed");

    n = 999; #10; // 9^3 + 9^3 + 9^3 = 2187 != 999
    if (ams_out !== 0) $display("FAIL: Test case n=999 failed");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule