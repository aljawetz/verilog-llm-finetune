`timescale 1ns/1ps

module tb_decoder_2_4;

reg a;
reg b;
wire y0;
wire y1;
wire y2;
wire y3;

// Instantiate the module under test (uut)
decoder_2_4 uut (
    .a(a),
    .b(b),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3)
);

initial begin
    // Test sequence
    // Test case 1: a=0, b=0 -> y0 should be 1, others should be 0
    a = 0; b = 0; #10;
    if (y0 !== 1'b1 || y1 !== 1'b0 || y2 !== 1'b0 || y3 !== 1'b0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: a=0, b=1 -> y1 should be 1, others should be 0
    a = 0; b = 1; #10;
    if (y0 !== 1'b0 || y1 !== 1'b1 || y2 !== 1'b0 || y3 !== 1'b0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: a=1, b=0 -> y2 should be 1, others should be 0
    a = 1; b = 0; #10;
    if (y0 !== 1'b0 || y1 !== 1'b0 || y2 !== 1'b1 || y3 !== 1'b0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: a=1, b=1 -> y3 should be 1, others should be 0
    a = 1; b = 1; #10;
    if (y0 !== 1'b0 || y1 !== 1'b0 || y2 !== 1'b0 || y3 !== 1'b1) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule