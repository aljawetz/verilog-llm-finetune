`timescale 1ns/1ps

module tb_Bcd_7segDec;

reg [3:0] a;
wire [6:0] y;

// Instantiate the module under test (uut)
Bcd_7segDec uut (
    .a(a),
    .y(y)
);

initial begin
    // Test cases
    a = 4'b0000; #10; // 0
    if (y !== 7'b0000001) begin
        $display("FAIL: Test case for input 0 failed");
        $finish;
    end

    a = 4'b0001; #10; // 1
    if (y !== 7'b1001111) begin
        $display("FAIL: Test case for input 1 failed");
        $finish;
    end

    a = 4'b0010; #10; // 2
    if (y !== 7'b0010010) begin
        $display("FAIL: Test case for input 2 failed");
        $finish;
    end

    a = 4'b0011; #10; // 3
    if (y !== 7'b0000110) begin
        $display("FAIL: Test case for input 3 failed");
        $finish;
    end

    a = 4'b0100; #10; // 4
    if (y !== 7'b1001100) begin
        $display("FAIL: Test case for input 4 failed");
        $finish;
    end

    a = 4'b0101; #10; // 5
    if (y !== 7'b0100100) begin
        $display("FAIL: Test case for input 5 failed");
        $finish;
    end

    a = 4'b0110; #10; // 6
    if (y !== 7'b0100000) begin
        $display("FAIL: Test case for input 6 failed");
        $finish;
    end

    a = 4'b0111; #10; // 7
    if (y !== 7'b0001111) begin
        $display("FAIL: Test case for input 7 failed");
        $finish;
    end

    a = 4'b1000; #10; // 8
    if (y !== 7'b0000000) begin
        $display("FAIL: Test case for input 8 failed");
        $finish;
    end

    a = 4'b1001; #10; // 9
    if (y !== 7'b0000100) begin
        $display("FAIL: Test case for input 9 failed");
        $finish;
    end

    a = 4'b1010; #10; // Invalid input
    if (y !== 7'b1111111) begin
        $display("FAIL: Test case for invalid input 10 failed");
        $finish;
    end

    a = 4'b1111; #10; // Invalid input
    if (y !== 7'b1111111) begin
        $display("FAIL: Test case for invalid input 15 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule