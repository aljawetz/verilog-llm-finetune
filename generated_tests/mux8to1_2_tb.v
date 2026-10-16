`timescale 1ns/1ps

module tb_mux8to1;
    reg [7:0] in;
    reg [2:0] sel;
    wire out;

    // Instantiate the module under test
    mux8to1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: Select input 0
        in = 8'b00000001; // in[0] = 1
        sel = 3'b000;     // Select in[0]
        #10;
        if (out !== in[0]) $display("FAIL: Test case 1 failed, expected %b but got %b", in[0], out);

        // Test case 2: Select input 1
        in = 8'b00000010; // in[1] = 1
        sel = 3'b001;     // Select in[1]
        #10;
        if (out !== in[1]) $display("FAIL: Test case 2 failed, expected %b but got %b", in[1], out);

        // Test case 3: Select input 2
        in = 8'b00000100; // in[2] = 1
        sel = 3'b010;     // Select in[2]
        #10;
        if (out !== in[2]) $display("FAIL: Test case 3 failed, expected %b but got %b", in[2], out);

        // Test case 4: Select input 3
        in = 8'b00001000; // in[3] = 1
        sel = 3'b011;     // Select in[3]
        #10;
        if (out !== in[3]) $display("FAIL: Test case 4 failed, expected %b but got %b", in[3], out);

        // Test case 5: Select input 4
        in = 8'b00010000; // in[4] = 1
        sel = 3'b100;     // Select in[4]
        #10;
        if (out !== in[4]) $display("FAIL: Test case 5 failed, expected %b but got %b", in[4], out);

        // Test case 6: Select input 5
        in = 8'b00100000; // in[5] = 1
        sel = 3'b101;     // Select in[5]
        #10;
        if (out !== in[5]) $display("FAIL: Test case 6 failed, expected %b but got %b", in[5], out);

        // Test case 7: Select input 6
        in = 8'b01000000; // in[6] = 1
        sel = 3'b110;     // Select in[6]
        #10;
        if (out !== in[6]) $display("FAIL: Test case 7 failed, expected %b but got %b", in[6], out);

        // Test case 8: Select input 7
        in = 8'b10000000; // in[7] = 1
        sel = 3'b111;     // Select in[7]
        #10;
        if (out !== in[7]) $display("FAIL: Test case 8 failed, expected %b but got %b", in[7], out);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule