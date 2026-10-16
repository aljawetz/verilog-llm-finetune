`timescale 1ns/1ps

module tb_addr_sel;

    reg clk;
    reg [6:0] addr_serial_num;
    wire [9:0] sram_raddr_w0, sram_raddr_w1, sram_raddr_w2, sram_raddr_w3;
    wire [9:0] sram_raddr_w4, sram_raddr_w5, sram_raddr_w6, sram_raddr_w7;
    wire [9:0] sram_raddr_d0, sram_raddr_d1, sram_raddr_d2, sram_raddr_d3;
    wire [9:0] sram_raddr_d4, sram_raddr_d5, sram_raddr_d6, sram_raddr_d7;

    addr_sel uut (
        .clk(clk),
        .addr_serial_num(addr_serial_num),
        .sram_raddr_w0(sram_raddr_w0),
        .sram_raddr_w1(sram_raddr_w1),
        .sram_raddr_w2(sram_raddr_w2),
        .sram_raddr_w3(sram_raddr_w3),
        .sram_raddr_w4(sram_raddr_w4),
        .sram_raddr_w5(sram_raddr_w5),
        .sram_raddr_w6(sram_raddr_w6),
        .sram_raddr_w7(sram_raddr_w7),
        .sram_raddr_d0(sram_raddr_d0),
        .sram_raddr_d1(sram_raddr_d1),
        .sram_raddr_d2(sram_raddr_d2),
        .sram_raddr_d3(sram_raddr_d3),
        .sram_raddr_d4(sram_raddr_d4),
        .sram_raddr_d5(sram_raddr_d5),
        .sram_raddr_d6(sram_raddr_d6),
        .sram_raddr_d7(sram_raddr_d7)
    );

    initial begin
        clk = 0;
        addr_serial_num = 0;

        // Test sequence
        #10 addr_serial_num = 7'd0; // Test lower bound
        #10 if (sram_raddr_w0 !== 10'd0 || sram_raddr_d0 !== 10'd0) $display("FAIL: Unexpected address for addr_serial_num = 0");
        
        #10 addr_serial_num = 7'd4; // Test for w1 and d1
        #10 if (sram_raddr_w1 !== 10'd0 || sram_raddr_d1 !== 10'd0) $display("FAIL: Unexpected address for addr_serial_num = 4");
        
        #10 addr_serial_num = 7'd8; // Test for w2 and d2
        #10 if (sram_raddr_w2 !== 10'd0 || sram_raddr_d2 !== 10'd0) $display("FAIL: Unexpected address for addr_serial_num = 8");
        
        #10 addr_serial_num = 7'd12; // Test for w3 and d3
        #10 if (sram_raddr_w3 !== 10'd0 || sram_raddr_d3 !== 10'd0) $display("FAIL: Unexpected address for addr_serial_num = 12");
        
        #10 addr_serial_num = 7'd16; // Test for w4 and d4
        #10 if (sram_raddr_w4 !== 10'd0 || sram_raddr_d4 !== 10'd0) $display("FAIL: Unexpected address for addr_serial_num = 16");
        
        #10 addr_serial_num = 7'd20; // Test for w5 and d5
        #10 if (sram_raddr_w5 !== 10'd0 || sram_raddr_d5 !== 10'd0) $display("FAIL: Unexpected address for addr_serial_num = 20");
        
        #10 addr_serial_num = 7'd24; // Test for w6 and d6
        #10 if (sram_raddr_w6 !== 10'd0 || sram_raddr_d6 !== 10'd0) $display("FAIL: Unexpected address for addr_serial_num = 24");
        
        #10 addr_serial_num = 7'd28; // Test for w7 and d7
        #10 if (sram_raddr_w7 !== 10'd0 || sram_raddr_d7 !== 10'd0) $display("FAIL: Unexpected address for addr_serial_num = 28");
        
        #10 addr_serial_num = 7'd126; // Test upper bound
        #10 if (sram_raddr_w7 !== 10'd98 || sram_raddr_d7 !== 10'd98) $display("FAIL: Unexpected address for addr_serial_num = 126");

        $display("PASS");
        $finish;
    end

    always #5 clk = ~clk; // Clock generation

endmodule