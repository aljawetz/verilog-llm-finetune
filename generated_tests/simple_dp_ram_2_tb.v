`timescale 1ns/1ps

module tb_simple_dp_ram;

    // Parameters
    parameter DW = 8;
    parameter AW = 4;

    // Inputs
    reg clk;
    reg wen;
    reg [AW-1:0] waddr;
    reg [DW-1:0] wdata;
    reg ren;
    reg [AW-1:0] raddr;

    // Outputs
    wire [DW-1:0] rdata;

    // Instantiate the Unit Under Test (UUT)
    simple_dp_ram #(
        .DW(DW),
        .AW(AW)
    ) uut (
        .clk(clk),
        .wen(wen),
        .waddr(waddr),
        .wdata(wdata),
        .ren(ren),
        .raddr(raddr),
        .rdata(rdata)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        wen = 0;
        ren = 0;
        waddr = 0;
        wdata = 0;
        raddr = 0;

        // Wait for global reset
        #10;

        // Test 1: Write and Read back the same data
        wen = 1; 
        waddr = 4'b0001; 
        wdata = 8'hAA; 
        #10; // Wait for one clock cycle
        wen = 0; // Disable write

        ren = 1; 
        raddr = 4'b0001; 
        #10; // Wait for one clock cycle
        ren = 0; // Disable read

        if (rdata !== 8'hAA) begin
            $display("FAIL: Expected rdata = 0xAA, got rdata = 0x%h", rdata);
            $finish;
        end

        // Test 2: Write another value and read it back
        wen = 1; 
        waddr = 4'b0010; 
        wdata = 8'h55; 
        #10; // Wait for one clock cycle
        wen = 0; // Disable write

        ren = 1; 
        raddr = 4'b0010; 
        #10; // Wait for one clock cycle
        ren = 0; // Disable read

        if (rdata !== 8'h55) begin
            $display("FAIL: Expected rdata = 0x55, got rdata = 0x%h", rdata);
            $finish;
        end

        // Test 3: Ensure previous address does not affect new reads
        ren = 1; 
        raddr = 4'b0001; 
        #10; // Wait for one clock cycle
        ren = 0; // Disable read

        if (rdata !== 8'hAA) begin
            $display("FAIL: Expected rdata = 0xAA, got rdata = 0x%h", rdata);
            $finish;
        end

        // Test 4: Write to a different address and read back
        wen = 1; 
        waddr = 4'b0011; 
        wdata = 8'hFF; 
        #10; // Wait for one clock cycle
        wen = 0; // Disable write

        ren = 1; 
        raddr = 4'b0011; 
        #10; // Wait for one clock cycle
        ren = 0; // Disable read

        if (rdata !== 8'hFF) begin
            $display("FAIL: Expected rdata = 0xFF, got rdata = 0x%h", rdata);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule