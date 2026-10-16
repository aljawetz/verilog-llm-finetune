`timescale 1ns/1ps

module tb_ram_16x64;

reg clk;
reg wr;
reg rd;
reg [3:0] wr_addr;
reg [3:0] rd_addr;
reg [63:0] wr_data;
wire [63:0] rd_data;

ram_16x64 uut (
    .clk(clk),
    .wr(wr),
    .wr_addr(wr_addr),
    .wr_data(wr_data),
    .rd(rd),
    .rd_addr(rd_addr),
    .rd_data(rd_data)
);

initial begin
    // Initialize signals
    clk = 0;
    wr = 0;
    rd = 0;
    wr_addr = 0;
    rd_addr = 0;
    wr_data = 0;

    // Test sequence
    // Write data to address 0
    wr_addr = 4'b0000;
    wr_data = 64'hDEADBEEFDEADBEEF;
    wr = 1;
    #10; // Wait for one clock cycle
    wr = 0;
    #10; // Wait for another clock cycle

    // Read data from address 0
    rd_addr = 4'b0000;
    rd = 1;
    #10; // Wait for one clock cycle
    rd = 0;
    #10; // Wait for another clock cycle

    // Check if the read data is correct
    if (rd_data !== 64'hDEADBEEFDEADBEEF) begin
        $display("FAIL: Read data mismatch at address 0");
        $finish;
    end

    // Write data to address 1
    wr_addr = 4'b0001;
    wr_data = 64'hCAFEBABECAFEBABE;
    wr = 1;
    #10; // Wait for one clock cycle
    wr = 0;
    #10; // Wait for another clock cycle

    // Read data from address 1
    rd_addr = 4'b0001;
    rd = 1;
    #10; // Wait for one clock cycle
    rd = 0;
    #10; // Wait for another clock cycle

    // Check if the read data is correct
    if (rd_data !== 64'hCAFEBABECAFEBABE) begin
        $display("FAIL: Read data mismatch at address 1");
        $finish;
    end

    // Write data to address 2
    wr_addr = 4'b0010;
    wr_data = 64'h1234567890ABCDEF;
    wr = 1;
    #10; // Wait for one clock cycle
    wr = 0;
    #10; // Wait for another clock cycle

    // Read data from address 2
    rd_addr = 4'b0010;
    rd = 1;
    #10; // Wait for one clock cycle
    rd = 0;
    #10; // Wait for another clock cycle

    // Check if the read data is correct
    if (rd_data !== 64'h1234567890ABCDEF) begin
        $display("FAIL: Read data mismatch at address 2");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

// Clock generation
always #5 clk = ~clk;

endmodule