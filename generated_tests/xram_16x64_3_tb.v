`timescale 1ns/1ps

module tb_xram_16x64;

    reg clk;
    reg wr;
    reg [3:0] wr_addr;
    reg [63:0] wr_data;
    reg [3:0] rd_addr;
    wire [63:0] rd_data;

    // Instantiate the module under test (uut)
    xram_16x64 uut (
        .clk(clk),
        .wr(wr),
        .wr_addr(wr_addr),
        .wr_data(wr_data),
        .rd_addr(rd_addr),
        .rd_data(rd_data)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        wr = 0;
        wr_addr = 0;
        wr_data = 64'h0;
        rd_addr = 0;

        // Test 1: Write to address 0
        wr = 1; 
        wr_addr = 4'b0000; 
        wr_data = 64'hDEADBEEFDEADBEEF; 
        #10; // Wait for one clock cycle
        wr = 0; // Disable write

        // Test 2: Read from address 0
        rd_addr = 4'b0000; 
        #10; // Wait for one clock cycle
        if (rd_data !== 64'hDEADBEEFDEADBEEF) begin
            $display("FAIL: Read data from address 0 did not match expected value.");
            $finish;
        end

        // Test 3: Write to address 1
        wr = 1; 
        wr_addr = 4'b0001; 
        wr_data = 64'hCAFEBABECAFEBABE; 
        #10; // Wait for one clock cycle
        wr = 0; // Disable write

        // Test 4: Read from address 1
        rd_addr = 4'b0001; 
        #10; // Wait for one clock cycle
        if (rd_data !== 64'hCAFEBABECAFEBABE) begin
            $display("FAIL: Read data from address 1 did not match expected value.");
            $finish;
        end

        // Test 5: Write to address 2
        wr = 1; 
        wr_addr = 4'b0010; 
        wr_data = 64'h1234567890ABCDEF; 
        #10; // Wait for one clock cycle
        wr = 0; // Disable write

        // Test 6: Read from address 2
        rd_addr = 4'b0010; 
        #10; // Wait for one clock cycle
        if (rd_data !== 64'h1234567890ABCDEF) begin
            $display("FAIL: Read data from address 2 did not match expected value.");
            $finish;
        end

        // Test 7: Write to address 3 and read back
        wr = 1; 
        wr_addr = 4'b0011; 
        wr_data = 64'hFFFFFFFFFFFFFFFF; 
        #10; // Wait for one clock cycle
        wr = 0; // Disable write

        rd_addr = 4'b0011; 
        #10; // Wait for one clock cycle
        if (rd_data !== 64'hFFFFFFFFFFFFFFFF) begin
            $display("FAIL: Read data from address 3 did not match expected value.");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule