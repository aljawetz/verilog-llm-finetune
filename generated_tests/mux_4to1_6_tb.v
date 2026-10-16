`timescale 1ns/1ps

module tb_mux_4to1;

    reg [3:0] data_in;
    reg [1:0] sel_n;
    wire data_out;

    // Instantiate the module under test (uut)
    mux_4to1 uut (
        .data_in(data_in),
        .sel_n(sel_n),
        .data_out(data_out)
    );

    initial begin
        // Test case 1: Select input 0
        data_in = 4'b1010; // data_in = 10
        sel_n = 2'b00;     // select input 0
        #10;
        if (data_out !== data_in[0]) begin
            $display("FAIL: Test case 1 failed, expected %b but got %b", data_in[0], data_out);
            $finish;
        end

        // Test case 2: Select input 1
        sel_n = 2'b01;     // select input 1
        #10;
        if (data_out !== data_in[1]) begin
            $display("FAIL: Test case 2 failed, expected %b but got %b", data_in[1], data_out);
            $finish;
        end

        // Test case 3: Select input 2
        sel_n = 2'b10;     // select input 2
        #10;
        if (data_out !== data_in[2]) begin
            $display("FAIL: Test case 3 failed, expected %b but got %b", data_in[2], data_out);
            $finish;
        end

        // Test case 4: Select input 3
        sel_n = 2'b11;     // select input 3
        #10;
        if (data_out !== data_in[3]) begin
            $display("FAIL: Test case 4 failed, expected %b but got %b", data_in[3], data_out);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule