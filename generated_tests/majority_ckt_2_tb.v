`timescale 1ns/1ps

module tb_majority_ckt;

reg [4:0] x;
wire z;

// Instantiate the module under test
majority_ckt uut (
    .x(x),
    .z(z)
);

initial begin
    // Test case 1: 3 inputs high (1, 1, 1, 0, 0) -> should output 1
    x = 5'b11100; #10;
    if (z !== 1'b1) begin
        $display("FAIL: Test case 1 failed, expected z=1, got z=%b", z);
        $finish;
    end

    // Test case 2: 2 inputs high (1, 1, 0, 0, 0) -> should output 0
    x = 5'b11000; #10;
    if (z !== 1'b0) begin
        $display("FAIL: Test case 2 failed, expected z=0, got z=%b", z);
        $finish;
    end

    // Test case 3: 4 inputs high (1, 1, 1, 1, 0) -> should output 1
    x = 5'b11110; #10;
    if (z !== 1'b1) begin
        $display("FAIL: Test case 3 failed, expected z=1, got z=%b", z);
        $finish;
    end

    // Test case 4: 5 inputs high (1, 1, 1, 1, 1) -> should output 1
    x = 5'b11111; #10;
    if (z !== 1'b1) begin
        $display("FAIL: Test case 4 failed, expected z=1, got z=%b", z);
        $finish;
    end

    // Test case 5: 1 input high (1, 0, 0, 0, 0) -> should output 0
    x = 5'b10000; #10;
    if (z !== 1'b0) begin
        $display("FAIL: Test case 5 failed, expected z=0, got z=%b", z);
        $finish;
    end

    // Test case 6: 3 inputs high (1, 0, 1, 0, 1) -> should output 1
    x = 5'b10101; #10;
    if (z !== 1'b1) begin
        $display("FAIL: Test case 6 failed, expected z=1, got z=%b", z);
        $finish;
    end

    // Test case 7: 2 inputs high (0, 0, 1, 1, 0) -> should output 0
    x = 5'b00110; #10;
    if (z !== 1'b0) begin
        $display("FAIL: Test case 7 failed, expected z=0, got z=%b", z);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule