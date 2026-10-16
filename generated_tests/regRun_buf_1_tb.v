`timescale 1ns/1ps

module tb_regRun_buf;

    reg clk;
    reg rst_n;
    reg [1:0] Waddr;
    reg [1:0] Raddr;
    reg [7:0] in0;
    reg in1;
    reg [1:0] WE;
    reg RE;
    wire [7:0] out0;
    wire [7:0] out1;

    // Instantiate the module under test
    regRun_buf uut (
        .clk(clk),
        .rst_n(rst_n),
        .Waddr(Waddr),
        .Raddr(Raddr),
        .in0(in0),
        .in1(in1),
        .WE(WE),
        .RE(RE),
        .out0(out0),
        .out1(out1)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        Waddr = 0;
        Raddr = 0;
        in0 = 0;
        in1 = 0;
        WE = 2'b00;
        RE = 0;

        // Release reset
        #10;
        rst_n = 1;

        // Test case 1: Write and read back
        Waddr = 2'b00; in0 = 8'hAA; in1 = 1; WE = 2'b11; RE = 1; // Write to addr 0 and 1
        #10; // Wait for one clock cycle
        Raddr = 2'b00; // Read from addr 0
        #10; // Wait for one clock cycle
        if (out0 !== 8'hAA) begin
            $display("FAIL: Expected out0 = 0xAA, got out0 = 0x%h", out0);
            $finish;
        end
        if (out1 !== 8'h01) begin
            $display("FAIL: Expected out1 = 0x01, got out1 = 0x%h", out1);
            $finish;
        end

        // Test case 2: Write to next addresses
        Waddr = 2'b01; in0 = 8'hBB; in1 = 0; WE = 2'b11; RE = 1; // Write to addr 1 and 2
        #10; // Wait for one clock cycle
        Raddr = 2'b01; // Read from addr 1
        #10; // Wait for one clock cycle
        if (out0 !== 8'hBB) begin
            $display("FAIL: Expected out0 = 0xBB, got out0 = 0x%h", out0);
            $finish;
        end
        if (out1 !== 8'h00) begin
            $display("FAIL: Expected out1 = 0x00, got out1 = 0x%h", out1);
            $finish;
        end

        // Test case 3: Write to addr 2 and 3
        Waddr = 2'b10; in0 = 8'hCC; in1 = 1; WE = 2'b11; RE = 1; // Write to addr 2 and 3
        #10; // Wait for one clock cycle
        Raddr = 2'b10; // Read from addr 2
        #10; // Wait for one clock cycle
        if (out0 !== 8'hCC) begin
            $display("FAIL: Expected out0 = 0xCC, got out0 = 0x%h", out0);
            $finish;
        end
        if (out1 !== 8'h01) begin
            $display("FAIL: Expected out1 = 0x01, got out1 = 0x%h", out1);
            $finish;
        end

        // Test case 4: Check reset functionality
        rst_n = 0; // Assert reset
        #10;
        rst_n = 1; // Release reset
        Raddr = 2'b00; // Read after reset
        #10; // Wait for one clock cycle
        if (out0 !== 8'd0) begin
            $display("FAIL: Expected out0 = 0x00 after reset, got out0 = 0x%h", out0);
            $finish;
        end
        if (out1 !== 8'd0) begin
            $display("FAIL: Expected out1 = 0x00 after reset, got out1 = 0x%h", out1);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule