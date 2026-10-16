`timescale 1ns/1ps

module tb_fa_bl;

reg ip1, ip2, ip3;
wire carry, sum;

// Instantiate the module under test (uut)
fa_bl uut (
    .ip1(ip1),
    .ip2(ip2),
    .ip3(ip3),
    .carry(carry),
    .sum(sum)
);

initial begin
    // Test case 1: 0 + 0 + 0
    ip1 = 0; ip2 = 0; ip3 = 0;
    #10;
    if (carry !== 0 || sum !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: 0 + 0 + 1
    ip1 = 0; ip2 = 0; ip3 = 1;
    #10;
    if (carry !== 0 || sum !== 1) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: 0 + 1 + 1
    ip1 = 0; ip2 = 1; ip3 = 1;
    #10;
    if (carry !== 1 || sum !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: 1 + 1 + 1
    ip1 = 1; ip2 = 1; ip3 = 1;
    #10;
    if (carry !== 1 || sum !== 1) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: 1 + 0 + 1
    ip1 = 1; ip2 = 0; ip3 = 1;
    #10;
    if (carry !== 1 || sum !== 0) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: 1 + 1 + 0
    ip1 = 1; ip2 = 1; ip3 = 0;
    #10;
    if (carry !== 1 || sum !== 0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // Test case 7: 0 + 1 + 0
    ip1 = 0; ip2 = 1; ip3 = 0;
    #10;
    if (carry !== 0 || sum !== 1) begin
        $display("FAIL: Test case 7 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule