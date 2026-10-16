`timescale 1ns/1ps

module tb_simple_dp_ram;

    reg clk;
    reg wen;
    reg [3:0] waddr;
    reg [7:0] wdata;
    reg ren;
    reg [3:0] raddr;
    wire [7:0] rdata;

    // Instantiate the module under test (uut)
    simple_dp_ram uut (
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
        // Initialize signals
        wen = 0;
        ren = 0;
        waddr = 0;
        wdata = 0;
        raddr = 0;

        // Test 1: Write and read back the same data
        wen = 1; 
        waddr = 4'b0001; 
        wdata = 8'hAA; 
        #10; // Wait for one clock cycle
        wen = 0; 

        ren = 1; 
        raddr = 4'b0001; 
        #10; // Wait for one clock cycle
        ren = 0; 

        if (rdata !== 8'hAA) begin
            $display("FAIL: Read data does not match written data");
            $finish;
        end

        // Test 2: Write another value and read it back
        wen = 1; 
        waddr = 4'b0010; 
        wdata = 8'h55; 
        #10; // Wait for one clock cycle
        wen = 0; 

        ren = 1; 
        raddr = 4'b0010; 
        #10; // Wait for one clock cycle
        ren = 0; 

        if (rdata !== 8'h55) begin
            $display("FAIL: Read data does not match written data");
            $finish;
        end

        // Test 3: Ensure previous data is not overwritten
        ren = 1; 
        raddr = 4'b0001; 
        #10; // Wait for one clock cycle
        ren = 0; 

        if (rdata !== 8'hAA) begin
            $display("FAIL: Read data does not match expected previous data");
            $finish;
        end

        // Test 4: Write to a different address and read back
        wen = 1; 
        waddr = 4'b0011; 
        wdata = 8'hFF; 
        #10; // Wait for one clock cycle
        wen = 0; 

        ren = 1; 
        raddr = 4'b0011; 
        #10; // Wait for one clock cycle
        ren = 0; 

        if (rdata !== 8'hFF) begin
            $display("FAIL: Read data does not match written data");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule