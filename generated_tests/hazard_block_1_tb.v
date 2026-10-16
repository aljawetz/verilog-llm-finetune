`timescale 1ns/1ps

module tb_hazard_block;

    // Inputs
    reg EX_mem_read;
    reg EX_mem_write;
    reg MEM_mem_read;
    reg MEM_mem_write;
    reg ID_mem_read;
    reg ID_mem_write;
    reg [2:0] EX_rt_addr;
    reg [2:0] ID_rs_addr;
    reg [2:0] ID_rt_addr;
    reg [2:0] MEM_rt_addr;
    reg [4:0] ID_op_code;

    // Outputs
    wire stall;

    // Instantiate the Unit Under Test (UUT)
    hazard_block uut (
        .EX_mem_read(EX_mem_read),
        .EX_mem_write(EX_mem_write),
        .MEM_mem_read(MEM_mem_read),
        .MEM_mem_write(MEM_mem_write),
        .ID_mem_read(ID_mem_read),
        .ID_mem_write(ID_mem_write),
        .EX_rt_addr(EX_rt_addr),
        .ID_rs_addr(ID_rs_addr),
        .ID_rt_addr(ID_rt_addr),
        .MEM_rt_addr(MEM_rt_addr),
        .ID_op_code(ID_op_code),
        .stall(stall)
    );

    // Clock generation
    reg clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        EX_mem_read = 0;
        EX_mem_write = 0;
        MEM_mem_read = 0;
        MEM_mem_write = 0;
        ID_mem_read = 0;
        ID_mem_write = 0;
        EX_rt_addr = 3'b000;
        ID_rs_addr = 3'b000;
        ID_rt_addr = 3'b000;
        MEM_rt_addr = 3'b000;
        ID_op_code = 5'b00000;

        // Wait for a clock cycle
        @(posedge clk);

        // Test case 1: No hazards
        EX_mem_read = 0; ID_rs_addr = 3'b001; ID_rt_addr = 3'b010;
        @(posedge clk);
        if (stall !== 0) $display("FAIL: Expected stall = 0, got %b", stall);

        // Test case 2: Load hazard with EX stage
        EX_mem_read = 1; EX_rt_addr = 3'b001; ID_rs_addr = 3'b001; // Hazard detected
        @(posedge clk);
        if (stall !== 1) $display("FAIL: Expected stall = 1, got %b", stall);

        // Test case 3: Load hazard with MEM stage
        EX_mem_read = 0; MEM_mem_read = 1; MEM_rt_addr = 3'b010; ID_rt_addr = 3'b010; // Hazard detected
        @(posedge clk);
        if (stall !== 1) $display("FAIL: Expected stall = 1, got %b", stall);

        // Test case 4: No hazards again
        EX_mem_read = 0; MEM_mem_read = 0; ID_rs_addr = 3'b011; ID_rt_addr = 3'b100;
        @(posedge clk);
        if (stall !== 0) $display("FAIL: Expected stall = 0, got %b", stall);

        // Test case 5: Multiple hazards
        EX_mem_read = 1; EX_rt_addr = 3'b011; MEM_mem_read = 1; MEM_rt_addr = 3'b011; ID_rs_addr = 3'b011; ID_rt_addr = 3'b100; // Hazard detected
        @(posedge clk);
        if (stall !== 1) $display("FAIL: Expected stall = 1, got %b", stall);

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule