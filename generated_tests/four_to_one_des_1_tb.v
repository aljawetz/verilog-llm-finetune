`timescale 1ns/1ps

module tb_four_to_one_des;

    reg [3:0] in;
    reg [1:0] s;
    wire out;

    // Instantiate the module under test
    four_to_one_des uut (
        .out(out),
        .in(in),
        .s(s)
    );

    initial begin
        // Test case 1: Select input 0
        in = 4'b1010; // in[0] = 0, in[1] = 1, in[2] = 0, in[3] = 1
        s = 2'b00; 
        #10;
        if (out !== in[0]) $display("FAIL: Test case 1 failed, expected %b, got %b", in[0], out);

        // Test case 2: Select input 1
        s = 2'b01; 
        #10;
        if (out !== in[1]) $display("FAIL: Test case 2 failed, expected %b, got %b", in[1], out);

        // Test case 3: Select input 2
        s = 2'b10; 
        #10;
        if (out !== in[2]) $display("FAIL: Test case 3 failed, expected %b, got %b", in[2], out);

        // Test case 4: Select input 3
        s = 2'b11; 
        #10;
        if (out !== in[3]) $display("FAIL: Test case 4 failed, expected %b, got %b", in[3], out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule