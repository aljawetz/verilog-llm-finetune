`timescale 1ns/1ps

module tb_and_3;

reg a, b, c;
wire y;

// Instantiate the module under test
and_3 uut (
    .a(a),
    .b(b),
    .c(c),
    .y(y)
);

initial begin
    // Test case 1: All inputs low
    a = 0; b = 0; c = 0;
    #10;
    if (y !== 0) begin
        $display("FAIL: Test case 1 failed, expected y=0, got y=%b", y);
        $finish;
    end

    // Test case 2: Two inputs low, one high
    a = 0; b = 0; c = 1;
    #10;
    if (y !== 0) begin
        $display("FAIL: Test case 2 failed, expected y=0, got y=%b", y);
        $finish;
    end

    // Test case 3: One input low, two high
    a = 0; b = 1; c = 1;
    #10;
    if (y !== 0) begin
        $display("FAIL: Test case 3 failed, expected y=0, got y=%b", y);
        $finish;
    end

    // Test case 4: One input high, two low
    a = 1; b = 0; c = 0;
    #10;
    if (y !== 0) begin
        $display("FAIL: Test case 4 failed, expected y=0, got y=%b", y);
        $finish;
    end

    // Test case 5: All inputs high
    a = 1; b = 1; c = 1;
    #10;
    if (y !== 1) begin
        $display("FAIL: Test case 5 failed, expected y=1, got y=%b", y);
        $finish;
    end

    // Test case 6: Two inputs high, one low
    a = 1; b = 1; c = 0;
    #10;
    if (y !== 0) begin
        $display("FAIL: Test case 6 failed, expected y=0, got y=%b", y);
        $finish;
    end

    // Test case 7: One input high, two low
    a = 1; b = 0; c = 1;
    #10;
    if (y !== 0) begin
        $display("FAIL: Test case 7 failed, expected y=0, got y=%b", y);
        $finish;
    end

    // Test case 8: All inputs low again
    a = 0; b = 0; c = 0;
    #10;
    if (y !== 0) begin
        $display("FAIL: Test case 8 failed, expected y=0, got y=%b", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule