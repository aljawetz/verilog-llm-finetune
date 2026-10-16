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
    mode = 1'b1; // addition
    #10;
    if (result !== 4'b0100 || overflow !== 1'b0) begin
        $display("FAIL: Addition test 1 failed");
        $finish;
    end

    // Test addition with overflow
    a = 4'b0111; // 7
    b = 4'b0001; // 1
    mode = 1'b1; // addition
    #10;
    if (result !== 4'b1000 || overflow !== 1'b1) begin
        $display("FAIL: Addition test 2 failed");
        $finish;
    end

    // Test subtraction without overflow
    a = 4'b0010; // 2
    b = 4'b0001; // 1
    mode = 1'b0; // subtraction
    #10;
    if (result !== 4'b0001 || overflow !== 1'b0) begin
        $display("FAIL: Subtraction test 1 failed");
        $finish;
    end

    // Test subtraction with overflow
    a = 4'b1000; // -8
    b = 4'b0001; // 1
    mode = 1'b0; // subtraction
    #10;
    if (result !== 4'b0111 || overflow !== 1'b1) begin
        $display("FAIL: Subtraction test 2 failed");
        $finish;
    end

    // Test zero result
    a = 4'b0000; // 0
    b = 4'b0000; // 0
    mode = 1'b1; // addition
    #10;
    if (result !== 4'b0000 || overflow !== 1'b0) begin
        $display("FAIL: Zero result test failed");
        $finish;
    end

    // Test negative result
    a = 4'b0001; // 1
    b = 4'b0010; // 2
    mode = 1'b0; // subtraction
    #10;
    if (result !== 4'b1111 || overflow !== 1'b0) begin
        $display("FAIL: Negative result test failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule