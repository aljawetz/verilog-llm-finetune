`timescale 1ns/1ps

module tb_binary2gray;

reg [3:0] binary_in;
wire [3:0] gray_out;

// Instantiate the module under test (uut)
binary2gray uut (
    .binary_in(binary_in),
    .gray_out(gray_out)
);

initial begin
    // Test sequence
    binary_in = 4'b0000; #10;
    if (gray_out !== 4'b0000) begin
        $display("FAIL: Test case binary_in = 0000 failed, expected gray_out = 0000");
        $finish;
    end

    binary_in = 4'b0001; #10;
    if (gray_out !== 4'b0001) begin
        $display("FAIL: Test case binary_in = 0001 failed, expected gray_out = 0001");
        $finish;
    end

    binary_in = 4'b0010; #10;
    if (gray_out !== 4'b0011) begin
        $display("FAIL: Test case binary_in = 0010 failed, expected gray_out = 0011");
        $finish;
    end

    binary_in = 4'b0011; #10;
    if (gray_out !== 4'b0010) begin
        $display("FAIL: Test case binary_in = 0011 failed, expected gray_out = 0010");
        $finish;
    end

    binary_in = 4'b0100; #10;
    if (gray_out !== 4'b0110) begin
        $display("FAIL: Test case binary_in = 0100 failed, expected gray_out = 0110");
        $finish;
    end

    binary_in = 4'b0101; #10;
    if (gray_out !== 4'b0111) begin
        $display("FAIL: Test case binary_in = 0101 failed, expected gray_out = 0111");
        $finish;
    end

    binary_in = 4'b0110; #10;
    if (gray_out !== 4'b0101) begin
        $display("FAIL: Test case binary_in = 0110 failed, expected gray_out = 0101");
        $finish;
    end

    binary_in = 4'b0111; #10;
    if (gray_out !== 4'b0100) begin
        $display("FAIL: Test case binary_in = 0111 failed, expected gray_out = 0100");
        $finish;
    end

    binary_in = 4'b1000; #10;
    if (gray_out !== 4'b1100) begin
        $display("FAIL: Test case binary_in = 1000 failed, expected gray_out = 1100");
        $finish;
    end

    binary_in = 4'b1001; #10;
    if (gray_out !== 4'b1101) begin
        $display("FAIL: Test case binary_in = 1001 failed, expected gray_out = 1101");
        $finish;
    end

    binary_in = 4'b1010; #10;
    if (gray_out !== 4'b1111) begin
        $display("FAIL: Test case binary_in = 1010 failed, expected gray_out = 1111");
        $finish;
    end

    binary_in = 4'b1011; #10;
    if (gray_out !== 4'b1110) begin
        $display("FAIL: Test case binary_in = 1011 failed, expected gray_out = 1110");
        $finish;
    end

    binary_in = 4'b1100; #10;
    if (gray_out !== 4'b1010) begin
        $display("FAIL: Test case binary_in = 1100 failed, expected gray_out = 1010");
        $finish;
    end

    binary_in = 4'b1101; #10;
    if (gray_out !== 4'b1011) begin
        $display("FAIL: Test case binary_in = 1101 failed, expected gray_out = 1011");
        $finish;
    end

    binary_in = 4'b1110; #10;
    if (gray_out !== 4'b1001) begin
        $display("FAIL: Test case binary_in = 1110 failed, expected gray_out = 1001");
        $finish;
    end

    binary_in = 4'b1111; #10;
    if (gray_out !== 4'b1000) begin
        $display("FAIL: Test case binary_in = 1111 failed, expected gray_out = 1000");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule