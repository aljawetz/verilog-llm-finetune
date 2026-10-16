`timescale 1ns/1ps

module tb_spc_case;

    // Parameters
    parameter E_WIDTH = 8;
    parameter M_WIDTH = 23;
    parameter BIAS = 1 << (E_WIDTH-1);
    parameter nBIAS = BIAS + 1'b1;

    // Testbench signals
    reg clk;
    reg rst;
    reg sign_A;
    reg sign_B;
    reg [E_WIDTH-1:0] exp_A;
    reg [E_WIDTH-1:0] exp_B;
    reg [E_WIDTH-1:0] exp_A_org;
    reg [E_WIDTH-1:0] exp_B_org;
    reg [M_WIDTH-1:0] mnt_A;
    reg [M_WIDTH-1:0] mnt_B;
    wire [E_WIDTH+M_WIDTH:0] res;
    wire s_case;

    // Instantiate the Unit Under Test (UUT)
    spc_case #(E_WIDTH, M_WIDTH) uut (
        .clk(clk),
        .rst(rst),
        .sign_A(sign_A),
        .sign_B(sign_B),
        .exp_A(exp_A),
        .exp_B(exp_B),
        .exp_A_org(exp_A_org),
        .exp_B_org(exp_B_org),
        .mnt_A(mnt_A),
        .mnt_B(mnt_B),
        .res(res),
        .s_case(s_case)
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
        sign_A = 0;
        sign_B = 0;
        exp_A = 0;
        exp_B = 0;
        exp_A_org = 0;
        exp_B_org = 0;
        mnt_A = 0;
        mnt_B = 0;

        // Release reset
        #10 rst = 1;

        // Test case 1: Both inputs are NaN
        exp_A = BIAS; mnt_A = 1; exp_B = 0; mnt_B = 0; // A is NaN
        #10;
        if (res[E_WIDTH+M_WIDTH] !== 1'b0 || res[E_WIDTH+M_WIDTH-1:M_WIDTH] !== (BIAS<<1) - 1 || res[M_WIDTH-1:0] !== 1 || s_case !== 1'b1)
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: A is Inf, B is Inf with different signs
        exp_A = BIAS; mnt_A = 0; sign_A = 0; exp_B = BIAS; mnt_B = 0; sign_B = 1; // A is +Inf, B is -Inf
        #10;
        if (res[E_WIDTH+M_WIDTH] !== 0 || res[E_WIDTH+M_WIDTH-1:M_WIDTH] !== exp_A_org || res[M_WIDTH-1:0] !== 1 || s_case !== 1'b1)
            $display("FAIL: Test case 2 failed");

        // Test case 3: A is Inf, B is finite
        exp_A = BIAS; mnt_A = 0; sign_A = 0; exp_B = 1; mnt_B = 0; // A is +Inf, B is finite
        #10;
        if (res[E_WIDTH+M_WIDTH] !== 0 || res[E_WIDTH+M_WIDTH-1:M_WIDTH] !== exp_A_org || res[M_WIDTH-1:0] !== 0 || s_case !== 1'b1)
            $display("FAIL: Test case 3 failed");

        // Test case 4: A is Zero, B is finite
        exp_A = nBIAS; mnt_A = 0; sign_A = 0; exp_B = 1; mnt_B = 0; // A is +0, B is finite
        #10;
        if (res[E_WIDTH+M_WIDTH] !== sign_B || res[E_WIDTH+M_WIDTH-1:M_WIDTH] !== exp_B_org || res[M_WIDTH-1:0] !== 0 || s_case !== 1'b1)
            $display("FAIL: Test case 4 failed");

        // Test case 5: Both inputs are finite
        exp_A = 1; mnt_A = 1; sign_A = 0; exp_B = 1; mnt_B = 1; sign_B = 0; // Both are finite
        #10;
        if (res !== 0 || s_case !== 1'b0)
            $display("FAIL: Test case 5 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule