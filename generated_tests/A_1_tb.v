`timescale 1ns/1ps

module tb_A;

    reg rst;
    reg clk;
    reg [31:0] read_data_1;
    reg [31:0] read_data_2;
    wire [31:0] Aread_data_1;
    wire [31:0] Aread_data_2;

    // Instantiate the module under test (uut)
    A uut (
        .rst(rst),
        .clk(clk),
        .read_data_1(read_data_1),
        .read_data_2(read_data_2),
        .Aread_data_1(Aread_data_1),
        .Aread_data_2(Aread_data_2)
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
        read_data_1 = 32'hA5A5A5A5;
        read_data_2 = 32'h5A5A5A5A;

        // Apply reset
        rst = 0;
        #10; // Wait for 10ns
        if (Aread_data_1 !== 32'b0 || Aread_data_2 !== 32'b0) begin
            $display("FAIL: Registers not reset to zero on reset");
            $finish;
        end

        // Release reset
        rst = 1;
        #10; // Wait for 10ns

        // Apply data
        #10;
        read_data_1 = 32'hDEADBEEF;
        read_data_2 = 32'hBEEFDEAD;
        #10; // Wait for clock edge

        if (Aread_data_1 !== 32'hDEADBEEF || Aread_data_2 !== 32'hBEEFDEAD) begin
            $display("FAIL: Registers did not update with new data");
            $finish;
        end

        // Apply new data
        #10;
        read_data_1 = 32'h12345678;
        read_data_2 = 32'h87654321;
        #10; // Wait for clock edge

        if (Aread_data_1 !== 32'h12345678 || Aread_data_2 !== 32'h87654321) begin
            $display("FAIL: Registers did not update with new data");
            $finish;
        end

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule