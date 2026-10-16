`timescale 1ns/1ps

module tb_Adder;

    reg [31:0] data1_in;
    reg [31:0] data2_in;
    wire [31:0] data_o;

    // Instantiate the Adder module
    Adder uut (
        .data1_in(data1_in),
        .data2_in(data2_in),
        .data_o(data_o)
    );

    initial begin
        // Test case 1: Simple addition
        data1_in = 32'h00000001; // 1
        data2_in = 32'h00000001; // 1
        #10;
        if (data_o !== 32'h00000002) begin
            $display("FAIL: Test case 1 failed, expected 2 but got %h", data_o);
            $finish;
        end

        // Test case 2: Adding zero
        data1_in = 32'h00000000; // 0
        data2_in = 32'h00000001; // 1
        #10;
        if (data_o !== 32'h00000001) begin
            $display("FAIL: Test case 2 failed, expected 1 but got %h", data_o);
            $finish;
        end

        // Test case 3: Large numbers
        data1_in = 32'hFFFFFFFF; // Max 32-bit value
        data2_in = 32'h00000001; // 1
        #10;
        if (data_o !== 32'h00000000) begin // Overflow case
            $display("FAIL: Test case 3 failed, expected 0 but got %h", data_o);
            $finish;
        end

        // Test case 4: Negative numbers (using two's complement)
        data1_in = 32'h80000000; // -2147483648
        data2_in = 32'h80000000; // -2147483648
        #10;
        if (data_o !== 32'h00000000) begin // Overflow case
            $display("FAIL: Test case 4 failed, expected 0 but got %h", data_o);
            $finish;
        end

        // Test case 5: Random values
        data1_in = 32'h12345678;
        data2_in = 32'h87654321;
        #10;
        if (data_o !== 32'h99999999) begin
            $display("FAIL: Test case 5 failed, expected 99999999 but got %h", data_o);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule