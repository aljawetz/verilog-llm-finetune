`timescale 1ns/1ps

module tb_HS_BL;

reg ip1;
reg ip2;
wire borrow;
wire difference;

HS_BL uut (
    .ip1(ip1),
    .ip2(ip2),
    .borrow(borrow),
    .difference(difference)
);

initial begin
    // Test Case 1: ip1 = 0, ip2 = 0
    ip1 = 0; ip2 = 0;
    #10;
    if (borrow !== 0 || difference !== 0) begin
        $display("FAIL: Test Case 1 failed");
        $finish;
    end

    // Test Case 2: ip1 = 0, ip2 = 1
    ip1 = 0; ip2 = 1;
    #10;
    if (borrow !== 1 || difference !== 1) begin
        $display("FAIL: Test Case 2 failed");
        $finish;
    end

    // Test Case 3: ip1 = 1, ip2 = 0
    ip1 = 1; ip2 = 0;
    #10;
    if (borrow !== 0 || difference !== 1) begin
        $display("FAIL: Test Case 3 failed");
        $finish;
    end

    // Test Case 4: ip1 = 1, ip2 = 1
    ip1 = 1; ip2 = 1;
    #10;
    if (borrow !== 0 || difference !== 0) begin
        $display("FAIL: Test Case 4 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule