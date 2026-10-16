`timescale 1ns/1ps

module tb_addr_sel;

    reg clk;
    reg [6:0] addr_serial_num;
    wire [9:0] sram_raddr_w0;
    wire [9:0] sram_raddr_w1;
    wire [9:0] sram_raddr_d0;
    wire [9:0] sram_raddr_d1;

    // Instantiate the module under test (uut)
    addr_sel uut (
        .clk(clk),
        .addr_serial_num(addr_serial_num),
        .sram_raddr_w0(sram_raddr_w0),
        .sram_raddr_w1(sram_raddr_w1),
        .sram_raddr_d0(sram_raddr_d0),
        .sram_raddr_d1(sram_raddr_d1)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Test case 1: addr_serial_num = 0
        addr_serial_num = 7'd0; 
        #10;
        if (sram_raddr_w0 !== 10'd0 || sram_raddr_w1 !== 10'd127 || sram_raddr_d0 !== 10'd0 || sram_raddr_d1 !== 10'd127) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: addr_serial_num = 4
        addr_serial_num = 7'd4; 
        #10;
        if (sram_raddr_w0 !== 10'd4 || sram_raddr_w1 !== 10'd0 || sram_raddr_d0 !== 10'd4 || sram_raddr_d1 !== 10'd0) 
            $display("FAIL: Test case 2 failed");
        
        // Test case 3: addr_serial_num = 98
        addr_serial_num = 7'd98; 
        #10;
        if (sram_raddr_w0 !== 10'd98 || sram_raddr_w1 !== 10'd91 || sram_raddr_d0 !== 10'd98 || sram_raddr_d1 !== 10'd91) 
            $display("FAIL: Test case 3 failed");
        
        // Test case 4: addr_serial_num = 102
        addr_serial_num = 7'd102; 
        #10;
        if (sram_raddr_w0 !== 10'd102 || sram_raddr_w1 !== 10'd98 || sram_raddr_d0 !== 10'd102 || sram_raddr_d1 !== 10'd98) 
            $display("FAIL: Test case 4 failed");
        
        // Test case 5: addr_serial_num = 127
        addr_serial_num = 7'd127; 
        #10;
        if (sram_raddr_w0 !== 10'd127 || sram_raddr_w1 !== 10'd127 || sram_raddr_d0 !== 10'd127 || sram_raddr_d1 !== 10'd127) 
            $display("FAIL: Test case 5 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule