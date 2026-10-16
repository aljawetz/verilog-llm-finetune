`timescale 1ns/1ps

module tb_decode;

    // Parameters
    parameter E_WIDTH = 8;
    parameter M_WIDTH = 23;
    
    // Inputs
    reg clk;
    reg rst;
    reg [E_WIDTH+M_WIDTH:0] A;
    reg [E_WIDTH+M_WIDTH:0] B;

    // Outputs
    wire sign_A;
    wire sign_B;
    wire [E_WIDTH-1:0] exp_A;
    wire [E_WIDTH-1:0] exp_B;
    wire [M_WIDTH-1:0] mnt_A; 
    wire [M_WIDTH-1:0] mnt_B; 
    wire [E_WIDTH-1:0] exp_diff;
    wire gt_lt;

    // Instantiate the Unit Under Test (UUT)
    decode #(E_WIDTH, M_WIDTH) uut (
        .clk(clk), 
        .rst(rst), 
        .A(A), 
        .B(B), 
        .sign_A(sign_A), 
        .sign_B(sign_B), 
        .exp_A(exp_A), 
        .exp_B(exp_B), 
        .mnt_A(mnt_A), 
        .mnt_B(mnt_B), 
        .exp_diff(exp_diff), 
        .gt_lt(gt_lt)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 0;
        A = 0;
        B = 0;
        #10;
        
        // Release reset
        rst = 1;
        #10;

        // Test case 1: A = 0x40000000 (2.0), B = 0x40000000 (2.0)
        A = 32'h40000000; // 2.0
        B = 32'h40000000; // 2.0
        #10;
        if (sign_A !== 0 || sign_B !== 0 || exp_A !== 127 || exp_B !== 127 || mnt_A !== 0 && mnt_B !== 0 || exp_diff !== 0 || gt_lt !== 0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: A = 0x40800000 (4.0), B = 0x40000000 (2.0)
        A = 32'h40800000; // 4.0
        B = 32'h40000000; // 2.0
        #10;
        if (sign_A !== 0 || sign_B !== 0 || exp_A !== 129 || exp_B !== 127 || mnt_A !== 0 && mnt_B !== 0 || exp_diff !== 2 || gt_lt !== 1) 
            $display("FAIL: Test case 2 failed");
        
        // Test case 3: A = 0xC0800000 (-4.0), B = 0x40000000 (2.0)
        A = 32'hC0800000; // -4.0
        B = 32'h40000000; // 2.0
        #10;
        if (sign_A !== 1 || sign_B !== 0 || exp_A !== 129 || exp_B !== 127 || mnt_A !== 0 && mnt_B !== 0 || exp_diff !== 2 || gt_lt !== 0) 
            $display("FAIL: Test case 3 failed");
        
        // Test case 4: A = 0x40000000 (2.0), B = 0xC0000000 (-1.0)
        A = 32'h40000000; // 2.0
        B = 32'hC0000000; // -1.0
        #10;
        if (sign_A !== 0 || sign_B !== 1 || exp_A !== 127 || exp_B !== 126 || mnt_A !== 0 && mnt_B !== 0 || exp_diff !== 1 || gt_lt !== 1) 
            $display("FAIL: Test case 4 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule