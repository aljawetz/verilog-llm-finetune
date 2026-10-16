`timescale 1ns/1ps

module tb_adder;

    // Parameters
    parameter E_WIDTH = 8;
    parameter M_WIDTH = 23;

    // Testbench signals
    reg clk;
    reg rst;
    reg add_sub;
    reg [M_WIDTH-1:0] A;
    reg [M_WIDTH-1:0] B;
    reg sign_res;
    reg [E_WIDTH-1:0] exp_res;
    reg [E_WIDTH+M_WIDTH:0] sum_spc_case;
    reg s_case;
    wire [E_WIDTH+M_WIDTH+1:0] sum;

    // Instantiate the adder module
    adder #(E_WIDTH, M_WIDTH) uut (
        .clk(clk),
        .rst(rst),
        .add_sub(add_sub),
        .A(A),
        .B(B),
        .sign_res(sign_res),
        .exp_res(exp_res),
        .sum_spc_case(sum_spc_case),
        .s_case(s_case),
        .sum(sum)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 0;
        add_sub = 0;
        A = 0;
        B = 0;
        sign_res = 0;
        exp_res = 0;
        sum_spc_case = 0;
        s_case = 0;

        // Apply reset
        #10;
        rst = 1;

        // Test case 1: A + B
        A = 8'h01; // 1
        B = 8'h02; // 2
        sign_res = 0;
        exp_res = 8'h00; // exponent 0
        add_sub = 0; // addition
        #10;
        if (sum != {sign_res, exp_res, A + B}) begin
            $display("FAIL: Test case 1 failed, expected sum = %h, got sum = %h", {sign_res, exp_res, A + B}, sum);
            $finish;
        end

        // Test case 2: A - B
        A = 8'h05; // 5
        B = 8'h03; // 3
        sign_res = 0;
        exp_res = 8'h00; // exponent 0
        add_sub = 1; // subtraction
        #10;
        if (sum != {sign_res, exp_res, A - B}) begin
            $display("FAIL: Test case 2 failed, expected sum = %h, got sum = %h", {sign_res, exp_res, A - B}, sum);
            $finish;
        end

        // Test case 3: Special case
        s_case = 1;
        sum_spc_case = {8'h00, 23'h0000001}; // special case input
        #10;
        if (sum != {sum_spc_case[E_WIDTH+M_WIDTH:M_WIDTH], 1'b0, sum_spc_case[M_WIDTH-1:0]}) begin
            $display("FAIL: Test case 3 failed, expected sum = %h, got sum = %h", {sum_spc_case[E_WIDTH+M_WIDTH:M_WIDTH], 1'b0, sum_spc_case[M_WIDTH-1:0]}, sum);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule