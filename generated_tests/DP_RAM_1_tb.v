`timescale 1ns/1ps

module tb_DP_RAM;

    reg clk;
    reg we;
    reg re;
    reg [1:0] address_read;
    reg [1:0] address_write;
    reg [1:0] data_in;
    wire [1:0] data_out;

    // Instantiate the module under test (uut)
    DP_RAM uut (
        .clk(clk),
        .we(we),
        .re(re),
        .address_read(address_read),
        .address_write(address_write),
        .data_in(data_in),
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
        we = 0;
        re = 0;
        address_read = 0;
        address_write = 0;
        data_in = 0;

        // Test 1: Write to address 0 and read back
        we = 1; 
        address_write = 2'b00; 
        data_in = 2'b11; 
        #10; // Wait for one clock cycle
        we = 0; // Disable write

        // Read from address 0
        re = 1; 
        address_read = 2'b00; 
        #10; // Wait for one clock cycle
        re = 0; // Disable read

        if (data_out !== 2'b11) begin
            $display("FAIL: Expected data_out = 2'b11, got data_out = %b", data_out);
            $finish;
        end

        // Test 2: Write to address 1 and read back
        we = 1; 
        address_write = 2'b01; 
        data_in = 2'b10; 
        #10; // Wait for one clock cycle
        we = 0; // Disable write

        // Read from address 1
        re = 1; 
        address_read = 2'b01; 
        #10; // Wait for one clock cycle
        re = 0; // Disable read

        if (data_out !== 2'b10) begin
            $display("FAIL: Expected data_out = 2'b10, got data_out = %b", data_out);
            $finish;
        end

        // Test 3: Write to address 2 and read back
        we = 1; 
        address_write = 2'b10; 
        data_in = 2'b01; 
        #10; // Wait for one clock cycle
        we = 0; // Disable write

        // Read from address 2
        re = 1; 
        address_read = 2'b10; 
        #10; // Wait for one clock cycle
        re = 0; // Disable read

        if (data_out !== 2'b01) begin
            $display("FAIL: Expected data_out = 2'b01, got data_out = %b", data_out);
            $finish;
        end

        // Test 4: Read from an uninitialized address (address 3)
        re = 1; 
        address_read = 2'b11; 
        #10; // Wait for one clock cycle
        re = 0; // Disable read

        if (data_out !== 2'b00) begin
            $display("FAIL: Expected data_out = 2'b00, got data_out = %b", data_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule