`timescale 1ns/1ps

module tb_fourbitaddsub;

reg [3:0] a;
reg [3:0] b;
reg mode;
wire [3:0] result;
wire overflow;

fourbitaddsub uut (
    .a(a),
    .b(b),
    .mode(mode),
    .result(result),
    .overflow(overflow)
);

initial begin
    // Test addition without overflow
    a = 4'b0011; // 3
    b = 4'b0001; // 1
    mode = 1;   // addition
    #10;
    if (result !== 4'b0100 || overflow !== 0) begin
        $display("FAIL: Addition test failed (expected 4'b0100, overflow 0)");
        $finish;
    end

    // Test addition with overflow
    a = 4'b0111; // 7
    b = 4'b0001; // 1
    mode = 1;   // addition
    #10;
    if (result !== 4'b1000 || overflow !== 1) begin
        $display("FAIL: Addition overflow test failed (expected 4'b1000, overflow 1)");
        $finish;
    end

    // Test subtraction without overflow
    a = 4'b0010; // 2
    b = 4'b0001; // 1
    mode = 0;   // subtraction
    #10;
    if (result !== 4'b0001 || overflow !== 0) begin
        $display("FAIL: Subtraction test failed (expected 4'b0001, overflow 0)");
        $finish;
    end

    // Test subtraction with overflow
    a = 4'b1000; // -8
    b = 4'b0001; // 1
    mode = 0;   // subtraction
    #10;
    if (result !== 4'b0111 || overflow !== 1) begin
        $display("FAIL: Subtraction overflow test failed (expected 4'b0111, overflow 1)");
        $finish;
    end

    // Test subtraction resulting in negative value
    a = 4'b0001; // 1
    b = 4'b0010; // 2
    mode = 0;   // subtraction
    #10;
    if (result !== 4'b1111 || overflow !== 0) begin
        $display("FAIL: Negative result test failed (expected 4'b1111, overflow 0)");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule