`timescale 1ns/1ps

module tb_binary2gray;

reg [3:0] binary;
wire [3:0] gray;

// Instantiate the module under test (uut)
binary2gray uut (
    .gray(gray),
    .binary(binary)
);

initial begin
    // Test cases
    binary = 4'b0000; #10;
    if (gray !== 4'b0000) begin
        $display("FAIL: Test case binary=0000 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b0001; #10;
    if (gray !== 4'b0001) begin
        $display("FAIL: Test case binary=0001 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b0010; #10;
    if (gray !== 4'b0011) begin
        $display("FAIL: Test case binary=0010 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b0011; #10;
    if (gray !== 4'b0010) begin
        $display("FAIL: Test case binary=0011 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b0100; #10;
    if (gray !== 4'b0110) begin
        $display("FAIL: Test case binary=0100 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b0101; #10;
    if (gray !== 4'b0111) begin
        $display("FAIL: Test case binary=0101 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b0110; #10;
    if (gray !== 4'b0101) begin
        $display("FAIL: Test case binary=0110 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b0111; #10;
    if (gray !== 4'b0100) begin
        $display("FAIL: Test case binary=0111 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b1000; #10;
    if (gray !== 4'b1100) begin
        $display("FAIL: Test case binary=1000 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b1001; #10;
    if (gray !== 4'b1101) begin
        $display("FAIL: Test case binary=1001 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b1010; #10;
    if (gray !== 4'b1111) begin
        $display("FAIL: Test case binary=1010 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b1011; #10;
    if (gray !== 4'b1110) begin
        $display("FAIL: Test case binary=1011 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b1100; #10;
    if (gray !== 4'b1010) begin
        $display("FAIL: Test case binary=1100 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b1101; #10;
    if (gray !== 4'b1011) begin
        $display("FAIL: Test case binary=1101 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b1110; #10;
    if (gray !== 4'b1001) begin
        $display("FAIL: Test case binary=1110 failed, got gray=%b", gray);
        $finish;
    end

    binary = 4'b1111; #10;
    if (gray !== 4'b1000) begin
        $display("FAIL: Test case binary=1111 failed, got gray=%b", gray);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule