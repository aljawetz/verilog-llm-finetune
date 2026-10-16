`timescale 1ns/1ps

module tb_GF_matrix_dec;

    reg clk;
    reg re;
    reg [1:0] address_read;
    wire [1:0] data_out;

    // Instantiate the module under test
    GF_matrix_dec uut (
        .clk(clk),
        .re(re),
        .address_read(address_read),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset and address
        re = 0;
        address_read = 2'b00;

        // Wait for a few clock cycles
        #10;

        // Activate read enable
        re = 1;

        // Test all addresses from 0 to 3
        #10 address_read = 2'b00; // Expect data_out = 2'b00
        #10 if (data_out !== 2'b00) $display("FAIL: Expected data_out = 2'b00 at address 0");

        #10 address_read = 2'b01; // Expect data_out = 2'b01
        #10 if (data_out !== 2'b01) $display("FAIL: Expected data_out = 2'b01 at address 1");

        #10 address_read = 2'b10; // Expect data_out = 2'b10
        #10 if (data_out !== 2'b10) $display("FAIL: Expected data_out = 2'b10 at address 2");

        #10 address_read = 2'b11; // Expect data_out = 2'b00
        #10 if (data_out !== 2'b00) $display("FAIL: Expected data_out = 2'b00 at address 3");

        // Additional tests for other addresses
        #10 address_read = 2'b00; // Expect data_out = 2'b00
        #10 if (data_out !== 2'b00) $display("FAIL: Expected data_out = 2'b00 at address 0 again");

        #10 address_read = 2'b01; // Expect data_out = 2'b01
        #10 if (data_out !== 2'b01) $display("FAIL: Expected data_out = 2'b01 at address 1 again");

        // End of test
        $display("PASS");
        $finish;
    end

endmodule