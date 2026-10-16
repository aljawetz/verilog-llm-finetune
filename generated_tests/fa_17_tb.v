`timescale 1ns/1ps

module tb_fa;

reg x;
reg y;
reg z;
wire s;
wire c;

// Instantiate the full adder module
fa uut (
    .x(x),
    .y(y),
    .z(z),
    .s(s),
    .c(c)
);

initial begin
    // Test case 1: 0 + 0 + 0 = 0, carry = 0
    x = 0; y = 0; z = 0;
    #10;
    if (s !== 0 || c !== 0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: 0 + 0 + 1 = 1, carry = 0
    x = 0; y = 0; z = 1;
    #10;
    if (s !== 1 || c !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: 0 + 1 + 0 = 1, carry = 0
    x = 0; y = 1; z = 0;
    #10;
    if (s !== 1 || c !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: 1 + 0 + 0 = 1, carry = 0
    x = 1; y = 0; z = 0;
    #10;
    if (s !== 1 || c !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: 1 + 1 + 0 = 0, carry = 1
    x = 1; y = 1; z = 0;
    #10;
    if (s !== 0 || c !== 1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: 1 + 0 + 1 = 0, carry = 1
    x = 1; y = 0; z = 1;
    #10;
    if (s !== 0 || c !== 1) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // Test case 7: 0 + 1 + 1 = 0, carry = 1
    x = 0; y = 1; z = 1;
    #10;
    if (s !== 0 || c !== 1) begin
        $display("FAIL: Test case 7 failed");
        $finish;
    end

    // Test case 8: 1 + 1 + 1 = 1, carry = 1
    x = 1; y = 1; z = 1;
    #10;
    if (s !== 1 || c !== 1) begin
        $display("FAIL: Test case 8 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule