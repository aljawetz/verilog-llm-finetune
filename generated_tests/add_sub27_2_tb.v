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
    // Test case 1: Addition without carry
    add = 1;
    opa = 27'd10;
    opb = 27'd20;
    #10;
    if (sum !== 27'd30 || co !== 1'b0) begin
        $display("FAIL: Test case 1 failed (Addition without carry)");
        $finish;
    end

    // Test case 2: Addition with carry
    opa = 27'd134217727; // Max value for 27 bits
    opb = 27'd1;
    #10;
    if (sum !== 27'd0 || co !== 1'b1) begin
        $display("FAIL: Test case 2 failed (Addition with carry)");
        $finish;
    end

    // Test case 3: Subtraction without borrow
    add = 0;
    opa = 27'd30;
    opb = 27'd10;
    #10;
    if (sum !== 27'd20 || co !== 1'b0) begin
        $display("FAIL: Test case 3 failed (Subtraction without borrow)");
        $finish;
    end

    // Test case 4: Subtraction with borrow
    opa = 27'd10;
    opb = 27'd20;
    #10;
    if (sum !== 27'd4294967286 || co !== 1'b1) begin // 10 - 20 = -10 in 27-bit representation
        $display("FAIL: Test case 4 failed (Subtraction with borrow)");
        $finish;
    end

    // Test case 5: Edge case addition
    opa = 27'd0;
    opb = 27'd0;
    #10;
    if (sum !== 27'd0 || co !== 1'b0) begin
        $display("FAIL: Test case 5 failed (Edge case addition)");
        $finish;
    end

    // Test case 6: Edge case subtraction
    add = 0;
    opa = 27'd0;
    opb = 27'd0;
    #10;
    if (sum !== 27'd0 || co !== 1'b0) begin
        $display("FAIL: Test case 6 failed (Edge case subtraction)");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule