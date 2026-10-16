`timescale 1ns/1ps

module tb_regfile;
    reg clk;
    reg rst;
    reg wr;
    reg [4:0] sr1, sr2, dr;
    reg [31:0] wr_data;
    wire [31:0] rd_data1, rd_data2;

    // Instantiate the module under test
    regfile uut (
        .rd_data1(rd_data1),
        .rd_data2(rd_data2),
        .wr_data(wr_data),
        .sr1(sr1),
        .sr2(sr2),
        .dr(dr),
        .wr(wr),
        .rst(rst),
        .clk(clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        wr = 0;
        sr1 = 0;
        sr2 = 0;
        dr = 0;
        wr_data = 0;

        // Reset the register file
        #10;
        rst = 0;

        // Test writing to register 1
        wr = 1;
        dr = 5'b00001; // Write to register 1
        wr_data = 32'hA5A5A5A5; // Data to write
        #10; // Wait for one clock cycle
        wr = 0; // Disable write

        // Check if register 1 has the correct value
        sr1 = 5'b00001; // Read from register 1
        #10;
        if (rd_data1 !== 32'hA5A5A5A5) begin
            $display("FAIL: Register 1 did not hold the expected value");
            $finish;
        end

        // Test writing to register 2
        wr = 1;
        dr = 5'b00010; // Write to register 2
        wr_data = 32'h5A5A5A5A; // Data to write
        #10; // Wait for one clock cycle
        wr = 0; // Disable write

        // Check if register 2 has the correct value
        sr2 = 5'b00010; // Read from register 2
        #10;
        if (rd_data2 !== 32'h5A5A5A5A) begin
            $display("FAIL: Register 2 did not hold the expected value");
            $finish;
        end

        // Test reset functionality
        rst = 1; // Assert reset
        #10;
        rst = 0; // Deassert reset

        // Check if registers are reset
        sr1 = 5'b00001; // Read from register 1
        sr2 = 5'b00010; // Read from register 2
        #10;
        if (rd_data1 !== 32'h00000000) begin
            $display("FAIL: Register 1 did not reset to zero");
            $finish;
        end
        if (rd_data2 !== 32'h00000000) begin
            $display("FAIL: Register 2 did not reset to zero");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule