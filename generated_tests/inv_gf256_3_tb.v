`timescale 1ns/1ps

module tb_inv_gf256;

reg [7:0] x;
wire [7:0] y;

inv_gf256 uut (
    .x(x),
    .y(y)
);

initial begin
    // Test cases for GF(256) multiplicative inverse
    // Test case 1: x = 0
    x = 8'h00; #10;
    if (y !== 8'h00) begin
        $display("FAIL: Expected y = 0 for x = 0, got y = %h", y);
        $finish;
    end

    // Test case 2: x = 1
    x = 8'h01; #10;
    if (y !== 8'h01) begin
        $display("FAIL: Expected y = 1 for x = 1, got y = %h", y);
        $finish;
    end

    // Test case 3: x = 2
    x = 8'h02; #10;
    if (y !== 8'h8E) begin
        $display("FAIL: Expected y = 8E for x = 2, got y = %h", y);
        $finish;
    end

    // Test case 4: x = 4
    x = 8'h04; #10;
    if (y !== 8'h47) begin
        $display("FAIL: Expected y = 47 for x = 4, got y = %h", y);
        $finish;
    end

    // Test case 5: x = 255
    x = 8'hFF; #10;
    if (y !== 8'hFD) begin
        $display("FAIL: Expected y = FD for x = 255, got y = %h", y);
        $finish;
    end

    // Test case 6: x = 128
    x = 8'h80; #10;
    if (y !== 8'h1B) begin
        $display("FAIL: Expected y = 1B for x = 128, got y = %h", y);
        $finish;
    end

    // Test case 7: x = 29
    x = 8'h1D; #10;
    if (y !== 8'h83) begin
        $display("FAIL: Expected y = 83 for x = 29, got y = %h", y);
        $finish;
    end

    // Test case 8: x = 100
    x = 8'h64; #10;
    if (y !== 8'hB9) begin
        $display("FAIL: Expected y = B9 for x = 100, got y = %h", y);
        $finish;
    end

    // Test case 9: x = 200
    x = 8'hC8; #10;
    if (y !== 8'hD2) begin
        $display("FAIL: Expected y = D2 for x = 200, got y = %h", y);
        $finish;
    end

    // Test case 10: x = 255
    x = 8'hFF; #10;
    if (y !== 8'hFD) begin
        $display("FAIL: Expected y = FD for x = 255, got y = %h", y);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule