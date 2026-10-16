`timescale 1ns/1ps

module tb_mac_8;

parameter DATA_WIDTH = 8;  
reg [DATA_WIDTH - 1 : 0] a, b, c;
wire [DATA_WIDTH - 1 : 0] out;

mac_8 uut (
    .a(a),
    .b(b),
    .c(c),
    .out(out)
);

initial begin
    // Test case 1: 2 * 3 + 1 = 7
    a = 8'd2; b = 8'd3; c = 8'd1;
    #10;
    if (out !== 8'd7) begin
        $display("FAIL: Test case 1 failed, expected 7 but got %d", out);
        $finish;
    end

    // Test case 2: 5 * 5 + 2 = 27
    a = 8'd5; b = 8'd5; c = 8'd2;
    #10;
    if (out !== 8'd27) begin
        $display("FAIL: Test case 2 failed, expected 27 but got %d", out);
        $finish;
    end

    // Test case 3: 0 * 10 + 5 = 5
    a = 8'd0; b = 8'd10; c = 8'd5;
    #10;
    if (out !== 8'd5) begin
        $display("FAIL: Test case 3 failed, expected 5 but got %d", out);
        $finish;
    end

    // Test case 4: 15 * 15 + 1 = 226
    a = 8'd15; b = 8'd15; c = 8'd1;
    #10;
    if (out !== 8'd226) begin
        $display("FAIL: Test case 4 failed, expected 226 but got %d", out);
        $finish;
    end

    // Test case 5: 255 * 1 + 0 = 255
    a = 8'd255; b = 8'd1; c = 8'd0;
    #10;
    if (out !== 8'd255) begin
        $display("FAIL: Test case 5 failed, expected 255 but got %d", out);
        $finish;
    end

    // Test case 6: 128 * 2 + 1 = 257
    a = 8'd128; b = 8'd2; c = 8'd1;
    #10;
    if (out !== 8'd1) begin // 257 wraps around to 1 in 8 bits
        $display("FAIL: Test case 6 failed, expected 1 but got %d", out);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule