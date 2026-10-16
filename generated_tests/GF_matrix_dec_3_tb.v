`timescale 1ns/1ps

module tb_GF_matrix_dec;

    reg clk;
    reg re;
    reg [7:0] address_read;
    wire [7:0] data_out;

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
        // Initialize signals
        re = 0;
        address_read = 0;

        // Wait for a few clock cycles
        #10;

        // Test read with re low (should not update data_out)
        address_read = 8'h00; // Address 0
        #10;
        if (data_out !== 8'bx) begin
            $display("FAIL: data_out should not change when re is low");
            $finish;
        end

        // Test read with re high
        re = 1;
        #10;
        if (data_out !== 8'b00000000) begin
            $display("FAIL: Expected data_out = 00000000 at address 0, got %b", data_out);
            $finish;
        end

        // Test reading other addresses
        address_read = 8'h01; // Address 1
        #10;
        if (data_out !== 8'b00000001) begin
            $display("FAIL: Expected data_out = 00000001 at address 1, got %b", data_out);
            $finish;
        end

        address_read = 8'h02; // Address 2
        #10;
        if (data_out !== 8'b00000010) begin
            $display("FAIL: Expected data_out = 00000010 at address 2, got %b", data_out);
            $finish;
        end

        address_read = 8'h03; // Address 3
        #10;
        if (data_out !== 8'b00000100) begin
            $display("FAIL: Expected data_out = 00000100 at address 3, got %b", data_out);
            $finish;
        end

        // Test reading the last address
        address_read = 8'hFF; // Address 255
        #10;
        if (data_out !== 8'b10001110) begin
            $display("FAIL: Expected data_out = 10001110 at address 255, got %b", data_out);
            $finish;
        end

        // Test with re low again
        re = 0;
        #10;
        address_read = 8'h04; // Address 4
        #10;
        if (data_out !== 8'b10001110) begin
            $display("FAIL: data_out should not change when re is low, got %b", data_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule