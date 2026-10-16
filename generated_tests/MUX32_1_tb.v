`timescale 1ns/1ps

module tb_MUX32;

    reg [31:0] data1_i;
    reg [31:0] data2_i;
    reg select_i;
    wire [31:0] data_o;

    // Instantiate the MUX32 module
    MUX32 uut (
        .data1_i(data1_i),
        .data2_i(data2_i),
        .select_i(select_i),
        .data_o(data_o)
    );

    initial begin
        // Test case 1: select_i = 0, expect data_o = data1_i
        data1_i = 32'hA5A5A5A5; // Example data
        data2_i = 32'h5A5A5A5A; // Example data
        select_i = 0;
        #10; // Wait for 10 time units
        if (data_o !== data1_i) begin
            $display("FAIL: Test case 1 failed, expected %h but got %h", data1_i, data_o);
            $finish;
        end

        // Test case 2: select_i = 1, expect data_o = data2_i
        select_i = 1;
        #10; // Wait for 10 time units
        if (data_o !== data2_i) begin
            $display("FAIL: Test case 2 failed, expected %h but got %h", data2_i, data_o);
            $finish;
        end

        // Test case 3: Change data inputs with select_i = 0
        data1_i = 32'hFFFFFFFF; // New data
        data2_i = 32'h00000000; // New data
        select_i = 0;
        #10; // Wait for 10 time units
        if (data_o !== data1_i) begin
            $display("FAIL: Test case 3 failed, expected %h but got %h", data1_i, data_o);
            $finish;
        end

        // Test case 4: Change data inputs with select_i = 1
        select_i = 1;
        #10; // Wait for 10 time units
        if (data_o !== data2_i) begin
            $display("FAIL: Test case 4 failed, expected %h but got %h", data2_i, data_o);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule