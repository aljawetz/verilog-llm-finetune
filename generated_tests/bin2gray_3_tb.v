`timescale 1ns/1ps

module tb_bin2gray;

reg [3:0] bin;
wire [3:0] gray;

// Instantiate the module under test (uut)
bin2gray uut (
    .bin(bin),
    .gray(gray)
);

initial begin
    // Test case 1: 0000 -> 0000
    bin = 4'b0000;
    #10;
    if (gray !== 4'b0000) begin
        $display("FAIL: Test case 1 failed, expected 0000, got %b", gray);
        $finish;
    end

    // Test case 2: 0001 -> 0001
    bin = 4'b0001;
    #10;
    if (gray !== 4'b0001) begin
        $display("FAIL: Test case 2 failed, expected 0001, got %b", gray);
        $finish;
    end

    // Test case 3: 0010 -> 0011
    bin = 4'b0010;
    #10;
    if (gray !== 4'b0011) begin
        $display("FAIL: Test case 3 failed, expected 0011, got %b", gray);
        $finish;
    end

    // Test case 4: 0011 -> 0010
    bin = 4'b0011;
    #10;
    if (gray !== 4'b0010) begin
        $display("FAIL: Test case 4 failed, expected 0010, got %b", gray);
        $finish;
    end

    // Test case 5: 0100 -> 0110
    bin = 4'b0100;
    #10;
    if (gray !== 4'b0110) begin
        $display("FAIL: Test case 5 failed, expected 0110, got %b", gray);
        $finish;
    end

    // Test case 6: 0101 -> 0111
    bin = 4'b0101;
    #10;
    if (gray !== 4'b0111) begin
        $display("FAIL: Test case 6 failed, expected 0111, got %b", gray);
        $finish;
    end

    // Test case 7: 0110 -> 0101
    bin = 4'b0110;
    #10;
    if (gray !== 4'b0101) begin
        $display("FAIL: Test case 7 failed, expected 0101, got %b", gray);
        $finish;
    end

    // Test case 8: 0111 -> 0100
    bin = 4'b0111;
    #10;
    if (gray !== 4'b0100) begin
        $display("FAIL: Test case 8 failed, expected 0100, got %b", gray);
        $finish;
    end

    // Test case 9: 1000 -> 1100
    bin = 4'b1000;
    #10;
    if (gray !== 4'b1100) begin
        $display("FAIL: Test case 9 failed, expected 1100, got %b", gray);
        $finish;
    end

    // Test case 10: 1111 -> 1000
    bin = 4'b1111;
    #10;
    if (gray !== 4'b1000) begin
        $display("FAIL: Test case 10 failed, expected 1000, got %b", gray);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule