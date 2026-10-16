`timescale 1ns/1ps

module tb_MESI_protocol;

    reg clk;
    reg Pr_Rd_1, Bus_Rd_C_1, Bus_Rd_IC_1, Pr_Wr_1, Bus_RdX_1, Bus_Upgr_1, Flush_1, Flush_Opt_1;
    reg [31:0] effective_address_1;
    reg Pr_Rd_2, Bus_Rd_C_2, Bus_Rd_IC_2, Pr_Wr_2, Bus_RdX_2, Bus_Upgr_2, Flush_2, Flush_Opt_2;
    reg [31:0] effective_address_2;
    reg [1:0] Cache1_pointer, Cache2_pointer;

    wire [31:0] Memory_data [1:32];
    wire [31:0] Cache1_data [0:3];
    wire [31:0] Cache2_data [0:3];

    MESI_protocol uut (
        .clk(clk),
        .Pr_Rd_1(Pr_Rd_1),
        .Bus_Rd_C_1(Bus_Rd_C_1),
        .Bus_Rd_IC_1(Bus_Rd_IC_1),
        .Pr_Wr_1(Pr_Wr_1),
        .Bus_RdX_1(Bus_RdX_1),
        .Bus_Upgr_1(Bus_Upgr_1),
        .Flush_1(Flush_1),
        .Flush_Opt_1(Flush_Opt_1),
        .effective_address_1(effective_address_1),
        .Pr_Rd_2(Pr_Rd_2),
        .Bus_Rd_C_2(Bus_Rd_C_2),
        .Bus_Rd_IC_2(Bus_Rd_IC_2),
        .Pr_Wr_2(Pr_Wr_2),
        .Bus_RdX_2(Bus_RdX_2),
        .Bus_Upgr_2(Bus_Upgr_2),
        .Flush_2(Flush_2),
        .Flush_Opt_2(Flush_Opt_2),
        .effective_address_2(effective_address_2),
        .Cache1_pointer(Cache1_pointer),
        .Cache2_pointer(Cache2_pointer)
    );

    initial begin
        clk = 0;
        Pr_Rd_1 = 0; Bus_Rd_C_1 = 0; Bus_Rd_IC_1 = 0; Pr_Wr_1 = 0; 
        Bus_RdX_1 = 0; Bus_Upgr_1 = 0; Flush_1 = 0; Flush_Opt_1 = 0;
        effective_address_1 = 0;
        Pr_Rd_2 = 0; Bus_Rd_C_2 = 0; Bus_Rd_IC_2 = 0; Pr_Wr_2 = 0; 
        Bus_RdX_2 = 0; Bus_Upgr_2 = 0; Flush_2 = 0; Flush_Opt_2 = 0;
        effective_address_2 = 0;
        Cache1_pointer = 0; Cache2_pointer = 0;

        // Initialize memory
        uut.Memory_data[5] = 8;

        // Test sequence
        #10;
        Pr_Rd_1 = 1; Bus_Rd_IC_1 = 1; effective_address_1 = 5; // Processor 1 reads from memory
        #10;
        if (uut.Cache1_data[0] !== 8) $display("FAIL: Processor 1 read from memory failed");
        
        Pr_Wr_1 = 1; Bus_RdX_1 = 1; effective_address_1 = 5; // Processor 1 writes to cache
        #10;
        if (uut.Cache1_data[0] !== 8) $display("FAIL: Processor 1 write to cache failed");

        Pr_Rd_2 = 1; Bus_Rd_C_2 = 1; effective_address_2 = 5; // Processor 2 reads from Processor 1's cache
        #10;
        if (uut.Cache2_data[0] !== 8) $display("FAIL: Processor 2 read from Processor 1's cache failed");

        $display("PASS");
        $finish;
    end

    always #5 clk = ~clk; // Clock generation

endmodule