`timescale 1ns/1ps

module tb_add_sub27;

reg add;
reg [26:0] opa, opb;
wire [26:0] sum;
wire co;

add_sub27 uut (
    .add(add),
    .opa(opa),
    .opb(opb),
    .sum(sum),
    .co(co)
);

initial begin
    // Test case 1: Addition
    add = 1;
    opa = 27'd10;
    opb = 27'd15;
    #10;
    if (sum !== 27'd25 || co !== 1'b0) begin
        $display("FAIL: Test case 1 failed (Addition)");
        $finish;
    end

    // Test case 2: Subtraction
    add = 0;
    opa = 27'd20;
    opb = 27'd5;
    #10;
    if (sum !== 27'd15 || co !== 1'b0) begin
        $display("FAIL: Test case 2 failed (Subtraction)");
        $finish;
    end

    // Test case 3: Addition with carry
    add = 1;
    opa = 27'd134217727; // Max value for 27 bits
    opb = 27'd1;
    #10;
    if (sum !== 27'd0 || co !== 1'b1) begin
        $display("FAIL: Test case 3 failed (Addition with carry)");
        $finish;
    end

    // Test case 4: Subtraction resulting in negative
    add = 0;
    opa = 27'd5;
    opb = 27'd10;
    #10;
    if (sum !== 27'd4294967291 || co !== 1'b1) begin // 5 - 10 = -5, represented in 27 bits
        $display("FAIL: Test case 4 failed (Subtraction resulting in negative)");
        $finish;
    end

    // Test case 5: Simple addition
    add = 1;
    opa = 27'd1;
    opb = 27'd2;
    #10;
    if (sum !== 27'd3 || co !== 1'b0) begin
        $display("FAIL: Test case 5 failed (Simple Addition)");
        $finish;
    end

    // Test case 6: Simple subtraction
    add = 0;
    opa = 27'd10;
    opb = 27'd3;
    #10;
    if (sum !== 27'd7 || co !== 1'b0) begin
        $display("FAIL: Test case 6 failed (Simple Subtraction)");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule