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
        forever #5 clk = ~clk; // 10ns clock period
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

        // Test 1: Write data to address 0
        wen = 1;
        waddr = 4'b0000;
        wdata = 8'hAA; // Write 0xAA to address 0
        #10; // Wait for one clock cycle
        wen = 0; // Disable write

        // Test 2: Read from address 0
        ren = 1;
        raddr = 4'b0000;
        #10; // Wait for one clock cycle
        ren = 0; // Disable read

        // Check if the read data is correct
        if (rdata !== 8'hAA) begin
            $display("FAIL: Expected 0xAA at address 0, got %h", rdata);
            $finish;
        end

        // Test 3: Write data to address 1
        wen = 1;
        waddr = 4'b0001;
        wdata = 8'hBB; // Write 0xBB to address 1
        #10; // Wait for one clock cycle
        wen = 0; // Disable write

        // Test 4: Read from address 1
        ren = 1;
        raddr = 4'b0001;
        #10; // Wait for one clock cycle
        ren = 0; // Disable read

        // Check if the read data is correct
        if (rdata !== 8'hBB) begin
            $display("FAIL: Expected 0xBB at address 1, got %h", rdata);
            $finish;
        end

        // Test 5: Write data to address 2
        wen = 1;
        waddr = 4'b0010;
        wdata = 8'hCC; // Write 0xCC to address 2
        #10; // Wait for one clock cycle
        wen = 0; // Disable write

        // Test 6: Read from address 2
        ren = 1;
        raddr = 4'b0010;
        #10; // Wait for one clock cycle
        ren = 0; // Disable read

        // Check if the read data is correct
        if (rdata !== 8'hCC) begin
            $display("FAIL: Expected 0xCC at address 2, got %h", rdata);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule